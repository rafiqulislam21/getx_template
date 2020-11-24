import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final Function onPress;
  final Function switchOnChanged;
  final switchValue;
  final Color color;

  const DrawerItem({
    this.icon,
    this.title,
    this.onPress,
    this.color,
    Key key,
    this.subTitle,
    this.switchOnChanged,
    this.switchValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress ?? () {},
      child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 12.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Icon(
                      icon,
                      color: color?? Theme.of(context).textTheme.caption.color,
                      size: 28.0,
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            title,
                            style: TextStyle(
                                //fontWeight: FontWeight.w500,
                                color: Colors.grey[500]
//                color: Colors.white,
                                ),
                          ),
                          subTitle == null
                              ? SizedBox()
                              : Text(
                                  subTitle,
                                  style: TextStyle(
                                      //fontWeight: FontWeight.w500,
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                  ),
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 2,
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              switchValue == null
                  ? SizedBox()
                  : Switch(
                      value: switchValue,
                      onChanged: switchOnChanged,
                      activeColor: Theme.of(context).accentColor,
                    )
            ],
          )),
    );
  }
}
