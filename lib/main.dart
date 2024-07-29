import 'package:animated_logo_package/animated_logo_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vertex/Authentication/bloc/authentication_bloc.dart';
import 'package:vertex/Homepage/bloc/bottom_navigation_bloc.dart';
import 'package:vertex/Login/bloc/login_bloc.dart';
import 'package:vertex/Repository/authentication_repository/authentication_repository.dart';
import 'package:vertex/Repository/user_repository/user_repository.dart';
import 'package:vertex/Signup/bloc/register_bloc.dart';
import 'package:vertex/app_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AuthenticationRepository _authenticationRepository;
  late final UserRepository _userRepository;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _authenticationRepository = AuthenticationRepository();
    _userRepository = UserRepository();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _authenticationRepository.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   return RepositoryProvider.value(
    value:_authenticationRepository,
    child: MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(
            authenticationRepository: _authenticationRepository,
            userRepository: _userRepository,
          ),
        
        ),
        BlocProvider<BottomNavigationBloc>(create: 
        (context) => BottomNavigationBloc()),
        BlocProvider<RegisterBloc>(create:
        (context) => RegisterBloc(authenticationRepository: _authenticationRepository) ),
        BlocProvider<LoginBloc>(create: (context) =>LoginBloc(authenticationRepository: _authenticationRepository)),
        BlocProvider<LogoAnimationBloc>(
          create: (context) => LogoAnimationBloc(),
        )
      ],
      child: const AppView(),
    ),
   );
  }
}
