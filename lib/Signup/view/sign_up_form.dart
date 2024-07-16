import 'package:flutter/material.dart';
import 'package:vertex/Signup/view/sign_up_form_widget.dart';
class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
           SizedBox(
            height: 40,
          ),
        Header(),
           SizedBox(
            height: 40,
          ),
          UserNameField(),
          SizedBox(
            height: 20,
          ),
          EmailField(),
          SizedBox(
            height: 20,
          ),
          PasswordField(),
          SizedBox(
            height: 20,
          ),
          ConfirmPasswordField(),
          SizedBox(
            height: 20,
          ),
          TermsAndConditions(),
          SizedBox(
            height: 30,
          ),
          SignupButton(),
           SizedBox(
            height: 40,
          ),
          Footer(),
        ],
      ),
    );
  }
}
