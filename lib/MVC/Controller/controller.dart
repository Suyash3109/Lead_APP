import 'dart:developer';

import 'package:e_commerce/MVC/Models/detail_model.dart';
import 'package:get/get.dart';

import '../Models/Customer_model.dart';
import 'Services.dart';

class CustomerController extends GetxController {
  RxList<CustomerModel> customerModel = <CustomerModel>[].obs;
  RxBool isLoaded = true.obs;

  var lead_details = [].obs;
  RxBool loadingdetails = true.obs;

  getdata() async {
    isLoaded(true);
    try {
      var customerModel1 = await RemoteServices.getPosts();
      if (customerModel1 != null) {
        customerModel.assignAll(customerModel1);
      }
      // log(customerModel1.toString());
    } finally {
      isLoaded(false);
    }
  }

  getdetails(var Id) async {
    loadingdetails(true);
    try {
      var Lead_details1 = await DetailServices.leaddetails(Id);
      if (Lead_details1 != null) {
        lead_details.assign(Lead_details1);
      }
      // log(lead_details.toString());
    } finally {
      loadingdetails(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getdata();

    super.onInit();
  }
}
