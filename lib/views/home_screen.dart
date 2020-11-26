import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_template/utils/language_services.dart';
import 'package:getx_template/utils/theme_services.dart';
import 'package:getx_template/views/shopping_page.dart';

import 'news_page.dart';
import 'view_all_widgets.dart';

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
            ListTile(
                leading: Icon(ThemeService().loadThemeFromBox() ? Icons.wb_twighlight : Icons.wb_sunny_sharp),
                title:  Text('change_theme'.tr),
                subtitle: Text(ThemeService().loadThemeFromBox() ? 'dark'.tr : 'light'.tr),
                trailing: Switch(
                  value: ThemeService().loadThemeFromBox(),
                  onChanged: (val){
                    ThemeService().switchTheme();
                  },
                  activeColor: Theme.of(context).accentColor,
                )
            ),

            ListTile(
              leading: Icon(Icons.translate),
              title:  Text('change_language'.tr),
              subtitle: Text(LanguageService().locale.languageCode == 'bn' ? 'bengali'.tr : 'english'.tr),
              trailing: Switch(
              value: LanguageService().locale.languageCode == 'bn' ? true : false,
              onChanged: (val){
                if(val){
                  LanguageService().switchLanguage(changeLocale: Locale('bn','BD'));
                }else{
                  LanguageService().switchLanguage(changeLocale: Locale('en','US'));
                }
              },
              activeColor: Theme.of(context).accentColor,
            )
            ),

            ListTile(
                leading: Icon(Icons.widgets),
                title:  Text('Essential widgets'),
                subtitle: Text('Custom widgets for use'),
                trailing: Icon(Icons.keyboard_arrow_right),
              onTap: (){
                Get.to(
                  ViewAllWidgets(),
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOutBack,
                  transition: Transition.zoom,
                );
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
              RaisedButton(
                  child: Text("News"),
                  onPressed: () {
                    Get.to(
                      NewsPage(),
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
        // color: Get.theme.cardColor,
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
      backgroundColor: Get.theme.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
      ),
    );
  }
}
