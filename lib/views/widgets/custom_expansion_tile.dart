import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Color? color;
  final List<Widget>? children;

  const CustomExpansionTile({
    this.icon,
    this.title,
    this.color,
    this.children,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 0.0,
          vertical: 12.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  icon,
                  color: color,
                  size: 28.0,
                ),
                SizedBox(
                  width: 16.0,
                ),
                Text(
                  title!,
                  style: TextStyle(
                    //fontWeight: FontWeight.w500,
                      color: Colors.grey[600]
//                color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      children:
      children??[Container()],
    );
  }
}