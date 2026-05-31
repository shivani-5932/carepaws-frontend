import 'package:care_paws/modules/home/payment/payment_model.dart';
import 'package:care_paws/modules/profile/apc/dummy_data/dummy_payments.dart';
import 'package:care_paws/modules/profile/apc/model/profile_payment_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePaymentController extends GetxController {
  var payments = <ProfilePaymentModel>[].obs;

  @override
  void onInit() {
    loadPayments();
    super.onInit();
  }

  void loadPayments() {
    payments.value = dummyPayments;
  }
}