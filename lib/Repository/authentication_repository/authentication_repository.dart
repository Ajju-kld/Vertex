import 'dart:async';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();
  Stream<AuthenticationStatus> get status async* {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('vertex-token');
    if (token != null && await tokenVerify(token)) {
      yield AuthenticationStatus.authenticated;
    } else {
      yield AuthenticationStatus.unauthenticated;
    }

    yield* _controller.stream;
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    try {
      var dio = Dio();

      final reponse =
          await dio.post('http://localhost:5000/api/auth/login', data: {
        'email': username,
        'password': password,
      });

      print(reponse);
      if (reponse.statusCode == 200) {
        print(reponse.data['token']);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('vertex-token', reponse.data['token']);

        _controller.add(AuthenticationStatus.authenticated);
      } else {
        print('error');
        _controller.add(AuthenticationStatus.unauthenticated);
      }
    } catch (e) {
      print(e.toString());
      _controller.add(AuthenticationStatus.unauthenticated);
    }
  }

  void logOut() {
    // clear the token
    deleteToken();
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  Future<void> register({
    required String username,
    required String password,
    required String email,
  }) async {
    try {
      var dio = Dio();
      final response = await dio
          .post('https://api.letsbuildthatapp.com/youtube/register', data: {
        'username': username,
        'password': password,
        'email': email,
      });

      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('vertex-token', response.data['token']);
        _controller.add(AuthenticationStatus.authenticated);
      } else {
        _controller.add(AuthenticationStatus.unauthenticated);
      }
    } catch (e) {
      _controller.add(AuthenticationStatus.unauthenticated);
    }
  }

  void dispose() {
    _controller.close();
  }

  Future<bool> tokenVerify(String token) async {
    var dio = Dio();
    final response =
        await dio.get('http://localhost:5000/api/auth/self/',
            options: Options(headers: {
              'Authorization': 'Bearer $token',
            }));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('vertex-token');
  }

  Future<void> forgottenpassword(String email) async {
    try {
      var dio = Dio();
      final response = await dio.post(
          'https://api.letsbuildthatapp.com/youtube/forgotPassword',
          data: {
            'email': email,
          });

      if (response.statusCode == 200) {
        _controller.add(AuthenticationStatus.authenticated);
      } else {
        _controller.add(AuthenticationStatus.unauthenticated);
      }
    } catch (e) {
      _controller.add(AuthenticationStatus.unauthenticated);
    }
  }
}
