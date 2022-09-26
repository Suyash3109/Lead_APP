import 'package:e_commerce/Screens/Login_screen.dart';
import 'package:e_commerce/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      // color: Colors.yellow,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        // centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.logout_outlined,
            color: Colors.white,
          ),
          onPressed: (() {
            logout(context);
          }),
        ),
        title: Text(
          "Accounts",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
          child: Text(
        " Hey, this is my homepage, so I have to say something about myself. Sometimes it is hard to introduce yourself because you know yourself so well that you do not know where to start with. Let me give a try to see what kind of image you have about me through my self-description. I hope that my impression about myself and your impression about me are not so different. Here it goes.",
        style: GoogleFonts.playfairDisplay(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 100),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: kPrimaryColor,
          elevation: 10,
          child: Icon(
            Icons.add_circle_sharp,
            color: kSecondaryColor,
          ),
        ),
      ),
    );
  }
}
