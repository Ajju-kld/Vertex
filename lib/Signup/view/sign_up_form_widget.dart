import 'dart:io';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';

import 'package:vertex/Homepage/view/home_page.dart';
import 'package:vertex/Login/view/login_page.dart';

import 'package:vertex/Signup/bloc/register_bloc.dart';
import 'package:vertex/Signup/view/animation/card_hidden_animation.dart';
import 'package:vertex/Signup/view/signup.dart';

import 'package:vertex/utils/constant.dart';

// header
class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('HEY THERE',
            style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Text('Create an Account',
            style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}

// username
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
                  decoration: UIConstants.formInputDecoration(
                      'Username',
                      state.username.displayError != null
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

// email field
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
                      state.email.displayError != null ? 'invalid email' : null,
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
                  decoration: UIConstants.formInputDecoration(
                      'Password',
                      state.password.displayError != null
                          ? 'at least 8 characters long'
                          : null,
                      const Icon(Icons.key, color: Colors.white, size: 30)),
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

// confirm password
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
                    obscureText: true),
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

// terms and conditions
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
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: const BorderSide(
                  color: Color.fromARGB(218, 0, 162, 143),
                  width: 3,
                )),
            splashRadius: 12,
            key: const Key('signupForm_termsAndConditions_checkbox'),
            value:
                context.select((RegisterBloc bloc) => bloc.state.termsAccepted),
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

// signup button

// footer

class Footer extends StatelessWidget {
  const Footer({super.key});

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const LoginPage(),
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
        Hero(
            tag: 'writtenLogo',
            child: Image.asset('assets/images/VERTEX.png',
                width: 300, height: 100)),
        const Text(
          'Already have an account ?',
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        TextButton(
            onPressed: () {
              Navigator.pushReplacement(context, _createRoute());
            },
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.white, fontSize: 18),
            )),
      ],
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    Route _createRoute() {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const UploadProfile(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(1.0, 0.0);
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

    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return SizedBox(
            width: 310,
            height: 60,
            child: ElevatedButton(
              style: UIConstants.primaryButtonStyle(isValid: state.isValid),
              onPressed: state.isValid
                  ? () {
                      print(state.isValid);
                      FocusScope.of(context).unfocus();
                      Navigator.of(context).push(_createRoute());
                      }
                  : null,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Next',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  Icon(
                    Icons.arrow_right_alt,
                    color: Colors.white,
                    size: 30,
                    weight: 50,
                    grade: 22,
                  )
                ],
              ),
            ));
      },
    );
  }
}
class SignupButton extends StatelessWidget {
  final AnimationController? holeController;
  final AnimationController? cardController;

  const SignupButton({
    Key? key,
    this.holeController,
    this.cardController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        // ... (keep existing listener logic)
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Hero(
            tag: 'signup',
            child: SizedBox(
              width: 310,
              height: 60,
              child: ElevatedButton(
                key: const Key('signupForm_signup_raisedButton'),
                style: UIConstants.primaryButtonStyle(isValid: state.isValid),
                onPressed: state.isValid
                    ? () async {
                     
                        // Play the animation
                        if (holeController != null && cardController != null) {
                          await holeController!.forward();
                          await cardController!.forward();
                        Future.delayed(const Duration(seconds: 2));
                          await holeController!.reverse();
                        }
                        // After animation, submit the form
                        context
                            .read<RegisterBloc>()
                            .add(const RegisterSubmitted());
                           
                      }
                    : null,
                child: state.status.isInProgress
                    ? const CircularProgressIndicator()
                    : const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
// pick image button

class PickImageButton extends StatelessWidget {
  const PickImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        // TODO
        if (state.profileImage.error != null) {
          AnimatedSnackBar.material(
            state.profileImage.error!,
            type: AnimatedSnackBarType.error,
            desktopSnackBarPosition: DesktopSnackBarPosition.bottomCenter,
            mobileSnackBarPosition: MobileSnackBarPosition.bottom,
            duration: const Duration(seconds: 3),
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 500),
            snackBarStrategy: RemoveSnackBarStrategy(),
          ).show(context);
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return SizedBox(
            width: 320,
            height: 60,
            child: TextButton(
              style: UIConstants.textButtonStyle(),
              onPressed: state.status.isInProgress
                  ? null
                  : () async {
                      final imagePicker = ImagePicker();
                      final pickedImage = await imagePicker.pickImage(
                          source: ImageSource.gallery);
                      context
                          .read<RegisterBloc>()
                          .add(ProfileImageChanged(File(pickedImage!.path)));
                    },
              child: const Text('Pick Image',
                  style: TextStyle(color: Colors.white)),
            ),
          );
        },
      ),
    );
  }
}
class CardProfile extends StatelessWidget {
  final Function(AnimationController, AnimationController) onControllersReady;

  const CardProfile({Key? key, required this.onControllersReady})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return CardHiddenAnimation(
            onControllersReady: onControllersReady,
            child:  Center(
              child: CircleAvatar(
                backgroundImage: state.profileImage.value != null
                    ? FileImage(state.profileImage.value!)
                    : const AssetImage('assets/images/person.png')
                        as ImageProvider,
                radius: 130,
              ),
            ));
      },
    );
  }
}
