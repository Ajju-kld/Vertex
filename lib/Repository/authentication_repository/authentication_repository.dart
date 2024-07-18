import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vertex/Repository/service/auth.dart';
import 'package:vertex/Repository/service/error.dart';


enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final AuthApi _authApi;
  final _controller = StreamController<AuthenticationStatus>();

  AuthenticationRepository() : _authApi = AuthApi('http://143.244.141.7');

  Stream<AuthenticationStatus> get status async* {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('vertex-token');
    if (token != null && await _authApi.verifyToken(token)) {
      yield AuthenticationStatus.authenticated;
    } else {
      yield AuthenticationStatus.unauthenticated;
    }

    yield* _controller.stream;
  }

  Future<void> login(
      {required String username, required String password}) async {
    try {
      final response = await _authApi.login(username, password);
      final token = response['token'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('vertex-token', token.toString());
      _controller.add(AuthenticationStatus.authenticated);
    } catch (e) {
      _controller.add(AuthenticationStatus.unauthenticated);
    }
  }

  Future<void> signUp({
    required String username,
    required String password,
    required String email,
  }) async {
    try {
      final response = await _authApi.register(username, password, email);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('vertex-token', response['token'].toString());
       
    } on AuthException catch (e) {
      _controller.add(AuthenticationStatus.unauthenticated);
      throw AuthException(statusCode:e.statusCode, message:e.message);
    }
  }

  void logOut() {
    deleteToken();
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  Future<void> forgottenPassword(String email) async {
    try {
      await _authApi.forgotPassword(email);
      _controller.add(AuthenticationStatus.authenticated);
    } catch (e) {
      _controller.add(AuthenticationStatus.unauthenticated);
    }
  }

  Future<void> deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('vertex-token');
  }

  void dispose() => _controller.close();
}
