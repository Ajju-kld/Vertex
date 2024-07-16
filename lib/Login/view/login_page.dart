import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vertex/Login/bloc/login_bloc.dart';
import 'package:vertex/Login/view/login_form.dart';
import 'package:vertex/Repository/authentication_repository/authentication_repository.dart';
import 'package:vertex/utils/constant.dart';

class LoginPage extends StatelessWidget {
const LoginPage({Key? key}) : super(key: key);

static Route<void> route(){
  return MaterialPageRoute<void>(builder: (_)=>const LoginPage());
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
    backgroundColor:UIConstants.backgroundColor, 
      body:BlocProvider<LoginBloc>(create: (context) {
        return LoginBloc(
          authenticationRepository: RepositoryProvider.of<AuthenticationRepository>(context),
        );
      },
      child:const LoginForm() ,),
    );
    
  }
}
