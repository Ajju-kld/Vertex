import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vertex/Authentication/bloc/authentication_bloc.dart';

class Home extends StatelessWidget {
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => Home());
  }

  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
              child: ElevatedButton(
            child: Text('clear token'),
            onPressed: () {

             context.read<AuthenticationBloc>().add(AuthenticationLogoutRequested());
            },
          )),
        );
      },
    );
  }
}
