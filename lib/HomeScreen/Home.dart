import 'package:e_commerce/MVC/Controller/controller.dart';
import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HOme extends StatefulWidget {
  const HOme({super.key});

  @override
  State<HOme> createState() => _HOmeState();
}

class _HOmeState extends State<HOme> {
  final CustomerController _controller = Get.put(CustomerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
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
          "Home",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      body: Visibility(
          child: ListView.builder(
              itemCount: _controller.customerModel[0].length,
              itemBuilder: (context, index) {
                return Container();
              })),
      // color: Colors.blue,
    );
  }
}
