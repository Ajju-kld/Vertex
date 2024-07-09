import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vertex/screens/home_page.dart';
import 'package:vertex/screens/landing_page.dart';
import 'package:vertex/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<SharedPreferences> _pref;
  bool? islogin;

  @override
  void initState() {
    super.initState();
    _pref = SharedPreferences.getInstance();
    _pref.then((SharedPreferences prefs) {
      setState(() {
        islogin = prefs.getBool('islogin')??false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: islogin == true ? Home_Page() : Landing_Page(),
    );
  }
}
