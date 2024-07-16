import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  static Route<void> route(){
    return MaterialPageRoute<void>(builder: (_)=>const SignUp());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(14, 15, 26, 1),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
       Text(
            "Sign Up",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          ],
        ),
      ),
    );
  }
}