// ignore_for_file: avoid_unnecessary_containers

import 'dart:developer';

import 'package:e_commerce/MVC/Controller/Services.dart';
import 'package:e_commerce/MVC/Models/Customer_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/controller.dart';

class HomePage_View extends StatefulWidget {
  const HomePage_View({super.key});

  @override
  State<HomePage_View> createState() => _HomePage_ViewState();
}

class _HomePage_ViewState extends State<HomePage_View> {
  final CustomerController _controller = Get.put(CustomerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Visibility(
        visible: _controller.isLoaded.value,
        // ignore: sort_child_properties_last
        child: ListView.builder(
            itemCount: _controller.customerModel[0].length,
            itemBuilder: (context, index) {
              return Container(
                child:
                    Text(_controller.customerModel[0][index].name.toString()),
              );
            }),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
