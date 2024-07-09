import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vertex/model/user.dart';

class UserRepository {
  User? _user;

  Future<User?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_user != null) return _user;

    // Implement your logic to retrieve the user
    // For example, make an API call to get the user
    Dio dio = Dio();

    String token = prefs.getString('token') ?? '';

    // add bearer token from shared preferences
    dio.options.headers['Authorization'] = 'Bearer $token';

    Response response = await dio.get('https://api.example.com/api/auth/getself');
    if (response.statusCode == 200) {
      // If the API call is successful, parse the response
      User user = User.fromJson(response.data['user']);
      _user = user;
      return user;
    } else {
      // If the API call fails, return null
      return null;
    }
    // If the user is successfully retrieved, update the _user variable
  }
}
