import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vertex/pages/Login/Login.dart';

import '../utils.dart';
import '../../component/common_widgets.dart';

import 'package:firebase_auth/firebase_auth.dart';

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Login(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(0.0, -1.0);
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

class Sign_up extends StatefulWidget {
  const Sign_up({super.key});

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  bool isChecked = false;
  bool _show_password = false;
  final email = TextEditingController();
  final name = TextEditingController();
  final password = TextEditingController();
  final confirm_password = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    name.dispose();
    password.dispose();
    confirm_password.dispose();
    super.dispose();
  }

  Future<void> signUpWithEmail() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);

      Navigator.pop(context);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'email-already-in-use') {
        alreadyRegistered();
      } else if (e.code == 'weak-password') {
        weakPassword();
      } else if (e.code == 'invalid-email') {
        invalidEmail();
      }
    }
  }

  void alreadyRegistered() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Colors.black45,
            title: Center(
                child: Text(
              'You have already register account in this email',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
          );
        });
  }

  void weakPassword() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Colors.black45,
            title: Center(
                child: Text(
              'Your password is weak enter strong one',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
          );
        });
  }

  void invalidEmail() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Colors.black45,
            title: Center(
                child: Text(
              'Invalid Email',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text(
                    'Hey There ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text(
                    'Create an account',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 25),
                    child: textField(controller: name)),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 25),
                    child: textField(
                        hint: 'Enter you email',
                        icon: const Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                        ),
                        controller: email)),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 25),
                    child: textField(
                        hint: 'Password',
                        icon: const Icon(Icons.key_outlined, color: Colors.white),
                        obstrucct: true,
                        controller: password)),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 25),
                    child: textField(
                      is_pass: true,
                      togglePasswordVisibility: (value) {
                        setState(() {
                          _show_password = value;
                        });
                      },
                      hint: 'Confirm Password',
                      icon: const Icon(
                        Icons.key_outlined,
                        color: Colors.white,
                      ),
                      obstrucct: _show_password,
                      controller: confirm_password,
                      
                      validator: (text) {
                        if (text != password.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                          value: isChecked,
                          onChanged: (bool? newValue) {
                            setState(() {
                              isChecked = newValue!;
                            });
                          },
                          overlayColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 255, 255, 255)),
                          checkColor: const Color.fromARGB(255, 0, 0, 0),
                          activeColor: const Color.fromARGB(255, 0, 0, 0),
                          fillColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(242, 255, 255, 255)),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.blue, width: 2.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      RichText(
                          text: const TextSpan(
                              style: TextStyle(fontSize: 12, color: Colors.white),
                              text: 'By creating  an account, you agree to our\n',
                              children: [
                            TextSpan(
                                text: 'Conditons of Use',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.white)),
                            TextSpan(
                                text: ' and ',
                                style: TextStyle(color: Colors.white)),
                            TextSpan(
                                text: 'Privacy Notice',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.white))
                          ]))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Hero(
                      tag: 'sign_up',
                      child: btn_(
                          title: 'SIGN_UP',
                          onPressed: () => signUpWithEmail(),
                          check: isChecked)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Hero(
                    tag: 'vertex',
                    child: Image.asset(
                      "assets/images/VERTEX.png",
                      width: 250,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Text(
                    'Already have an account ? ',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
                txtBtn(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(_createRoute());
                    },
                    hint: const Text(
                      'login',
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          fontSize: 20,
                          letterSpacing: 1.5),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
