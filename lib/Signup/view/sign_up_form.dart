import 'package:flutter/material.dart';
import 'package:vertex/Signup/view/sign_up_form_widget.dart';
import 'package:vertex/utils/constant.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child:  const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Header(),
            SizedBox(
              height: 40,
            ),
            UserNameField(),
            SizedBox(
              height: 20,
            ),
            EmailField(),
            SizedBox(
              height: 20,
            ),
            PasswordField(),
            SizedBox(
              height: 20,
            ),
            ConfirmPasswordField(),
            SizedBox(
              height: 20,
            ),
            TermsAndConditions(),
            SizedBox(
              height: 30,
            ),
            NextButton(),
            SizedBox(
              height: 40,
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}

// upload profile form
class UploadProfileForm extends StatefulWidget {
  const UploadProfileForm({Key? key}) : super(key: key);

  @override
  _UploadProfileFormState createState() => _UploadProfileFormState();
}

class _UploadProfileFormState extends State<UploadProfileForm> {
  AnimationController? _holeController;
  AnimationController? _cardController;

  void _setControllers(
      AnimationController holeController, AnimationController cardController) {
    _holeController = holeController;
    _cardController = cardController;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                const Text('Upload Profile Picture',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                CardProfile(
                  onControllersReady: _setControllers,
                ),
                const SizedBox(height: 30),
                const PickImageButton(),
                const SizedBox(height: 30),
                SignupButton(
                  holeController: _holeController,
                  cardController: _cardController,
                ),
                const SizedBox(
                  height: 100,
                ),
                const Hero(
                  tag: 'written_logo',
                  child: Image(
                    image: AssetImage('assets/images/VERTEX.png'),
                    height: 100,
                    width: 200,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
