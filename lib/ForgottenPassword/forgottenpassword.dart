import 'package:flutter/material.dart';

class Forgottenpassword extends StatelessWidget {
  const Forgottenpassword({super.key});
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => Forgottenpassword());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 15, 26, 1),
      body: ForgottenpasswordBody(),
    );
  }
}

class ForgottenpasswordBody extends StatelessWidget {
  const ForgottenpasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageBanner(),
          SizedBox(
            height: 50,
          ),
          Column(
            children: [
              ForgottenpasswordButton(),
              SizedBox(height: 30),
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
          'assets/images/LOGIN 1.svg',
          height: 200,
          width: 200,
        ),
      ],
    );
  }
}

class ForgottenpasswordButton extends StatelessWidget {
  const ForgottenpasswordButton({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 310,
      height: 60,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 0, 162, 143)),
            overlayColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(211, 0, 0, 0)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11),
                side: const BorderSide(
                    width: 3, color: Color.fromARGB(218, 0, 162, 143))))),
        key: const Key('loginForm_continue_raisedButton'),
        onPressed: () {
          //context.read<LoginBloc>().add(const LoginSubmitted());
        },
        child: const Text('Forgotten Password'),
      ),
    );
  }
}
