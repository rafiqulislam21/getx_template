import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function? onPressed;
  final String text;
  final IconData? icon;
  final bool isExpand;
  // final Color? color;
  // final Color? textColor;
  // final Color borderColor;

  CustomButton({
    this.onPressed,
    required this.text,
    // this.color,
    // this.textColor,
    // this.borderColor = Colors.transparent,
    this.icon,
    this.isExpand = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isExpand ? double.infinity : null,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Opacity(
          opacity: onPressed == null ? 0.5 : 1,
          child: ElevatedButton.icon(
            onPressed: onPressed as void Function()?,
            icon: icon != null ? Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(icon),
            ) : Container(),
            label: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                text,
              ),
            ),
          ),
        ),
      ),
    );
  }
}