import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vertex/pages/Landing_page/landing_page.dart';
import 'package:vertex/pages/Login/Login.dart';
import 'package:vertex/pages/Sign_up/Sign_up.dart';
import 'package:vertex/pages/home_page/home.dart';
import 'package:vertex/pages/inner_pages/Chat_interface.dart';
import 'package:vertex/pages/inner_pages/profile.dart';
import './pages/home_page/home_page.dart';
import 'firebase_options.dart';
import 'pages/inner_pages/Chat.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const Main_page(),
      routes: {
        'login':(context) {return const Login();
      }
      ,
        'sign_up':(context){
          return const Sign_up();
        
      },
      'profile':(context) => const Profile()
      ,'chat':(context) => const Chat_Page(),
      'chat_screen':(context)=> const Chat_Screen()
      }
      
    );
  }
}

class Main_page extends StatelessWidget {
  const Main_page({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
body: StreamBuilder<User?>(
  stream: FirebaseAuth.instance.authStateChanges(),
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return const Homepage();
    }else{
return Landing_Page();


    }
  },
),

    );
  }
}

