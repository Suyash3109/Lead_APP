import 'dart:developer';
import 'dart:math';

import 'package:e_commerce/HomeScreen/HomeScreen.dart';
import 'package:e_commerce/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'components/background.dart';
import 'components/login_body.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  bool _isobsure = true;

  //editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void SignIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const MyHomeScreen()))
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    } else {
      Fluttertoast.showToast(msg: "galat");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: Form(
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
                        SignIn(emailController.text, passwordController.text);
                      },
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
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
