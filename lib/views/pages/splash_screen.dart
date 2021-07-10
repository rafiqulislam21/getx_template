import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:getx_template/constants/app_images.dart';
import 'package:getx_template/constants/app_sizes.dart';
import 'package:getx_template/views/pages/authentication/login/login_screen.dart';
import 'package:getx_template/views/pages/home_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initialize();
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Hero(
              tag: "logo",
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.deepOrange[400],
                    borderRadius: BorderRadius.circular(500)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.deepOrange[300],
                        borderRadius: BorderRadius.circular(500)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.deepOrange[200],
                              borderRadius: BorderRadius.circular(500)),
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.deepOrange[100],
                                  borderRadius: BorderRadius.circular(500)),
                              child: Image.asset(
                                AppImages.LOGO,
                                // fit: BoxFit.fitWidth,
                                height: AppSizes.height / 5,
                                alignment: Alignment.center,
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Text(
              "X Company",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              "The Complete IT Solution",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  letterSpacing: 5
              ),
            ),
            SizedBox(
              height: 50,
            ),
            /*SpinKitFadingCircle(
                        color: Colors.blue,
                      ),*/
          ],
        ),
      ),
    );
  }

  initialize() async {
    await 4.delay();
    /*Get.off(
      HomeScreen(),
      duration: Duration(seconds: 1),
      curve: Curves.easeInOutBack,
      transition: Transition.rightToLeftWithFade,
    );*/
    Get.off(
      LoginScreen(),
      duration: Duration(seconds: 1),
    );
  }
}
