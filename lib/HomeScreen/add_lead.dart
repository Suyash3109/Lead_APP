// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddLead extends StatefulWidget {
  const AddLead({super.key});

  @override
  State<AddLead> createState() => _AddLeadState();
}

class _AddLeadState extends State<AddLead> {
  final namecontroller = TextEditingController();
  final phonenumbercontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final contactcontroller = TextEditingController();
  final websitecontroller = TextEditingController();
  final companycontroller = TextEditingController();
  final addresscontroller = TextEditingController();
  final titlecontroller = TextEditingController();
  final citycontroller = TextEditingController();
  final statecontroller = TextEditingController();
  final defaultLaunguagecontroller = TextEditingController();
  final descriptioncontroller = TextEditingController();
  final customXontactDatecontroller = TextEditingController();
  final contactedTodaycontroller = TextEditingController();
  final isPubliccontroller = TextEditingController();
  final budgetcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    elevation: 20,
                    shadowColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(35))),
                    toolbarHeight: 100,
                    forceElevated: true,
                    title: Text(
                      "A D D   L E A D",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: kPrimaryColor,
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  )
                ],
            body: Scaffold(
              backgroundColor: kSecondaryColor,
              body: SingleChildScrollView(
                // padding:
                //     EdgeInsets.only(top: 100, bottom: 100, left: 18, right: 18),
                child: Container(
                  height: 550,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: kSecondaryColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        child: TextFormField(
                          controller: namecontroller,
                          onChanged: ((value) {}),
                          decoration: InputDecoration(
                            labelText: 'Name:- ',
                            labelStyle: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            focusColor: kPrimaryColor,
                            // border: OutlineInputBorder(
                            //     borderRadius: BorderRadius.circular(100),
                            //     borderSide: BorderSide(
                            //       color: kPrimaryColor,
                            //     )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                  color: kPrimaryColor,
                                )),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: TextFormField(
                          controller: emailcontroller,
                          onChanged: ((value) {}),
                          decoration: InputDecoration(
                            labelText: 'Email Address:- ',
                            labelStyle: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            focusColor: kPrimaryColor,
                            // border: OutlineInputBorder(
                            //     borderRadius: BorderRadius.circular(100),
                            //     borderSide: BorderSide(
                            //       color: kPrimaryColor,
                            //     )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                  color: kPrimaryColor,
                                )),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: TextFormField(
                          controller: phonenumbercontroller,
                          onChanged: ((value) {}),
                          decoration: InputDecoration(
                            labelText: 'Phone Number:- ',
                            labelStyle: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            focusColor: kPrimaryColor,
                            // border: OutlineInputBorder(
                            //     borderRadius: BorderRadius.circular(100),
                            //     borderSide: BorderSide(
                            //       color: kPrimaryColor,
                            //     )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                  color: kPrimaryColor,
                                )),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: TextFormField(
                          controller: companycontroller,
                          onChanged: ((value) {}),
                          decoration: InputDecoration(
                            labelText: 'Company:- ',
                            labelStyle: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            focusColor: kPrimaryColor,
                            // border: OutlineInputBorder(
                            //     borderRadius: BorderRadius.circular(100),
                            //     borderSide: BorderSide(
                            //       color: kPrimaryColor,
                            //     )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                  color: kPrimaryColor,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
