import 'package:e_commerce/Screens/Login_screen.dart';
import 'package:e_commerce/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    );
  }
}
