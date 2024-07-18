import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vertex/Repository/service/error.dart';
import 'api_base.dart';

class AuthApi extends ApiBase {
  AuthApi(String baseUrl) : super(baseUrl);

  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await post('/auth/login', body: {
      'email': username,
      'password': password,
    });

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw AuthException(
        statusCode: response.statusCode,
        message: 'Login failed',
      );
    }
  }

  Future<Map<String, dynamic>> register(
      String username, String password, String email) async {
    final response = await post('/auth/register', body: {
      'username': username,
      'password': password,
      'email': email,
    });

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      final responseJson = json.decode(response.body);
      print(responseJson);
      throw AuthException(
        statusCode: responseJson['statusCode'] ?? response.statusCode,
        message:responseJson['message'] ?? 'Registration failed',
      );
    }
  }

  Future<bool> verifyToken(String token) async {
    final response = await get('/auth/self/', headers: {
      'Authorization': 'Bearer $token',
    });

    return response.statusCode == 200;
  }

  Future<Map<String, dynamic>> forgotPassword(String email) async {
    final response = await post('/youtube/forgotPassword', body: {
      'email': email,
    });

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to process forgot password request');
    }
  }
}
