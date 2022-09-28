// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

class EditLead extends StatefulWidget {
  const EditLead({super.key});

  @override
  State<EditLead> createState() => _EditLeadState();
}

class _EditLeadState extends State<EditLead> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          shadowColor: kPrimaryColor,

          // pinned: true,
          floating: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(35))),
          toolbarHeight: 100,

          elevation: 20,
          forceElevated: true,

          backgroundColor: kPrimaryColor,

          title: Text(
            "E D I T",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
      body: Container(),
    ));
  }
}
