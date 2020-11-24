import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CustomLoading {

  CustomLoading.show(){
    Get.snackbar(
      "Loading",
      "Please wait...",
      snackPosition: SnackPosition.TOP,
      isDismissible: false,
      icon: Padding(
        padding: const EdgeInsets.all(4.0),
        child: CircularProgressIndicator(),
      ),

    );
  }
}
