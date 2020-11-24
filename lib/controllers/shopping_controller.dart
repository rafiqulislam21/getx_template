import 'package:get/state_manager.dart';
import 'package:getx_template/models/products.dart';
import 'package:getx_template/utils/network_services.dart';

class ShoppingController extends GetxController {
  NetworkServices networkServices = NetworkServices();
  var products = List<Product>().obs;

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

  void fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(
          id: 1,
          price: 30,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'FirstProd'),
      Product(
          id: 2,
          price: 40,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'SecProd'),
      Product(
          id: 3,
          price: 49.5,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'ThirdProd'),
    ];

    products.assignAll(productResult);
  }
}