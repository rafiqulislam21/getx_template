import 'package:get/get.dart';
import 'package:getx_template/controllers/base_controller.dart';
import 'package:getx_template/models/demo_data/demo_data_model.dart';
import 'package:getx_template/services/base_client.dart';

class TestController extends GetxController with BaseController {
  var demoData = DemoModel().obs;


  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    demoData.value = null;
    await Future.delayed(Duration(milliseconds: 100));
    showLoading('Fetching data');
    var response = await BaseClient()
        .get('https://jsonplaceholder.typicode.com', '/todos/1')
        .catchError(handleError);
    if (response != null) {
      demoData.value = DemoModel.fromJson(response);
    }
    else{
      return;
    }
    hideLoading();
    print(response);
  }


  void postData() async {
    var request = {'message': 'CodeX sucks!!!'};
    showLoading('Posting data...');
    var response = await BaseClient()
        .post('https://jsonplaceholder.typicode.com', '/posts', request)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    print(response);
  }
}
