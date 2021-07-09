import 'package:flutter/material.dart';

class CustomCategoryTile extends StatelessWidget {
  final String? title;
  final Function? onPress;
  final Color? color;
  final IconData? icon;

  const CustomCategoryTile({Key? key, this.title, this.onPress, this.color, this.icon}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: color??Theme.of(context).cardColor,
      padding: EdgeInsets.symmetric(horizontal: 8),
      onPressed: onPress as void Function()?,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title??""),
          icon == null ? SizedBox() : Icon(icon)
        ],
      ),
    );
  }
}