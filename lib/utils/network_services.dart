import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class NetworkServices {
  http.Client client = http.Client();

  dispose() {
    client.close();
  }
  // ignore: non_constant_identifier_names
  static String BASE_URL = "http://202.74.48.100/api";

  final String newsAll = "$BASE_URL/v1/news/all";
  final String stockAll="$BASE_URL/v1/stock/all";


  Future loadStock() async {
    try {
      var response = await http.get(
        stockAll,
      );
      // print("${response.body}");
      if (response != null) return response.body;
      return null;
    } catch (e) {
      print(e);
    }
  }

  Future loadNews() async {
    try {
      var response = await http.get(
        newsAll,
      );
      // print("${response.body}");
      if (response != null) return response.body;
      return null;
    } catch (e) {
      print(e);
    }
  }
}
