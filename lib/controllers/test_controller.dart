import 'package:get/get.dart';
import 'package:getx_template/constants/api_urls.dart';
import 'package:getx_template/controllers/base_controller.dart';
import 'package:getx_template/models/demo_data/demo_data_model.dart';
import 'package:getx_template/services/base_client.dart';

class TestController extends GetxController with BaseController {
  Rx<DemoModel?>? demoData = DemoModel().obs;
  Rx<bool> hasData = false.obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    // demoData?.value = null;
    await Future.delayed(Duration(milliseconds: 100));
    showLoading('Fetching data');
    var response =
        await BaseClient().get(ApiUrls.TODO_API).catchError(handleError);
    if (response != null) {
      demoData?.value = DemoModel.fromJson(response);
      hasData.value = true;
    }
    // else {
    //   return;
    // }
    hideLoading();
    print(response);
  }

  void postData() async {
    var request = {'message': 'some test data'};
    showLoading('Posting data...');
    var response = await BaseClient()
        .post(ApiUrls.POST_DATA_API, body: request)
        .catchError(handleError);
    if (response == null) return;
    hideLoading();
    print(response);
  }
}
