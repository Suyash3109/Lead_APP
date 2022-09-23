// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_commerce/HomeScreen/Complete_details.dart';
import 'package:e_commerce/HomeScreen/Notes.dart';
import 'package:e_commerce/MVC/Controller/controller.dart';
import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_sms/flutter_sms.dart';

class DetailsPage extends StatefulWidget {
  var Id;
  DetailsPage({super.key, required this.Id});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final CustomerController _controller = Get.find<CustomerController>();
  var myMenuItems = <String>[
    'Edit',
  ];
  @override
  void initState() {
    // TODO: implement initState
    _controller.getdetails(widget.Id);

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget.Id;
    super.dispose();
  }

  String message = "This is a test message";

  void _sendMessage(String message) async {
    // String recipents = "${(_controller.lead_details[0].phonenumber)}";
    String _result = await sendSMS(
            message: message,
            recipients: [_controller.lead_details[0].phonenumber])
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }

  void send_email() async {
    final Email email = Email(
      body: 'Email body',
      subject: 'Email subject',
      recipients: ['${_controller.lead_details[0].email}'],
      // cc: ['cc@example.com'],
      // bcc: ['bcc@example.com'],
      // attachmentPaths: ['/path/to/attachment.zip'],
      isHTML: false,
    );

    await FlutterEmailSender.send(email);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: kSecondaryColor,
          appBar: AppBar(
            iconTheme: IconThemeData(color: kSecondaryColor),
            backgroundColor: kPrimaryColor,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: kSecondaryColor,
                ),
                onPressed: () {
                  Get.back();
                }),
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
                    }
                  })
            ],
            centerTitle: true,
            title: Text("D E T A I L S",
                style: TextStyle(
                  color: kSecondaryColor,
                )),
          ),
          body: Obx(
            () => _controller.loadingdetails.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 15),
                        child: Text(
                          _controller.lead_details[0].name.toString(),
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Text(
                          timeago.format(DateTime.parse(_controller
                              .lead_details[0].dateadded
                              .toString())),
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            // splashColor: kPrimaryColor,

                            onTap: () => launch(
                                "tel://${_controller.lead_details[0].phonenumber}"),
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.blue),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.call,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "CALL",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _sendMessage(message);
                            },
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.green),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.chat,
                                      color: Colors.green,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "TEXT",
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: send_email,
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.email_sharp,
                                      color: Colors.red,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "EMAIL",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Divider()
                      Container(
                        height: 60,
                        child: TabBar(
                            indicator: const BoxDecoration(
                                color: kPrimaryColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(117, 94, 43, 114),
                                    offset: Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 10.0,
                                    spreadRadius: 2.0,
                                  ), //BoxShadow
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            indicatorColor: Colors.transparent,
                            automaticIndicatorColorAdjustment: true,
                            unselectedLabelColor: Colors.grey,
                            labelColor: kSecondaryColor,
                            indicatorPadding: EdgeInsets.all(10),
                            indicatorWeight: 5.0,
                            // indicatorSize: TabBarIndicatorSize.label,
                            physics: BouncingScrollPhysics(),
                            // controller: TabController(length: length, vsync: vsync),
                            tabs: [
                              Text(
                                "Details",
                                style: TextStyle(
                                    // color: kPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                "Notes",
                                style: TextStyle(
                                    // color: kPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ]),
                      ),
                      Flexible(
                        child: TabBarView(children: [
                          CompleteDetails(),
                          Notes(),
                        ]),
                      )
                    ],
                  ),
          ),
        ));
  }
}
