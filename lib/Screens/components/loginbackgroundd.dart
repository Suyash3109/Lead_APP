import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            child: Image.asset("assets/login_bottom.png"),
            bottom: 0,
            right: 0,
            width: size.width * 0.6,
          ),
          Positioned(
            child: Image.asset("assets/main_top.png"),
            top: 0,
            left: 0,
            width: size.width * 0.4,
          ),
          child,
        ],
      ),
    );
  }
}
