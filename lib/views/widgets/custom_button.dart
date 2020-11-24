import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final IconData icon;
  final Color color;
  final Color textColor;
  final Color borderColor;

  CustomButton({
    @required this.onPressed,
    @required this.text,
    this.color,
    this.textColor,
    this.borderColor = Colors.transparent,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Opacity(
        opacity: onPressed == null ? 0.5 : 1,
        child: RaisedButton.icon(
          onPressed: onPressed,
          color: color,
          icon: icon != null ? Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(icon),
          ) : Container(),
          textColor: textColor,
          padding: EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(color: borderColor)
          ),
          label: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              text,
            ),
          ),
        ),
      ),
    );
  }
}