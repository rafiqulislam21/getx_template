import 'package:flutter/material.dart';

class CustomRoundButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? imageIcon;
  final Color? iconColor;
  final IconData? icon;

  const CustomRoundButton(
      {Key? key, this.onPressed, this.imageIcon, this.iconColor, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: iconColor?.withOpacity(0.2),
        shadowColor: iconColor != null ? Colors.transparent : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: imageIcon != null
              ? Image.asset(
                  imageIcon??"",
                  height: 40,
                  width: 40,
                )
              : Icon(icon, color: iconColor),
        ),
      ),
    );
  }
}
