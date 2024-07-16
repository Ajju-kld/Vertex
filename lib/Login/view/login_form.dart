import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:vertex/ForgottenPassword/forgottenpassword.dart';
import 'package:vertex/Login/bloc/login_bloc.dart';
import 'package:vertex/Signup/view/sign_up.dart';


class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
                    children: [
                      const SizedBox(height: 30),
                _ImageBanner(),
                const SizedBox(height: 30),
                _UsernameInput(),
                const SizedBox(height: 20),
                _PasswordInput(),
                Align(
                  alignment: Alignment.topRight,child: ForgotPassword()),
                const SizedBox(height: 60),
                _LoginButton(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not registered yet?',style: TextStyle(color: Colors.white,fontSize: 18)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, SignUp.route());
                      },
                      child: const Text('Sign Up',style: TextStyle(color: Colors.white,fontSize: 18)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                       const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                TextField(
        
                  style: const TextStyle(color: Colors.white,overflow: TextOverflow.fade),
                  key: const Key('loginForm_usernameInput_textField'),
                  onChanged: (username) =>
                      context.read<LoginBloc>().add(UsernameChanged(username)),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(218, 0, 162, 143),
                        width: 3,
                      )),      
                   hintText: 'Username',
                   hintStyle: const TextStyle(color: Colors.grey),
                   errorText: state.username.displayError!=null ? 'invalid username' : null,
                   errorStyle: const TextStyle(fontSize: 0),
                   
                      constraints:
                        const BoxConstraints.tightFor(width: 310, height: 60),
                  ),
                ),
              ],
            ),
            if (state.username.displayError!=null)
              const Align(
                alignment: Alignment.centerLeft,
                child:  Padding(
                  padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                  child: Text(
                    'invalid username',
                    style: TextStyle(color: Colors.red,fontSize: 12),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                TextField(
                  obscureText: true,
                  style: const TextStyle(
                      color: Colors.white, overflow: TextOverflow.fade),
                  key: const Key('loginForm_passwordInput_textField'),
                  onChanged: (password) =>
                      context.read<LoginBloc>().add(PasswordChanged(password)),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide:  BorderSide(
                          color: state.password.displayError!=null?Colors.red: const Color.fromARGB(218, 0, 162, 143),
                          width: 3,
                        )),
                    hintText: 'Password',
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 3,
                        )),
                    hintStyle: const TextStyle(color: Colors.grey),
                    errorText: state.username.displayError != null
                        ? 'Password must be at least 6 characters'
                        : null,
                    errorStyle: const TextStyle(fontSize: 0),
                    constraints:
                        const BoxConstraints.tightFor(width: 310, height: 60),
                  ),
                ),
              ],
            ),
            if (state.password.displayError != null)
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                  child: Text(
                    'Password must be at least 6 characters',
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : SizedBox(
                width: 310,
                height: 60,
              child: Hero(
                tag: 'login',
                
                child: ElevatedButton(
                  
                  style:  ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                   const  Color.fromARGB(255, 0, 162, 143)),
                                overlayColor: WidgetStateProperty.all<Color>(
                                   const  Color.fromARGB(211, 0, 0, 0)),
                                shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(11),
                                        side: const BorderSide(
                                            width: 3,
                                            color: Color.fromARGB(
                                                218, 0, 162, 143))))),
                    key: const Key('loginForm_continue_raisedButton'),
                    onPressed: state.isValid
                        ? () {
                            context.read<LoginBloc>().add(const LoginSubmitted());
                          }
                        : null,
                    child: const Text('Login',style: TextStyle(color: Colors.white,fontSize: 18),),
                  ),
              ),
            );
      },
    );
  }
}
class _ImageBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/LOGIN 1.svg',
   width: 300 ,
   height: 350,
    );
  }
}



class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(context, Forgottenpassword.route());
      },
      child: Text('Forgot Password?', style: TextStyle(color: Colors.white,fontSize: 18)),
    );
  }
}