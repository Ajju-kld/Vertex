// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vertex/component/common_widgets.dart';
import 'package:vertex/pages/Sign_up/Sign_up.dart';

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Sign_up(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();
 bool showPass=true;
 
  final password = TextEditingController();
  final focus = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    password.dispose();
    super.dispose();
  }

  Future<void> login() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      Navigator.pop(context);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        wrongEmail();
      } else if (e.code == 'wrong-password') {
        wrongPassword();
      }
    }
  }

  void wrongEmail() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Colors.black45,
            title: Center(
                child: Text(
              'You have not register account in this email',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
          );
        });
  }

  void wrongPassword() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Colors.black45,
            title: Center(
                child: Text(
              'wrong password_enter correct password',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
          );
        });
  }


  void  _show_password(){
setState(() {
  showPass=false;
});

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'login',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromRGBO(14, 15, 26, 1),
        ),
        backgroundColor: const Color.fromRGBO(14, 15, 26, 1),
        body: SafeArea(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 40, 0, 100),
                      child: SvgPicture.asset(
                        'assets/images/LOGIN 1.svg',
                        width: 200,
                        height: 300,
                      ),
                    ), // login picture padding
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: textField(
                          hint: 'Enter the email',
                          controller: email,
                          icon: const Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                          )),
                    ), // email field padding
              
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: textField(hint: 'Enter the Password',controller: password,icon: const Icon(Icons.key_outlined,color: Colors.white,),obstrucct: showPass,is_pass:true,
                        togglePasswordVisibility: (visible) {
                          setState(() {
                            showPass = visible;
                          });
                        },
                      ),
                    ), // password fild padding
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 0, 0),
                      child: txtBtn(
                        hint: const Text(
                          'Forgotten Password ?',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 40, 0, 3),
                      child: Hero(
                        tag: "Login_btn",
                        child: btn_(
                          title: 'LOGIN',
                          onPressed: () {
                            focus.unfocus();
                            login();
                          },
                        ),
                      ),
                    ),
                    txtBtn(
                        onPressed: () => {
                              Navigator.pop(context),
                              Navigator.of(context).push(_createRoute())
                            },
                        hint: const Text(
                          "New User? Register",
                          style: TextStyle(color: Colors.white),
                        )), //button padding
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
