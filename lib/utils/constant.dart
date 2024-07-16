import 'package:flutter/material.dart';

class UIConstants {
  // Colors
  static const Color primaryColor = Color(0xFF0000FF);
  static const Color secondaryColor = Color(0xFFFF0000);
  static const Color backgroundColor = Color.fromRGBO(30, 30, 39, 1);

  // Constraints
  static const double padding = 16.0;
  static const double borderRadius = 8.0;
  static const double fontSize = 16.0;


  // create method for inputborder decoration
  static InputDecoration formInputDecoration(String hintText, String? errorText, Icon icon) {
    return InputDecoration(
      prefixIcon: Padding(
        padding: const EdgeInsets.fromLTRB(10,0,20,0),
        child: icon,
      ),
      fillColor: Colors.black,
      filled: true,
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 0, 0, 0),
            width: 3,
          )),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: const BorderSide(
            color: Color.fromARGB(218, 0, 162, 143),
            width: 3,
          )),
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      errorText:errorText,
      errorStyle: const TextStyle(fontSize: 0),
      constraints: const BoxConstraints.tightFor(width: 310, height: 60),
    );
  }
}