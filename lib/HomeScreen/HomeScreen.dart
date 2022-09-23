import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commerce/HomeScreen/Leads.dart';
import 'package:e_commerce/HomeScreen/Home.dart';
import 'package:e_commerce/HomeScreen/Account.dart';
import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int _selectedpage = 0;

  static const List<Widget> _pages = <Widget>[
    Leads(),
    HOme(),
    Account(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: kSecondaryColor,
        // appBar: AppBar(
        //   backgroundColor: kPrimaryColor,
        //   // centerTitle: true,
        //   // leading: IconButton(
        //   //   icon: Icon(
        //   //     Icons.menu,
        //   //     color: Colors.white,
        //   //   ),
        //   //   onPressed: (() {}),
        //   // ),
        //   title: Text(
        //     "Home",
        //     style: TextStyle(
        //       fontWeight: FontWeight.bold,
        //       color: Colors.white,
        //     ),
        //   ),
        // ),
        bottomNavigationBar: CurvedNavigationBar(
          items: [
            Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            Icon(
              Icons.person,
              color: Colors.white,
            ),
          ],
          backgroundColor: Colors.transparent,
          color: kPrimaryColor,
          buttonBackgroundColor: kPrimaryColor,
          animationDuration: Duration(milliseconds: 800),
          animationCurve: Curves.easeOut,
          onTap: _onItemTapped,
        ),
        body: Center(
          child: _pages.elementAt(_selectedpage),
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedpage = index;
    });
  }
}
