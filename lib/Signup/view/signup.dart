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
    return SafeArea(
      child: Scaffold(
        backgroundColor: UIConstants.backgroundColor,
        body: BlocProvider(
          create: (context) => RegisterBloc(
            authenticationRepository:
                RepositoryProvider.of<AuthenticationRepository>(context),
          ),
          child: SignUpForm(),
        ),
      ),
    );
  }
}