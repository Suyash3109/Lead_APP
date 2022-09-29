// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_commerce/MVC/Controller/Services.dart';
import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddLead extends StatefulWidget {
  const AddLead({super.key});

  @override
  State<AddLead> createState() => _AddLeadState();
}

class _AddLeadState extends State<AddLead> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController namecontroller = TextEditingController();
  final phonenumbercontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final contactcontroller = TextEditingController();
  final websitecontroller = TextEditingController();
  final companycontroller = TextEditingController();
  final addresscontroller = TextEditingController();
  final titlecontroller = TextEditingController();
  final citycontroller = TextEditingController();
  final zipcontroller = TextEditingController();
  final statecontroller = TextEditingController();
  final defaultLaunguagecontroller = TextEditingController();
  final descriptioncontroller = TextEditingController();
  final customContactDatecontroller = TextEditingController();
  final contactedTodaycontroller = TextEditingController();
  final isPubliccontroller = TextEditingController();
  final budgetcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final savebutton = Material(
      elevation: 25,
      shadowColor: kPrimaryColor,
      borderOnForeground: true,
      borderRadius: BorderRadius.circular(30),
      color: kPrimaryColor,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: 200,
        onPressed: () {
          if (_formkey.currentState!.validate()) {
            SearchServices.addLead(
              namecontroller.text,
              emailcontroller.text,
              titlecontroller.text,
              phonenumbercontroller.text,
              websitecontroller.text,
              companycontroller.text,
              addresscontroller.text,
              citycontroller.text,
              statecontroller.text,
              zipcontroller.text,
              budgetcontroller.text,
              descriptioncontroller.text,
              customContactDatecontroller.text,
              contactedTodaycontroller.text,
              isPubliccontroller.text,
            );

            Get.back();
          }
        },
        child: const Text(
          "S A V E",
          textAlign: TextAlign.center,
          // ignore: unnecessary_const
          style: const TextStyle(
            fontSize: 20,
            color: kSecondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    pinned: true,
                    automaticallyImplyLeading: false,
                    elevation: 20,
                    shadowColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(35))),
                    toolbarHeight: 100,
                    forceElevated: true,
                    title: Text(
                      "A D D     L E A D",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: kPrimaryColor,
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: kSecondaryColor,
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
                  // height: 550,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: kSecondaryColor,
                  ),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.all(20),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Name Field cannot be Empty";
                              } else {
                                return null;
                              }
                            },
                            controller: namecontroller,
                            // onChanged: ((value) {
                            //   // namecontroller.text = value;
                            // }),
                            decoration: InputDecoration(
                              // enabled: false,
                              labelText: 'Name :- ',
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
                            // textInputAction: TextInputAction.next,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("enter a email");
                              }

                              if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return ("Please enter a Valid email");
                              }

                              return null;
                            },

                            textInputAction: TextInputAction.next,
                            controller: emailcontroller,
                            // onChanged: ((value) {
                            //   emailcontroller.text = value;
                            // }),
                            decoration: InputDecoration(
                              labelText: 'Email Address :- ',
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
                            textInputAction: TextInputAction.next,
                            controller: titlecontroller,
                            // onChanged: ((value) {
                            //   titlecontroller.text = value;
                            // }),
                            decoration: InputDecoration(
                              labelText: 'Title :- ',
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Mobile number is Mandatory");
                              }

                              if (!RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$')
                                  .hasMatch(value)) {
                                return ("Please enter a Valid Mobile Number");
                              }

                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            controller: phonenumbercontroller,
                            // onChanged: ((value) {
                            //   phonenumbercontroller.text = value;
                            // }),
                            decoration: InputDecoration(
                              labelText: 'Mobile Number :- ',
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
                            textInputAction: TextInputAction.next,
                            controller: websitecontroller,
                            // onChanged: ((value) {
                            //   websitecontroller.text = value;
                            // }),
                            decoration: InputDecoration(
                              labelText: 'Website :- ',
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
                            textInputAction: TextInputAction.next,
                            controller: companycontroller,
                            // onChanged: ((value) {
                            //   companycontroller.text = value;
                            // }),
                            decoration: InputDecoration(
                              labelText: 'Company :- ',
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
                            textInputAction: TextInputAction.next,
                            controller: addresscontroller,
                            // onChanged: ((value) {
                            //   addresscontroller.text = value;
                            // }),
                            decoration: InputDecoration(
                              labelText: 'Address :- ',
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
                            textInputAction: TextInputAction.next,
                            controller: citycontroller,
                            // onChanged: ((value) {
                            //   citycontroller.text = value;
                            // }),
                            decoration: InputDecoration(
                              labelText: 'City :- ',
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
                            textInputAction: TextInputAction.next,
                            controller: statecontroller,
                            // onChanged: ((value) {
                            //   statecontroller.text = value;
                            // }),
                            decoration: InputDecoration(
                              labelText: 'State :- ',
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
                            textInputAction: TextInputAction.next,
                            controller: zipcontroller,
                            // onChanged: ((value) {
                            //   zipcontroller.text = value;
                            // }),
                            decoration: InputDecoration(
                              labelText: 'Zip :- ',
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
                            textInputAction: TextInputAction.next,
                            controller: budgetcontroller,
                            // onChanged: ((value) {
                            //   budgetcontroller.text = value;
                            // }),
                            decoration: InputDecoration(
                              labelText: 'Budget :- ',
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
                            textInputAction: TextInputAction.next,
                            controller: descriptioncontroller,
                            // onChanged: ((value) {
                            //   descriptioncontroller.text = value;
                            // }),
                            decoration: InputDecoration(
                              labelText: 'Description :- ',
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
                            textInputAction: TextInputAction.next,
                            controller: customContactDatecontroller,
                            // onChanged: ((value) {
                            //   customContactDatecontroller.text = value;
                            // }),
                            decoration: InputDecoration(
                              labelText: 'Customer Contact Date :- ',
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
                            textInputAction: TextInputAction.next,
                            controller: contactedTodaycontroller,
                            // onChanged: ((value) {
                            //   contactedTodaycontroller.text = value;
                            // }),
                            decoration: InputDecoration(
                              labelText: 'Contacted Today :- ',
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
                            textInputAction: TextInputAction.done,
                            controller: isPubliccontroller,
                            // onChanged: ((value) {
                            //   isPubliccontroller.text = value;
                            // }),
                            decoration: InputDecoration(
                              labelText: 'Is Public :- ',
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
                        SizedBox(
                          height: 25,
                        ),
                        savebutton,
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}
