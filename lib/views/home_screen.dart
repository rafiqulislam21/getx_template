import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_template/models/products.dart';
import 'package:getx_template/utils/theme_services.dart';
import 'package:getx_template/views/shopping_page.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'.tr),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              color: context.theme.buttonColor,
              child: Text(
                'Change Theme',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: ThemeService().switchTheme,
            ),
            RaisedButton(
              color: context.theme.buttonColor,
              child: Text(
                'Change Language',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: (){
                var locale = Locale('bn', 'BD');
                Get.updateLocale(locale);
                print(Get.locale);
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              RaisedButton(
                  child: Text("Products"),
                  onPressed: () {
                    Get.to(
                      ShoppingPage(),
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOutBack,
                      transition: Transition.zoom,
                    );
                  }
                  ),
          // Get.to(NextScreen());
          // Get.toNamed('/details');
          // Get.back();
          // Get.off(NextScreen());
          // Get.offAll(NextScreen());
              RaisedButton(
                child: Text("Go To Second"),
                onPressed: () => goToNext(),
              ),
              RaisedButton(
                child: Text("Snackbar"),
                onPressed: _showSnackBar,
              ),
              RaisedButton(
                child: Text("Dialog"),
                onPressed: _showDialog,
              ),
              RaisedButton(
                child: Text("Bottom Sheet"),
                onPressed: _showBottomSheet,
              ),
              SizedBox(
                height: 40,
              ),
              /*RaisedButton(
                child: Text("Name Route: /second"),
                onPressed: () {
                  Get.toNamed("/second");
                },
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  goToNext() {
    //Navigator.push(context, MaterialPageRoute(builder: (context)=>Second()));
    navigator.push(MaterialPageRoute(builder: (context) => ShoppingPage()));
    //Get.to(Second());
  }

  _showSnackBar() {
    Get.snackbar(
      "Hey There",
      "Snackbar is easy",
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 5),
      dismissDirection: SnackDismissDirection.HORIZONTAL,
    );
  }

  _showDialog() {
    Get.defaultDialog(
      title: "Simple Dialog",
      content: Text("Too Easy"),
      // cancel: Text("Cancel"),
      onCancel: (){
        print("taouched");
        Get.back();
      },
      radius: 10,
    );
  }

  _showBottomSheet() {
    Get.bottomSheet(
      Container(
        child: Wrap(
          children: <Widget>[
            ListTile(
                leading: Icon(Icons.music_note),
                title: Text('Music'),
                onTap: () => {}),
            ListTile(
              leading: Icon(Icons.videocam),
              title: Text('Video'),
              onTap: () => {},
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      enableDrag: true,
    );
  }
}
