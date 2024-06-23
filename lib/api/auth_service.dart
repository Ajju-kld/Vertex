import 'package:flutter/material.dart'; // Add this line

import 'package:vertex/api/api_service.dart';
import 'package:vertex/api/error_handler.dart';

class Auth_service {
  final ApiService _apiService = ApiService();

  Future<dynamic> login(
      String username, String password, BuildContext context) async {
    // Add BuildContext parameter
    try {
      final response = await _apiService
          .post('auth/login', {'username': username, 'password': password});
      if (response.statusCode == 200) {
        return response.data['token'];
      } else {
        return ErrorHandler.showErrorDialog(context, response.data['message']);
      }
    } catch (e) {
      return ErrorHandler.showErrorDialog(context, 'Failed to login: $e');
    }
  }

  Future<dynamic> register(String email, String password,String username,String , BuildContext context) async {
    try {
      final response = await _apiService
          .post('auth/register', {'email': email, 'password': password,'username':username});
      return response;
    } catch (e) {
      ErrorHandler.showErrorDialog(context, 'Failed to register: $e');
    }
  }
}
