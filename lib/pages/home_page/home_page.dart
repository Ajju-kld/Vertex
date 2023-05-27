import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:story_view/widgets/story_view.dart';

import 'package:vertex/pages/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  void logout() {
    FirebaseAuth.instance.signOut();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            Text(
              'you have logged in as' + user.email!,
              style: const TextStyle(color: Colors.white),
            ),
            ElevatedButton(
                onPressed: () {
                  logout();
                },
                child: const Text('logout'))
          ],
        ),
      ),
      backgroundColor: backgroundColor,
    );
  }
}
