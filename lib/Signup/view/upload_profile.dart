import 'dart:async';
import 'dart:io';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vertex/Homepage/home.dart';
import 'package:vertex/Repository/authentication_repository/authentication_repository.dart';
import 'package:vertex/Repository/user_repository/user_repository.dart';
import 'package:vertex/Signup/view/animation/card_hidden_animation.dart';
import 'package:vertex/utils/constant.dart';

class UploadProfilePage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const UploadProfilePage());
  }

  const UploadProfilePage({Key? key}) : super(key: key);

  @override
  _UploadProfilePageState createState() => _UploadProfilePageState();
}

class _UploadProfilePageState extends State<UploadProfilePage> {
  File? _image;
  AnimationController? holeController;
  AnimationController? cardController;
  UserRepository userRepository = UserRepository();
  final StreamController<AuthenticationStatus> _controller =
      StreamController<AuthenticationStatus>();
  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: UIConstants.backgroundColor,
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Upload Profile Picture',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    CardHiddenAnimation(
                        child: Center(
                          child: CircleAvatar(
                            backgroundImage: _image != null
                                ? FileImage(_image!)
                                : AssetImage('assets/images/person.png')
                                    as ImageProvider,
                            radius: 100,
                          ),
                        ),
                        onControllersReady: (holeAnimationController,
                            cardOffsetAnimationController) {
                          holeController = holeAnimationController;
                          cardController = cardOffsetAnimationController;
                        }),
                    SizedBox(height: 40),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: TextButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          side: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(
                                color: UIConstants.primaryColor, width: 1.0),
                          ),
                        ),
                        onPressed: _pickImage,
                        child: const Text('Pick Image',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_image != null) {
                            holeController?.forward();
                            await cardController?.forward();
                            await userRepository.updateUser(_image!);
                            Future.delayed(
                              const Duration(milliseconds: 200),
                              () => holeController?.reverse(),
                            );
                            _controller.add(AuthenticationStatus.authenticated);

                            // remove all the prevous pages and go to initial page
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const Home()),
                                (route) => false);
                          }
                          else{
                            AnimatedSnackBar.material('please select profile image or press skip', type: AnimatedSnackBarType.warning).show(context);
                          }
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              UIConstants.primaryColor),
                          side: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(
                                color: UIConstants.primaryColor, width: 1.0),
                          ),
                        ),
                        child: const Text('Upload Image',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                 TextButton(onPressed: (){
                    _controller.add(AuthenticationStatus.authenticated);
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const Home()),
                            (route) => false);

                 }, child:const Text('Skip',style: TextStyle(fontSize:20,color: Colors.white,decoration: TextDecoration.underline,decorationColor: Colors.white),)) ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Image.asset('assets/images/VERTEX.png',
                  width: 200, height: 100),
            ),
          ],
        ),
      ),
    );
  }
}
