import 'package:flutter/material.dart';
import 'package:vertex/Login/view/login_page.dart';

import 'package:vertex/Signup/view/signup.dart';
import 'package:vertex/utils/constant.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});
  static Route<void> route() {

    return MaterialPageRoute<void>(builder: (_)=>LandingPage());

  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:UIConstants.backgroundColor,
      body: LandingPageBody(),
    );
  }
}

class LandingPageBody extends StatelessWidget {
  const LandingPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          ImageBanner(),
          SizedBox(
            height: 50,
          ),
        Column(
          children: [
            LandingPageButton(),
            SizedBox(height: 30),
            SignupPageButton(),
         Text(
                "not registered yet ?",
                style: TextStyle(fontSize: 18, color: Colors.white),
              )
          ],
        ),
        
        ],
      ),
    );
  }
}

class ImageBanner extends StatelessWidget {
  const ImageBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/vertex_logo.png',
         
   
        ),
        Image.asset('assets/images/VERTEX.png', width: 300, height: 200),
      ],
    );
  }
}

// login button

class LandingPageButton extends StatelessWidget {
  const LandingPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'login',
      child: SizedBox(
        width: 310,
        height: 60,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                  const Color.fromARGB(255, 0, 162, 143)),
              overlayColor: WidgetStateProperty.all<Color>(
                  const Color.fromARGB(211, 0, 0, 0)),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                  side: const BorderSide(
                      width: 3, color: Color.fromARGB(218, 0, 162, 143))))),
          onPressed: () {
            Navigator.push(context, LoginPage.route());
          },
          child: Text('Login', style: TextStyle(fontSize: 18,color: Colors.white),),
        ),
      ),
    );
  }
}

// sign up button
class SignupPageButton extends StatelessWidget {
  const SignupPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'signup',
      child: SizedBox(
         width: 310,
        height: 60,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                  const Color.fromARGB(255, 0, 162, 143)),
              overlayColor: WidgetStateProperty.all<Color>(
                  const Color.fromARGB(211, 0, 0, 0)),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                  side: const BorderSide(
                      width: 3, color: Color.fromARGB(218, 0, 162, 143))))),
          onPressed: () {
                   Navigator.push(context,SignUP.route());
          },
          child: const Text('Signup',style: TextStyle(color: Colors.white,fontSize: 18),),
        ),
      ),
    );
  }
}
