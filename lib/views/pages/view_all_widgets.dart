import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/widgets.dart';

class ViewAllWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'.tr),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  EmptyWidget(),
                  EmptyWidget(
                    icon: Icons.wifi_off,
                  ),
                  EmptyWidget(
                    icon: Icons.hourglass_empty,
                  ),
                  CustomTextField(
                    icon: Icons.search,
                    hintText: "Enter here....",
                    labelText: "Label here",
                  ),
                  CustomTextFieldPassword(
                    icon: Icons.lock_open_rounded,
                    hintText: "123456",
                    labelText: "Password",
                  ),
                  CustomButton(
                    icon: Icons.add,
                    text: "Custom Button",
                    onPressed: (){

                    },
                  ),
                  CloseButton(
                    color: Colors.green,
                    onPressed: (){

                    },
                  ),
                  CustomButton(
                    text: "loading widget",
                    onPressed: (){
                      CustomLoading.show();
                    },
                  ),
                  CustomCachedNetworkImage(
                    url: "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png",
                    width: 200,
                  ),
                  Container(
                      height: 500,
                      child: CustomWebView(url: 'https://www.google.com/')),
                  CustomCategoryTile(
                    title: "Category",
                    icon: Icons.arrow_right,
                  ),
                  CustomToggleButton(
                    values: ['on','off'],

                    onToggleCallback: (index){
                      print(index);
                    },
                  ),
                  CustomExpansionTile(
                    icon: Icons.widgets,
                    color: Get.theme.splashColor,
                    title: "Title",
                    children: [
                      Text("item"),
                      Text("item"),
                      Text("item"),
                      Text("item"),
                    ],
                  )
                  /*Container(
                    height: 200,
                    child: CustomWebView(
                      url: "https://www.google.com",
                    ),
                  )*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
