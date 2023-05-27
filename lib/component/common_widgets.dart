import 'package:flutter/material.dart';


import '../pages/utils.dart';

SizedBox textField(
        {bool obstrucct = false,
        String hint = 'Enter you name',
        Icon icon = const Icon(
          Icons.person_3_outlined,
          color: Colors.white,
        ),
        bool is_pass = false,
        String? Function(String?)? validator,
        TextEditingController? controller,
        Function(bool)? togglePasswordVisibility}) =>
    SizedBox(
      height: 60,
      width: 300,
      child: TextFormField(
        cursorHeight: 25,
        obscuringCharacter: '*',
        controller: controller,
        obscureText: obstrucct,
        validator: validator,
        autovalidateMode: AutovalidateMode.always,
        style:
            const TextStyle(color: Colors.white, height: 25 / 20, fontSize: 20),
        decoration: InputDecoration(
            suffix: is_pass
                ? IconButton(
                    icon: obstrucct
                        ? const Icon(
                            Icons.visibility_off,
                            color: Colors.white,
                          )
                        : const Icon(
                            Icons.visibility,
                            color: Colors.white,
                          ),
                    onPressed: () => togglePasswordVisibility!(!obstrucct),
                  )
                : null,
            hintText: hint,
            prefixIcon: icon,
            fillColor: const Color.fromARGB(255, 0, 0, 0),
            filled: true,
            errorStyle: TextStyle(color: Colors.red),
            hintStyle: const TextStyle(color: Colors.white, fontSize: 15),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(9))),
      ),
    );

SizedBox btn_(
    {void Function()? onPressed, bool check = true, required String? title}) {
  return SizedBox(
    width: 270,
    height: 45,
    child: ElevatedButton(
      onPressed: check ? onPressed : null,
      style: ButtonStyle(
          backgroundColor: check
              ? MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 0, 162, 143))
              : MaterialStateProperty.all<Color>(
                  const Color.fromARGB(114, 0, 162, 143)),
          overlayColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(211, 0, 0, 0)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11),
              side: BorderSide(
                  width: 3,
                  color: check
                      ? const Color.fromARGB(218, 0, 162, 143)
                      : const Color.fromARGB(35, 0, 162, 143))))),
      child: Text(
        title!,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    ),
  );
}

TextButton txtBtn({Text? hint, void Function()? onPressed}) {
  return TextButton(
      style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color>(
              const Color.fromRGBO(14, 15, 26, 1))),
      onPressed: onPressed,
      child: hint!);
}

class Follower_Board extends StatelessWidget {
  Follower_Board({
    Key? key,
  }) : super(key: key);

  var text_style = const TextStyle(
      color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 15, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 50,
              child: Image.asset(
                'assets/images/vertex_logo.png',
                width: 180,
              ),
              backgroundColor: backgroundColor,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Straxs',
              style: text_style,
            )
          ],
        ),
      ),
      Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 5, 10),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildStatColumn(7, "POST"),
                    buildStatColumn(44, "FOLLOWERS"),
                    buildStatColumn(74, "FOLLOWING"),
                  ],
                ),
              ],
            ),
          ))
    ]);
  }

  Column buildStatColumn(int num, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Text(
            label,
            style: text_style,
          ),
        ),
        Text(
          num.toString(),
          style: text_style,
        ),
      ],
    );
  }
}

// funtion to create messaage and unfollow

Row messageUnfollow({void Function()? message, void Function()? unfollow}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextButton(
        onPressed: message,
        child: const Text(
          'message',
          style: txtbtn,
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromARGB(255, 29, 29, 30),
            ),
            minimumSize: MaterialStateProperty.all<Size>(Size(104, 32))),
      ),
      SizedBox(
        width: 24,
      ),
      TextButton(
        onPressed: unfollow,
        child: const Text(
          'unfollow',
          style: txtbtn,
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromARGB(255, 29, 29, 30),
            ),
            minimumSize: MaterialStateProperty.all<Size>(Size(104, 32))),
      ),
      SizedBox(
        width: 20,
      )
    ],
  );
}

//function for follow button
Row followBtn({void Function()? follow}) {
  return Row(
    children: [
      const SizedBox(
        width: 12,
      ),
      TextButton(
        onPressed: follow,
        child: const Text(
          'Follow',
          style: txtbtn,
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(secondary),
            minimumSize: MaterialStateProperty.all<Size>(const Size(240, 32))),
      ),
    ],
  );
}



