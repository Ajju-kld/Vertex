import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vertex/Authentication/bloc/authentication_bloc.dart';
import 'package:vertex/Repository/user_repository/user_model.dart';
import 'package:vertex/utils/constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        final User user = context.read<AuthenticationBloc>().state.user;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: UIConstants.backgroundColor,
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Transform.rotate(
                  angle: 201 / 20,
                  child: IconButton(
                    onPressed: () {
                      context
                          .read<AuthenticationBloc>()
                          .add(AuthenticationLogoutRequested());
                    },
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (route) => false,
                    );
                  },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(user.profile),
                  ),
                ),
              ),
            ],
            title: const Text(
              'Vertex',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),

        


        );
      },
    );
  }
}
