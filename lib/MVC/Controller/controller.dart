import 'dart:developer';

import 'package:get/get.dart';

import '../Models/Customer_model.dart';
import 'Services.dart';

class CustomerController extends GetxController {
  var customerModel = [].obs;
  RxBool isLoaded = true.obs;

  getdata() async {
    isLoaded(true);
    try {
      var customerModel1 = await RemoteServices.getPosts();
      if (customerModel1 != null) {
        customerModel.assign(customerModel1);
      }
      log(customerModel.toString());
    } finally {
      isLoaded(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getdata();
    super.onInit();
  }
}
