// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/HomeScreen/edit.dart';
import 'package:e_commerce/MVC/Models/User_model.dart';
import 'package:e_commerce/Screens/Login_screen.dart';
import 'package:e_commerce/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  User? user = FirebaseAuth.instance.currentUser;
  usermodel loggedInuser = usermodel();
  Stream<DocumentSnapshot> snapshot =
      FirebaseFirestore.instance.collection("users").doc().snapshots();
  var val;
  String? imageurl;

  @override
  void initState() {
    log("message");
    // setState(() {
    getUser();
    // });
    super.initState();
  }

  Future getUser() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      log(value.toString());
      val = value;
      loggedInuser = usermodel.fromMap(value.data());
      if (mounted) {
        setState(() {});
      }
    });
  }

  var myMenuItems = <String>['Edit', 'Logout'];

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

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
          logout(context);
        },
        child: const Text(
          "L O G O U T",
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
                    shadowColor: kPrimaryColor,
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(35))),
                    toolbarHeight: 100,
                    elevation: 20,
                    title: Text(
                      "M Y   A C C O U N T",
                      style: TextStyle(
                          color: kSecondaryColor, fontWeight: FontWeight.bold),
                    ),
                    forceElevated: true,
                    pinned: true,
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
                                child: Text(choice,
                                    style: TextStyle(color: kSecondaryColor)),
                                value: choice,
                              );
                            }).toList();
                          },
                          onSelected: (item) {
                            switch (item) {
                              case 'Edit':
                                Get.to(() => EditLead());
                                break;
                              case 'Logout':
                                Get.to(() => logout(context));
                            }
                          })
                    ],
                  )
                ],
            body: RefreshIndicator(
              onRefresh: () async {
                setState(() {
                  getUser();
                });
              },
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Stack(
                        children: [
                          Center(
                            child: FutureBuilder(
                              future: FirebaseStorage.instance
                                  .ref("profilepic")
                                  .child('userpic')
                                  .child('${user!.uid}userpic')
                                  .getDownloadURL(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return ClipOval(
                                    child: Stack(children: [
                                      CircleAvatar(
                                        radius: 80,
                                        child: Image.network(
                                            snapshot.data.toString()),
                                        backgroundColor: Colors.black,
                                      ),
                                      Positioned(
                                          right: 2,
                                          bottom: 10,
                                          child: SizedBox(
                                            height: 46,
                                            width: 46,
                                            child: IconButton(
                                              highlightColor: kPrimaryColor,
                                              hoverColor: kSecondaryColor,
                                              icon: Icon(
                                                  Icons.camera_alt_outlined),
                                              onPressed: () {
                                                // Get.to(()=> );
                                              },
                                            ),
                                          ))
                                    ]),
                                  );
                                }
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const ClipOval(
                                    child: const CircleAvatar(
                                      radius: 80,
                                    ),
                                  );
                                }
                                return const Center(
                                  child: Text("Something went wrong"),
                                );
                              },
                            ),
                          ),
                          Card(
                            elevation: 9.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9.0),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: kPrimaryColor,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Name :- ${loggedInuser.firstname} ${loggedInuser.secondname}",
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Email :- ${loggedInuser.email}",
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
