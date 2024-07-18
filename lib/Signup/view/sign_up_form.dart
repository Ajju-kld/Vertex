import 'package:flutter/material.dart';
import 'package:vertex/Signup/view/sign_up_form_widget.dart';
class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
        const Header(),
           const SizedBox(
            height: 40,
          ),
          const UserNameField(),
          const SizedBox(
            height: 20,
          ),
          const EmailField(),
          const SizedBox(
            height: 20,
          ),
          const PasswordField(),
          const SizedBox(
            height: 20,
          ),
          const ConfirmPasswordField(),
          const SizedBox(
            height: 20,
          ),
          const TermsAndConditions(),
          const SizedBox(
            height: 30,
          ),
          SignupButton(),
         const   SizedBox(
            height: 40,
          ),
         const  Footer(),
        ],
      ),
    );
  }
}
