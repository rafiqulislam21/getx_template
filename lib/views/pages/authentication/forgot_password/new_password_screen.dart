import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_template/constants/app_images.dart';
import 'package:getx_template/constants/app_sizes.dart';
import 'package:getx_template/views/widgets/widgets.dart';

import '../login/login_screen.dart';

class NewPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        leading: CustomRoundButton(
          icon: Icons.chevron_left,
          iconColor: Get.theme.primaryColor,
          onPressed: (){
            Get.back();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: "logo",
              child: Image.asset(
                AppImages.LOGO,
                // fit: BoxFit.fitWidth,
                height: AppSizes.height / 8,
                alignment: Alignment.center,
              ),
            ),
            SizedBox(
              height: AppSizes.GAP_MD,
            ),
            CustomTextFieldPassword(
              icon: Icons.vpn_key_rounded,
              hintText: "New password",
            ),
            CustomTextFieldPassword(
              icon: Icons.vpn_key_rounded,
              hintText: "Enter password again",
            ),
            SizedBox(
              height: AppSizes.GAP_MD,
            ),
            CustomButton(
              isExpand: true,
              text: "Submit",
              onPressed: () {
                Get.offAll(LoginScreen());
              },
            ),
            SizedBox(
              height: AppSizes.GAP_SM,
            ),
          ],
        ),
      ),
    );
  }
}
