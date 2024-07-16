import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vertex/Login/bloc/login_bloc.dart';
import 'package:vertex/Login/view/login_form.dart';
import 'package:vertex/Repository/authentication_repository/authentication_repository.dart';

class LoginPage extends StatelessWidget {


static Route<void> route(){
  return MaterialPageRoute<void>(builder: (_)=>LoginPage());
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.transparent ,
        automaticallyImplyLeading: false,
        title: const Text('Login',style: TextStyle(color: Colors.white)),
      ),
      resizeToAvoidBottomInset: true,
    backgroundColor: Color.fromRGBO(14, 15, 26, 1), 
      body:BlocProvider<LoginBloc>(create: (context) {
        return LoginBloc(
          authenticationRepository: RepositoryProvider.of<AuthenticationRepository>(context),
        );
      },
      child:const LoginForm() ,),
    );
    
  }
}
