export 'authentication_repository.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  Dio dio = Dio();
  final _controller = StreamController<AuthenticationStatus>();
  Stream<AuthenticationStatus> get status => _controller.stream;

  Future<void> authenticateWithToken(String token) async {
    // Perform authentication logic using the token
    // For example, make an API call to validate the token
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? '';
    dio.options.headers['Authorization'] = 'Bearer' + token;
    Response response =
        await dio.get('https://api.example.com/api/auth/validate');
    if (response.statusCode == 200) {
      _controller.add(AuthenticationStatus.authenticated);
    } else {
      _controller.add(AuthenticationStatus.unauthenticated);
    }

    // If authentication is successful, update the status

    // If authentication fails, update the status accordingly
    // _controller.add(AuthenticationStatus.unauthenticated);
  }

  Future<void> authenticateWithLogin(String username, String password) async {
    // Perform login logic using the provided username and password
    // For example, make an API call to authenticate the user and retrieve the token

    try {
      // Make an API call to authenticate the user and retrieve the token
      String token = await _authenticateUser(username, password);

      // Store the token for future authentication
      await _storeToken(token);

    } catch (e) {
      // If login fails, update the status accordingly
      _controller.add(AuthenticationStatus.unauthenticated);
    }
  }

  Future<String> _authenticateUser(String username, String password) async {
    // Implement your logic to authenticate the user and retrieve the token
    // For example, make an API call to authenticate the user and retrieve the token
    // Return the token as a Future<String>
    Response response =
      await  dio.post('http:ipaddress/api/auth/login', data: {'username': username, 'password': password});
    if (response.statusCode == 200) {
      return response.data['token'];
    } else {
      throw Exception('Failed to authenticate user');
    }
  }

  Future<void> _storeToken(String token) async {
    // Implement your logic to store the token
    // For example, use shared preferences or secure storage to store the token
    // Return a Future<void> to indicate the completion of token storage
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);

    
  }

  void logOut() async{
    // Implement your logic to log out the user
    // For example, clear the stored token
    // Update the status to unauthenticated
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    _controller.add(AuthenticationStatus.unauthenticated);
  }
  void dispose() {
    _controller.close();
  } 

}
