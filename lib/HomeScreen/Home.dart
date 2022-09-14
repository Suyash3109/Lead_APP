import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

class HOme extends StatefulWidget {
  const HOme({super.key});

  @override
  State<HOme> createState() => _HOmeState();
}

class _HOmeState extends State<HOme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        // centerTitle: true,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.menu,
        //     color: Colors.white,
        //   ),
        //   onPressed: (() {}),
        // ),
        title: Text(
          "Home",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      // color: Colors.blue,
    );
  }
}
