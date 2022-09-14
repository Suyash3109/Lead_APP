// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'loginbackgroundd.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isobsure = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
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
            child: TextField(
                decoration: InputDecoration(
              icon: Icon(
                Icons.email,
                color: kPrimaryColor,
              ),
              hintText: "Your Email",
              border: InputBorder.none,
            )),
          ),
          TextFieldContainer(
            child: TextField(
                obscureText: _isobsure,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: kPrimaryColor,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                        _isobsure ? Icons.visibility : Icons.visibility_off),
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
          SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: Container(
              width: size.width * 0.8,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      backgroundColor: kPrimaryColor),
                  onPressed: () {},
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )),
            ),
          )
        ],
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
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: kSecondaryColor, borderRadius: BorderRadius.circular(29)),
      child: child,
    );
  }
}
