// ignore_for_file: prefer_const_constructors

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:e_commerce/HomeScreen/Details.dart';
import 'package:e_commerce/MVC/Controller/controller.dart';
import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Leads extends StatefulWidget {
  const Leads({super.key});

  @override
  State<Leads> createState() => _LeadsState();
}

class _LeadsState extends State<Leads> {
  final CustomerController _controller = Get.put(CustomerController());

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();

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
            scrolledUnderElevation: 10.0,
            elevation: 10,
            actions: [
              AnimSearchBar(
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
          () => Visibility(
              visible: !_controller.isLoaded.value,
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: _controller.customerModel.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        // focusNode: FocusNode(debugLabel: "drcfvg"),
                        onTap: () {
                          Get.to(() => DetailsPage(
                                Id: _controller.customerModel[index].id,
                              ));
                        },
                        focusColor: Colors.red,
                        child: Card(
                          shadowColor: kPrimaryColor,
                          color: kSecondaryColor,
                          // ignore: prefer_const_constructors
                          margin: EdgeInsets.all(5),
                          elevation: 10,
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  _controller.customerModel[index].name
                                      .toString(),
                                  style: GoogleFonts.playfairDisplay(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                subtitle: Text(
                                  _controller.customerModel[index].email
                                      .toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 80),
        child: FloatingActionButton(
          splashColor: Colors.orange,
          highlightElevation: 20,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: () {},
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
