import 'package:flutter/material.dart';

class CustomSocialMediaButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String imageIcon;

  const CustomSocialMediaButton({Key? key, this.onPressed, required this.imageIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onPressed,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.asset(
            imageIcon,
            height: 40,
            width: 40,
          ),
        ),
      ),
    );
  }
}