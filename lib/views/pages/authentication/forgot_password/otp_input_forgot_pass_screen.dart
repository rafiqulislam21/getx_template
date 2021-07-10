import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_template/views/widgets/custom_pin_input/mpin_page.dart';
import 'package:getx_template/views/widgets/widgets.dart';

import 'new_password_screen.dart';

class OtpInputForgotPassScreen extends StatelessWidget {

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
          child: CustomPinInput(
            pinLength: 4,
            resendDuration: 10,
            matchingOtp: "1234",
            onMatched: (mPin) {
                      print('You entered -> $mPin');
                      Get.to(NewPasswordScreen());
                    },
            resendOnPress: (){

            },
          )
        ),
    );
  }
}
