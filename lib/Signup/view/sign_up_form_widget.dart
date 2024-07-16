import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:vertex/Login/view/login_page.dart';
import 'package:vertex/Signup/bloc/register_bloc.dart';
import 'package:vertex/utils/constant.dart';




// header
class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(  mainAxisAlignment: MainAxisAlignment.center,
      children:  [
       Text('HEY THERE', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
       Text('Create an Account', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),

    ],
  );
  }
}




class UserNameField extends StatelessWidget {
  const UserNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
               
                TextField(
                  
                  style: const TextStyle(
                      color: Colors.white, overflow: TextOverflow.fade),
                  key: const Key('signForm_usernameInput_textField'),
                  onChanged: (username) => context
                      .read<RegisterBloc>()
                      .add(RegisterUsernameChanged(username)),
                  decoration:UIConstants.formInputDecoration('Username',   state.username.displayError != null
                          ? 'invalid username'
                          : null,
                      const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30,
                      )),
                ),
              ],
            ),
            if (state.username.displayError != null)
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
                  child: Text(
                    'empty username',
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

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
                TextField(
                  style: const TextStyle(
                      color: Colors.white, overflow: TextOverflow.fade),
                  key: const Key('signupForm_emailInput_textField'),
                  onChanged: (email) => context
                      .read<RegisterBloc>()
                      .add(RegisterEmailChanged(email)),
                   decoration: UIConstants.formInputDecoration(
                      'Email',
                      state.email.displayError != null
                          ? 'invalid email'
                          : null,
                      const Icon(
                        Icons.email,
                        color: Colors.white,
                        size: 30,
                      )),
                ),
              ],
            ),
            if (state.email.displayError != null)
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
                  child: Text(
                    'invalid email',
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

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              TextField(
                  style: const TextStyle(
                      color: Colors.white, overflow: TextOverflow.fade),
                  key: const Key('signupForm_passwordInput_textField'),
                  onChanged: (password) => context
                      .read<RegisterBloc>()
                      .add(RegisterPasswordChanged(password)),
                  decoration:UIConstants.formInputDecoration('Password',   state.password.displayError != null
                          ? 'at least 8 characters long'
                          : null,const Icon(Icons.key,color: Colors.white,size: 30)),
                  obscureText: true,
                ),
              ],
            ),
            if (state.password.displayError != null)
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
                  child: Text(
                    'password must be at least 8 characters long',
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

class ConfirmPasswordField extends StatelessWidget {
  const ConfirmPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
          
                TextField(
                  
                  style: const TextStyle(
                      color: Colors.white, overflow: TextOverflow.fade),
                  key: const Key('signUpForm_confirmPasswordInput_textField'),
                  onChanged: (password) => context
                      .read<RegisterBloc>()
                      .add(RegisterConfirmPasswordChanged(password)),
             decoration: UIConstants.formInputDecoration(
                      'Confirm Password',
                      state.confirmPassword.displayError != null
                          ? 'password do not match'
                          : null,
                        const Icon(
                          Icons.key_rounded,
                          color: Colors.white,
                          size: 30,
                        )),
                  obscureText: true
                ),
              ],
            ),
            if (state.confirmPassword.displayError != null)
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
                  child: Text(
                    'password do not match',
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

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.scale(
          scale: 2,
          child: Checkbox(
            shape:RoundedRectangleBorder(
              
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(
                color: Color.fromARGB(218, 0, 162, 143),
                width: 3,
              )),
            splashRadius: 12,
            key: const Key('signupForm_termsAndConditions_checkbox'),
            value: context.select((RegisterBloc bloc) => bloc.state.termsAccepted),
            onChanged: (value) {
              context.read<RegisterBloc>().add(RegisterTermsAccepted(value!));
            },
          ),
        ),
       const SizedBox(
          width: 10,
        ),
        const Text(
          'I agree to the terms and conditions',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ],
    );
  }
}

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Hero(
          tag: 'signup',
          child: SizedBox(
            width: 310,
            height: 60,
            child: ElevatedButton(
              key: const Key('signupForm_signup_raisedButton'),
              style: ButtonStyle(
                
                  backgroundColor: WidgetStateProperty.all<Color>(
                      const Color.fromARGB(255, 0, 162, 143)),
                  overlayColor: WidgetStateProperty.all<Color>(
                      const Color.fromARGB(211, 0, 0, 0)),
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                      side: const BorderSide(
                          width: 3, color: Color.fromARGB(218, 0, 162, 143))))),
              onPressed:state.isValid? () {
                context.read<RegisterBloc>().add(const RegisterSubmitted());
                if (context.read<RegisterBloc>().state.status.isSuccess) {
                   Navigator.pop(context);
                }
              }:null,
              child: state.status.isInProgress
                  ? const CircularProgressIndicator()
                  : const Text('Sign Up', style: TextStyle(fontSize: 18,color: Colors.white),),
            ),
          ),
        );
      },
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>  const LoginPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(0.0, -1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(tag: 'writtenLogo',
          child: Image.asset('assets/images/VERTEX.png', width: 300, height: 100)),
        const Text(
          'Already have an account ?',
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        TextButton(onPressed: (){
          Navigator.pushReplacement(context, _createRoute());
        }, child: const Text('Login',style: TextStyle(color: Colors.white,fontSize: 18),)),
      ],
    );
  }
}
