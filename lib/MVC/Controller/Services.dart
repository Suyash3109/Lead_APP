import 'dart:developer';
// import 'dart:html';

import 'package:e_commerce/MVC/Models/Customer_model.dart';
import 'package:e_commerce/MVC/Models/detail_model.dart';
import 'package:e_commerce/MVC/Models/search_model.dart';
import 'package:e_commerce/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static Future getPosts() async {
    var headers = {
      'authtoken':
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoiQ2xpZW50IE1vYmlsZSIsIm5hbWUiOiJDbGllbnQgTW9iaWxlICIsIkFQSV9USU1FIjoxNjYyMDM3NTg1fQ.Mitu-l1fcEXf9FyaXCBvXv3vSHfhA2sy6FFLzOAo0ws',
      'Cookie':
          'csrf_cookie_name=1025ec366bf973ca2a3483d4b09df000; sp_session=4611tu6a02vmpe8vgnaavvrqu14fo4qa'
    };
    var client = http.Client();
    var uri = Uri.parse(
      'https://easel.inkcasa.com/crm/api/leads',
    );

    var response = await client.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var json = response.body;

      return customerModelFromJson(json);
    }
  }
}

class DetailServices {
  static Future leaddetails(var Id) async {
    var headers = {
      'authtoken':
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoiQ2xpZW50IE1vYmlsZSIsIm5hbWUiOiJDbGllbnQgTW9iaWxlICIsIkFQSV9USU1FIjoxNjYyMDM3NTg1fQ.Mitu-l1fcEXf9FyaXCBvXv3vSHfhA2sy6FFLzOAo0ws',
      'Cookie':
          'csrf_cookie_name=34cc836a7616f1c71009a904815b016e; sp_session=2bdtqcpn0nporbdm9ici3lkad9f6hl85'
    };

    var client = http.Client();
    var uri = Uri.parse(
      'https://easel.inkcasa.com/crm/api/leads/$Id',
    );

    var response = await client.get(uri, headers: headers);
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      var json = response.body;

      return getdetailsFromJson(json);
    }
  }
}

class SearchServices {
  static Future searchdetails(var name) async {
    var headers = {
      'authtoken':
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoiQ2xpZW50IE1vYmlsZSIsIm5hbWUiOiJDbGllbnQgTW9iaWxlICIsIkFQSV9USU1FIjoxNjYyMDM3NTg1fQ.Mitu-l1fcEXf9FyaXCBvXv3vSHfhA2sy6FFLzOAo0ws',
      'Cookie':
          'csrf_cookie_name=3ab5dd07e067cf59f09403e8030c0420; sp_session=sgq12dm0artb4fd6r00j7mkbut8gtpsu; csrf_cookie_name=3ab5dd07e067cf59f09403e8030c0420'
    };
    var client = http.Client();
    var uri = Uri.parse('https://easel.inkcasa.com/crm/api/leads/search/$name');
    var response = await client.get(uri, headers: headers);
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      var json = response.body;

      return searchDetailsFromJson(json);
    }
  }

  static Future addLead(
    var name,
    var emailAddress,
    var title,
    var phonenumber,
    var website,
    var company,
    var address,
    var city,
    var state,
    var zip,
    var budget,
    var description,
    var customerContactDate,
    var contactedToday,
    var isPublic,
  ) async {
    var body = ({
      'source': '1',
      'status': '2',
      'name': name,
      'assigned': '1',
      'tags': '',
      'contact': 'Contact A',
      'title': title,
      'email': emailAddress,
      'website': website,
      'phonenumber': phonenumber,
      'company': company,
      'address': address,
      'city': city,
      'state': state,
      'default_language': 'english',
      'description': description,
      'custom_contact_date': customerContactDate,
      'contacted_today': contactedToday,
      'is_public': isPublic,
      'budget': budget,
    });
    var headers = {
      'authtoken':
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoiQ2xpZW50IE1vYmlsZSIsIm5hbWUiOiJDbGllbnQgTW9iaWxlICIsIkFQSV9USU1FIjoxNjYyMDM3NTg1fQ.Mitu-l1fcEXf9FyaXCBvXv3vSHfhA2sy6FFLzOAo0ws',
      'Cookie': 'sp_session=jbpsa93o6on45h0mi7quttj4n5e30kaj'
    };
    var client = http.Client();
    var uri = Uri.parse('https://easel.inkcasa.com/crm/api/leads');

    var response = await client.post(uri, headers: headers, body: body);
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      var json = response.body;
      Fluttertoast.showToast(
        backgroundColor: kSecondaryColor,
        msg: "Lead Added Successfully",
        textColor: kPrimaryColor,
      );
    } else {
      print('error');
    }
  }
}
