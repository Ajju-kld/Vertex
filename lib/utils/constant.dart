import 'package:flutter/material.dart';

class UIConstants {
  // Colors
  static const Color primaryColor = Color.fromARGB(218, 0, 162, 143);
  static const Color secondaryColor = Color(0xFFFF0000);
  static const Color backgroundColor = Color.fromRGBO(30, 30, 39, 1);

  // Constraints
  static const double padding = 16.0;
  static const double borderRadius = 8.0;
  static const double fontSize = 16.0;

  // create method for inputborder decoration
  static InputDecoration formInputDecoration(
      String hintText, String? errorText, Icon icon) {
    return InputDecoration(
      prefixIcon: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
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
      errorText: errorText,
      errorStyle: const TextStyle(fontSize: 0),
      constraints: const BoxConstraints.tightFor(width: 310, height: 60),
    );
  }

  // primary button style
  static ButtonStyle primaryButtonStyle({required bool isValid}) {
    return ButtonStyle(
        backgroundColor: isValid
            ? WidgetStateProperty.all<Color>(
                const Color.fromARGB(255, 0, 162, 143))
            : WidgetStateProperty.all<Color>(
                const Color.fromARGB(114, 0, 162, 143)),
        overlayColor:
            WidgetStateProperty.all<Color>(const Color.fromARGB(211, 0, 0, 0)),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
            side: const BorderSide(
                width: 3, color: Color.fromARGB(218, 0, 162, 143)))));
  }

  // Textbutton style
  static ButtonStyle textButtonStyle() {
    return ButtonStyle(
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      backgroundColor: WidgetStateProperty.all<Color>(Colors.black),
      side: WidgetStateProperty.all<BorderSide>(
        const BorderSide(color: UIConstants.primaryColor, width: 1.0),
      ),
    );
  }
}
