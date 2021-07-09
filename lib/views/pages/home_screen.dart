import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_template/services/language/language_services.dart';
import 'package:getx_template/services/theme/theme_services.dart';
import 'package:getx_template/views/pages/test_page.dart';

import 'view_all_widgets.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  final ValueNotifier<int> currentPage = ValueNotifier<int>(0);

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
                leading: Icon(ThemeService().loadThemeFromBox()
                    ? Icons.wb_twighlight
                    : Icons.wb_sunny_sharp),
                title: Text('change_theme'.tr),
                subtitle: Text(
                    ThemeService().loadThemeFromBox() ? 'dark'.tr : 'light'.tr),
                trailing: Switch(
                  value: ThemeService().loadThemeFromBox(),
                  onChanged: (val) {
                    ThemeService().switchTheme();
                  },
                  activeColor: Theme.of(context).accentColor,
                )),
            ListTile(
                leading: Icon(Icons.translate),
                title: Text('change_language'.tr),
                subtitle: Text(LanguageService().locale.languageCode == 'bn'
                    ? 'bengali'.tr
                    : 'english'.tr),
                trailing: Switch(
                  value: LanguageService().locale.languageCode == 'bn'
                      ? true
                      : false,
                  onChanged: (val) {
                    if (val) {
                      LanguageService()
                          .switchLanguage(changeLocale: Locale('bn', 'BD'));
                    } else {
                      LanguageService()
                          .switchLanguage(changeLocale: Locale('en', 'US'));
                    }
                  },
                  activeColor: Theme.of(context).accentColor,
                )),
            ListTile(
              leading: Icon(Icons.widgets),
              title: Text('Essential widgets'),
              subtitle: Text('Custom widgets for use'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
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
              // Get.to(NextScreen());
              // Get.toNamed('/details');
              // Get.back();
              // Get.off(NextScreen());
              // Get.offAll(NextScreen());
              ElevatedButton(
                child: Text("Snackbar"),
                onPressed: _showSnackBar,
              ),
              ElevatedButton(
                child: Text("Dialog"),
                onPressed: _showDialog,
              ),
              ElevatedButton(
                child: Text("Bottom Sheet"),
                onPressed: _showBottomSheet,
              ),
              ElevatedButton(
                child: Text("demo data"),
                onPressed: () {
                  Get.to(TestPage());
                },
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
      bottomNavigationBar: ValueListenableBuilder<int>(
          valueListenable: currentPage,
          builder: (BuildContext context, int value, Widget? child) {
            return BottomNavigationBar(
              currentIndex: currentPage.value,
              unselectedFontSize: 10,
              selectedFontSize: 10,
              onTap: (page) {
                currentPage.value = page;
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.mail),
                  label: 'Messages',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profile')
              ],
            );
          }),
    );
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
      onCancel: () {
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
