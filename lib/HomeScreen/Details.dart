// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/MVC/Controller/controller.dart';
import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatefulWidget {
  var Id;
  DetailsPage({super.key, required this.Id});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final CustomerController _controller = Get.find<CustomerController>();
  var myMenuItems = <String>[
    'Edit',
  ];
  @override
  void initState() {
    // TODO: implement initState
    _controller.getdetails(widget.Id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: kSecondaryColor),
        backgroundColor: kPrimaryColor,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: kSecondaryColor,
            ),
            onPressed: () {
              Get.back();
            }),
        actions: [
          PopupMenuButton(
              offset: Offset(0, 60),
              color: kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 50,
              icon: Icon(Icons.more_vert, color: kSecondaryColor),
              itemBuilder: (BuildContext context) {
                return myMenuItems.map((String choice) {
                  return PopupMenuItem<String>(
                    child:
                        Text(choice, style: TextStyle(color: kSecondaryColor)),
                    value: choice,
                  );
                }).toList();
              },
              onSelected: (item) {
                switch (item) {
                  case 'Edit':
                }
              })
        ],
        centerTitle: true,
        title: Text("D E T A I L S",
            style: TextStyle(
              color: kSecondaryColor,
            )),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(

                // border: Border(bottom: BorderSide(BorderSide.none)),
                borderRadius: BorderRadius.circular(
                  50,
                ),
                color: kPrimaryColor,
                shape: BoxShape.rectangle),

            child: Text(
              _controller.lead_details[0][1].name.toString(),
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            // color: kSecondaryColor,

            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            // child:
          ),
        ],
      ),
    );
  }
}
