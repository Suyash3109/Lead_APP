// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:e_commerce/MVC/Controller/controller.dart';
import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeadStatus {
  LeadStatus(this.id, this.name);

  final String name;
  final int id;
}

class CompleteDetails extends StatefulWidget {
  CompleteDetails({super.key});

  @override
  State<CompleteDetails> createState() => _CompleteDetailsState();
}

class _CompleteDetailsState extends State<CompleteDetails> {
  final CustomerController _controller = Get.find<CustomerController>();
  var dropDownvalue = LeadStatus(2, "Not Connected");

  var selectedUser;

  var items = [
    LeadStatus(11, "Assigned to Dhawal - Surat"),
    LeadStatus(12, "Assigned to Kshitij - Mumbai"),
    LeadStatus(7, "Costing Approved"),
    LeadStatus(1, "Customer"),
    LeadStatus(8, "Designed Submitted"),
    LeadStatus(13, "Future Lead"),
    LeadStatus(4, "Get Layout"),
    LeadStatus(3, "Junk Lead"),
    LeadStatus(10, "Lost Lead"),
    LeadStatus(2, "Not Connected"),
    LeadStatus(14, "Only Furniture"),
    LeadStatus(9, "Qualified"),
    LeadStatus(6, "Quotation Submitted"),
    LeadStatus(5, "Requested for Quote"),
    LeadStatus(15, "Under 7 Lacs"),
  ];
  @override
  void initState() {
    dropDownvalue = items[0];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 45,
      borderOnForeground: true,
      // surfaceTintColor: kSecondaryColor,000

      color: kSecondaryColor,
      shadowColor: kPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Name:",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    _controller.lead_details[0].name.toString(),
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              Divider(
                color: Colors.black,
                height: 25,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Title:",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    _controller.lead_details[0].title.toString(),
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              // SizedBox(height: 15),
              Divider(
                color: Colors.black,
                height: 25,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Email:",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    _controller.lead_details[0].email.toString(),
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              // SizedBox(height: 15),
              Divider(
                color: Colors.black,
                height: 25,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Phone:",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    _controller.lead_details[0].phonenumber.toString(),
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              Divider(
                color: Colors.black,
                height: 25,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Address:",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 85,
                  ),
                  Expanded(
                    child: Text(
                      _controller.lead_details[0].address.toString(),
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
              Divider(
                color: Colors.black,
                height: 25,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "City:",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    _controller.lead_details[0].city.toString(),
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              Divider(
                color: Colors.black,
                height: 25,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "State:",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    _controller.lead_details[0].state.toString(),
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )
                ],
              ),

              Divider(
                color: Colors.black,
                height: 25,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Zip:",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    _controller.lead_details[0].zip.toString(),
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),

              Divider(
                color: Colors.black,
                height: 25,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Status:",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  DropdownButton<LeadStatus>(
                    alignment: Alignment.bottomRight,
                    value: dropDownvalue,
                    elevation: 10,
                    items: items.map((LeadStatus lvalue) {
                      return DropdownMenuItem<LeadStatus>(
                          value: lvalue,
                          child: Text(
                            lvalue.name,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ));
                    }).toList(),
                    onChanged: (LeadStatus? newValue) {
                      log(newValue!.id.toString());
                      setState(() {
                        dropDownvalue = newValue;
                      });
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
