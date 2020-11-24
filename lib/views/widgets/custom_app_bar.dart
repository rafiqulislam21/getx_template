import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget{
  final isExpanded;
  final List<Widget> actions;
  final Widget title;
  final Widget leading;
  final double titleSpacing;



  const CustomAppBar({
    Key key,
    this.actions,
    this.title,
    this.isExpanded,
    this.leading,
    this.titleSpacing,
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
//      backgroundColor: Colors.transparent,
      flexibleSpace: Theme.of(context).brightness == Brightness.light ? Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color(0xff4167b0),
                    Color(0xff18ffff),
                  ])
          )
      ) : null,
      leading: widget.leading,
      titleSpacing: widget.titleSpacing??20,
      /* Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          onPressed: () {
          },
          color: Colors.white,
          child: Icon(
            Icons.trending_up,
//            color: AppColors.colorSchema['iconColor'],
          ),
        ),
      ),*/
      actions: widget.actions,
      title: widget.title,
      centerTitle: false,
//      titleSpacing: 0,
      automaticallyImplyLeading: false,
    );
  }
}
