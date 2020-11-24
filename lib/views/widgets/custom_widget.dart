import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CustomWidget extends StatelessWidget {
  final IconData icon;
  final int iconSize;

  const CustomWidget({Key key, this.icon, this.iconSize}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Get.theme.cardColor,
              borderRadius: BorderRadius.circular(8)
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                icon??Icons.error_outline,
                color: Get.theme.splashColor,
                size: iconSize??80,
              ),
            ),
          )
      ),
    );
  }
}
