// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/HomeScreen/Details.dart';
import 'package:e_commerce/MVC/Controller/controller.dart';
import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Leads extends StatefulWidget {
  const Leads({super.key});

  @override
  State<Leads> createState() => _LeadsState();
}

class _LeadsState extends State<Leads> {
  final CustomerController _controller = Get.put(CustomerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kSecondaryColor,
        // color: Colors.black,
        appBar: AppBar(
          scrolledUnderElevation: 10.0,
          elevation: 10,

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
            "Customers",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: Obx(
          () => Visibility(
              visible: !_controller.isLoaded.value,
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              child: ListView.builder(
                  itemCount: _controller.customerModel[0].length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      // focusNode: FocusNode(debugLabel: "drcfvg"),
                      onTap: () {
                        Get.to(() => DetailsPage(
                              Id: _controller.customerModel[0][index].id,
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
                                _controller.customerModel[0][index].name
                                    .toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                _controller.customerModel[0][index].email
                                    .toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })),
        ));
  }
}
