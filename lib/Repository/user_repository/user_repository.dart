import 'dart:convert';
import 'dart:io'; // Add this line to import the 'File' class

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart'; // Add this line to import the 'basename' method
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vertex/Repository/user_repository/user_model.dart';

class UserRepository {
  User? user;

  Future<User?> getUser() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('vertex-token');

      var client = http.Client();
      final response = await client.get(
        Uri.parse('http://143.244.141.7/auth/self/'),
        headers: {'Authorization': 'Bearer $token'},
      );

      print('inside the get user');
      if (response.statusCode == 200) {
        print(response.body);

        user = User.fromJson(jsonDecode(response.body)['user']);
        return user!;
      } else {
        throw Exception('Failed to load user');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load user');
    }
  }
  Future<void> updateUser( File image) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('vertex-token');

      var request = http.MultipartRequest(
        'PUT',
        Uri.parse('http://143.244.141.7/auth/setProfile'),
      );
      request.headers['Authorization'] = 'Bearer $token';
      

     var stream = http.ByteStream(image.openRead());
      var length = await image.length();
      var multipartFile = http.MultipartFile(
        'profile', // Changed from 'post' to 'profile_picture'
        stream,
        length,
        filename: basename(image.path),
        contentType: MediaType('image', 'jpeg'),
      );
      request.files.add(multipartFile);

      var response = await request.send();
      if (response.statusCode == 200) {
      final data=jsonDecode(await response.stream.bytesToString());
      print(data);
        return;
      } else {
        print(response.reasonPhrase);
        throw Exception('Failed to update user');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to update user');
    }
  }
}