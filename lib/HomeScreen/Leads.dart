// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:e_commerce/HomeScreen/Details.dart';
import 'package:e_commerce/HomeScreen/add_lead.dart';
import 'package:e_commerce/MVC/Controller/controller.dart';
import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeago/timeago.dart' as timeago;

class Leads extends StatefulWidget {
  const Leads({super.key});

  @override
  State<Leads> createState() => _LeadsState();
}

class _LeadsState extends State<Leads> {
  final CustomerController _controller = Get.put(CustomerController());

  final textController = TextEditingController();
  String search = "";

  @override
  void initState() {
    textController.addListener(() => _printLatestValue());
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    if (search != textController.text) {
      search = textController.text;
      _controller.searchlead(textController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: NestedScrollView(
        // floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            shadowColor: kPrimaryColor,

            // pinned: true,
            // floating: true,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(35))),
            toolbarHeight: 100,
            // flexibleSpace: Text("wrsgfs"),
            // scrolledUnderElevation: 10.0,
            elevation: 20,
            forceElevated: true,
            actions: [
              AnimSearchBar(
                  autoFocus: true,
                  closeSearchOnSuffixTap: true,
                  color: kSecondaryColor,
                  helpText: "search here",
                  width: 400,
                  textController: textController,
                  onSuffixTap: () {
                    setState(() {
                      textController.clear();
                    });
                  }),
              SizedBox(
                width: 10,
              )
            ],

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
              "L E A D S",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],

        body: Obx(
            () => _controller.isLoaded.value && _controller.loadingsearch.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: search != ""
                        ? ListView.builder(
                            itemCount: _controller.search_lead.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                // focusNode: FocusNode(debugLabel: "drcfvg"),
                                onTap: () {
                                  Get.to(() => DetailsPage(
                                        Id: _controller.search_lead[index].id,
                                      ));
                                },
                                focusColor: kPrimaryColor,
                                child: Card(
                                  shadowColor: kPrimaryColor,
                                  color: kSecondaryColor,
                                  // ignore: prefer_const_constructors
                                  margin: EdgeInsets.all(10),
                                  elevation: 10,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text(
                                          _controller.search_lead[index].name
                                              .toString(),
                                          style: GoogleFonts.lateef(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        ),
                                        subtitle: Text(
                                          _controller.search_lead[index].email
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })
                        : ListView.builder(
                            // reverse: true,
                            itemCount: _controller.customerModel.length,
                            itemBuilder: (context, index) {
                              int itemCount = _controller.customerModel.length;
                              int reversedIndex = itemCount - 1 - index;
                              return InkWell(
                                // focusNode: FocusNode(debugLabel: "drcfvg"),
                                onTap: () {
                                  Get.to(() => DetailsPage(
                                        Id: _controller
                                            .customerModel[reversedIndex].id,
                                      ));
                                },
                                focusColor: kPrimaryColor,
                                child: Card(
                                  shadowColor: kPrimaryColor,
                                  color: kSecondaryColor,
                                  // ignore: prefer_const_constructors
                                  margin: EdgeInsets.all(10),
                                  elevation: 20,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text(
                                          _controller
                                              .customerModel[reversedIndex].name
                                              .toString(),
                                          style: GoogleFonts.lateef(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        ),
                                        subtitle: Text(
                                          _controller
                                              .customerModel[reversedIndex]
                                              .email
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        trailing: Text(
                                          timeago.format(DateTime.parse(
                                            _controller
                                                .customerModel[reversedIndex]
                                                .dateadded
                                                .toString(),
                                          )),
                                          style: TextStyle(
                                              color: kPrimaryColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                  )),
      ),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 80),
        child: FloatingActionButton(
          splashColor: Colors.orange,
          highlightElevation: 20,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: () {
            Get.to(() => AddLead());
          },
          backgroundColor: kPrimaryColor,
          elevation: 15,
          child: Icon(
            Icons.add_circle_sharp,
            color: kSecondaryColor,
          ),
        ),
      ),
    );
  }
}
