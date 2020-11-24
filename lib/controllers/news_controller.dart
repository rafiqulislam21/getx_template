import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:getx_template/models/news_model.dart';
import 'package:getx_template/utils/network_services.dart';

class NewsController extends GetxController {
  NetworkServices networkServices = NetworkServices();
  var latestNews = List<NewsModel>().obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  @override
  void dispose() {
    networkServices.dispose();
    super.dispose();
  }

  Future fetchData() async {
    Future.delayed(
        Duration.zero,
            () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false));
    print('response=============================here');
    String response = await networkServices.loadNews();
    // print(response);
    Map<String, dynamic> json = jsonDecode(response);
    // print(json);
    for (Map item in json['data']['latest']) {

      if (item['status'] == 1) {
        latestNews.add(NewsModel.fromJson(item));
      }
    }
    Get.back();
  }
}