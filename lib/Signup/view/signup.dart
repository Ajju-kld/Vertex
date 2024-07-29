import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vertex/Repository/authentication_repository/authentication_repository.dart';
import 'package:vertex/Signup/bloc/register_bloc.dart';
import 'package:vertex/Signup/view/sign_up_form.dart';
import '../../utils/constant.dart';

class SignUP extends StatelessWidget {
  const SignUP({super.key});
static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUP());
  }
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: UIConstants.backgroundColor,
        body: SignUpForm(),
      ),
    );
  }
}


class UploadProfile extends StatelessWidget {
  const UploadProfile({super.key});
static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const UploadProfile());
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: UIConstants.backgroundColor,
        body:UploadProfileForm(),
    ));
  }
}