import 'package:e_commerce/MVC/Models/Customer_model.dart';
import 'package:flutter/material.dart';

class HomePage_View extends StatefulWidget {
  const HomePage_View({super.key});

  @override
  State<HomePage_View> createState() => _HomePage_ViewState();
}

List<CustomerModel>? customerModel;

class _HomePage_ViewState extends State<HomePage_View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
    );
  }
}
