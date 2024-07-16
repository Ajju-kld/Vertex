import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vertex/Repository/user_repository/user_model.dart';

class UserRepository{
  User? user;
  
  Future<User?> getUser() async{
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token= prefs.getString('vertex-token');


      var dio = Dio();
      final response = await dio.get('http://localhost:5000/api/auth/self/', options: Options(
        headers: {'Authorization': 'Bearer $token'}));
   print('inside the get user');
      if (response.statusCode == 200) {
        print(response.data);
        user = User.fromJson(response.data['user']);
        return user!;
      } else {
        throw Exception('Failed to load user');
      }

    } catch (e) {
      print(e);
      throw Exception('Failed to load user');     
    }
  }

  Future<void> updateUser(User user) async{
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token= prefs.getString('vertex-token');

      var dio = Dio();
      final response = await dio.put('https://api.letsbuildthatapp.com/youtube/user', options: Options(
        headers: {'Authorization': 'Bearer $token'}), data: user.toJson());

      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception('Failed to update user');
      }

    } catch (e) {
      throw Exception('Failed to update user');     
    }
  }


}