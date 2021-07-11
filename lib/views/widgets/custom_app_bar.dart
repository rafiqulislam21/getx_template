import 'package:flutter/material.dart';

import 'widgets.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final Widget? title;
  final Widget? leading;
  final double? titleSpacing;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  final Widget? flexibleSpace;
  final bool transparentBg;

  const CustomAppBar({
    Key? key,
    this.actions,
    this.title,
    this.leading,
    this.titleSpacing,
    this.transparentBg = false,
    this.centerTitle = false,
    this.bottom,
    this.flexibleSpace,
  }) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      /*flexibleSpace: Theme.of(context).brightness == Brightness.light ? Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color(0xff4167b0),
                    Color(0xff18ffff),
                  ])
          )
      ) : null,*/
      backgroundColor: widget.transparentBg ? Colors.transparent : null,
      elevation: widget.transparentBg ? 0 : null,
      shadowColor: widget.transparentBg ? Colors.transparent : null,
      leading: widget.leading ?? (widget.transparentBg
          ? CustomRoundButton(
              icon: Icons.chevron_left,
              iconColor: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null),
      titleSpacing: widget.titleSpacing,
      actions: widget.actions,
      title: widget.title,
      centerTitle: widget.centerTitle,
      bottom: widget.bottom,
      flexibleSpace: widget.flexibleSpace,
      automaticallyImplyLeading: false,
    );
  }
}
