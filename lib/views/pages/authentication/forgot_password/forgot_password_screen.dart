import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_template/constants/app_images.dart';
import 'package:getx_template/constants/app_sizes.dart';
import 'package:getx_template/services/theme/themes.dart';
import 'package:getx_template/views/pages/home_screen.dart';
import 'package:getx_template/views/widgets/widgets.dart';

import 'otp_input_forgot_pass_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          transparentBg: true,
        ),
        body: Center(
          child: SingleChildScrollView(
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
                Text(
                  "Forgot Password?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: AppSizes.GAP_EX_SM,
                ),
                Text(
                  "Enter your registered phone number to receive \npassword reset instructions",
                  style: TextStyle(color: Themes.secondaryColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: AppSizes.GAP_SM,
                ),
                CustomTextField(
                  icon: Icons.phone,
                  hintText: "Phone",
                  isNumberInputOnly: true,
                ),
                SizedBox(
                  height: AppSizes.GAP_MD,
                ),
                CustomButton(
                  isExpand: true,
                  text: "Send OTP",
                  onPressed: () {
                    Get.to(OtpInputForgotPassScreen());
                  },
                ),
                SizedBox(
                  height: AppSizes.GAP_SM,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: AppSizes.GAP_EX_SM,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: " Back to Login",
                      style: TextStyle(
                        color: Get.theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.back();
                        }),
                ],
              ),
            ),
            SizedBox(
              height: AppSizes.GAP_EX_SM,
            ),
          ],
        ));
  }
}
