import 'package:flutter/material.dart';
import 'package:getx_template/constants/app_sizes.dart';

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
    return Padding(
      padding: const EdgeInsets.all(AppSizes.PADDING),
      child: Container(
        width: isExpand ? double.infinity : null,
        child: Opacity(
          opacity: onPressed == null ? 0.5 : 1,
          child: ElevatedButton.icon(

            style: ButtonStyle(
                shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(AppSizes.RADIUS),
              ),
            )),
            ),
            onPressed: onPressed as void Function()?,
            icon: icon != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(icon, color: Colors.white),
                  )
                : Container(),
            label: Padding(
              padding:
                  const EdgeInsets.only(right: 8.0, top: 16.0, bottom: 16.0),
              child: Text(
                text,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
