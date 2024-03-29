// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names

import 'dart:developer';
import 'dart:math';

import 'package:e_commerce/HomeScreen/HomeScreen.dart';
import 'package:e_commerce/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/state_manager.dart';
import 'package:shake/shake.dart';

import 'components/background.dart';
import 'components/login_body.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ShakeDetector detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        SignIn(emailController.text, passwordController.text);
      },
      minimumShakeCount: 1,
      shakeSlopTimeMS: 500,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 2.7,
    );
    detector.startListening();
  }

  final _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  bool _isobsure = true;
  RxBool _anurag = false.obs;

  //editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void SignIn(String email, String password) async {
    _anurag(true);
    if (_formkey.currentState!.validate()) {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // .then((uid) => {
      Fluttertoast.showToast(msg: "Login Successful");
      _anurag(false);

      Navigator.of(context)
          .pushReplacement(
              MaterialPageRoute(builder: (context) => const MyHomeScreen()))
          // })
          .catchError((e) {
        _anurag(false);
        Fluttertoast.showToast(msg: e!.message);
      });
    } else {
      _anurag(false);
      Fluttertoast.showToast(msg: "something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Background(
      child: Obx(
        () => _anurag.value
            ? Center(child: Image.asset("assets/loadernew.gif"))
            : Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "L O G I N",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SvgPicture.asset(
                      "assets/loginbro.svg",
                      height: size.height * 0.3,
                    ),
                    TextFieldContainer(
                      child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ("Please Enter Your Email");
                            }

                            if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return ("Please Enter a Valid Email");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            emailController.text = value!;
                          },
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            icon: Icon(
                              Icons.email,
                              color: kPrimaryColor,
                            ),
                            hintText: "Your Email",
                            border: InputBorder.none,
                          )),
                    ),
                    TextFieldContainer(
                      child: TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            RegExp regExp = RegExp(r'^.{6,}$');
                            if (value == null || value.isEmpty) {
                              return ("Please Enter Your Password");
                            }
                            if (!regExp.hasMatch(value)) {
                              return ("Please Enter a Valid Password");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            passwordController.text = value!;
                          },
                          textInputAction: TextInputAction.done,
                          obscureText: _isobsure,
                          decoration: InputDecoration(
                            icon: const Icon(
                              Icons.lock,
                              color: kPrimaryColor,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(_isobsure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isobsure = !_isobsure;
                                });
                              },
                              color: kPrimaryColor,
                            ),
                            hintText: "Your Password",
                            border: InputBorder.none,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: Container(
                        width: size.width * 0.8,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 40),
                                backgroundColor: kPrimaryColor),
                            onPressed: () {
                              // print(emailController.text);
                              SignIn(emailController.text,
                                  passwordController.text);
                            },
                            child: const Text(
                              "LOGIN",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ),
                    )
                  ],
                ),
              ),
      ),
    ));
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: kSecondaryColor, borderRadius: BorderRadius.circular(29)),
      child: child,
    );
  }
}
