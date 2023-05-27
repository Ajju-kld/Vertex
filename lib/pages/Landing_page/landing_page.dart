import 'package:flutter/material.dart';
import 'package:vertex/pages/Login/Login.dart';
import 'package:vertex/pages/Sign_up/Sign_up.dart';
import '../utils.dart';

import '../Login/Login.dart';


class FocusNotifier extends ChangeNotifier {
  bool _isFocused = false;

  bool get isFocused => _isFocused;

  set isFocused(bool value) {
    _isFocused = value;
    notifyListeners();
  }
}

class Landing_Page extends StatelessWidget {
 Landing_Page({super.key});
final FocusNotifier focusNotifier = FocusNotifier();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 15, 26, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,10, 0,20),
                  child: Image.asset('assets/images/vertex_logo.png',width: 300,height: 350,),
                ),
                Hero(tag: 'vertex',
                  child: Image.asset(
                    "assets/images/VERTEX.png",
                    width: 250,
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40,0, 40),
                  child: Hero(tag: "Login_btn",
                    child: SizedBox(
                      width: 310,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                         Navigator.of(context)
                              .push(MaterialPageRoute(builder: (ctx) {
                            return Login();
                          }));
                        },
                                  
                                  
                        
                        style: ButtonStyle(
                           
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 0, 162, 143)),
                            overlayColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(211, 0, 0, 0)),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11),
                                side: BorderSide(
                                    width: 3,
                                    color: Color.fromARGB(136, 0, 162, 143))))),
                        child: Text("LOGIN",style: TextStyle(color: focusNotifier._isFocused ? Color.fromARGB(255, 0, 162, 143):Colors.white,fontSize: 20),),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 310,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                            Navigator.of(context)
                              .push(MaterialPageRoute(builder: (ctx) {
                            return Sign_up();
                          }));
                        },
                        style: ButtonStyle(
                          
                              
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 0, 162, 143)),
                            overlayColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(211, 0, 0, 0)),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11),
                                side: BorderSide(
                                    width: 3,
                                    color: Color.fromARGB(218, 0, 162, 143))))),
                        child: Text("SIGN UP",style: TextStyle(color: Colors.white,fontSize: 20),selectionColor: button,),
                      ),
                    ),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(175, 10, 0, 0),
                   child: Text("not registered yet ?",style: TextStyle(color: Colors.white),),
                 ) ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
