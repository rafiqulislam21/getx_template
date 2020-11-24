import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  final String title;
  final Color color;
  final List<Widget> design;
  final Function onPressed;
  final String btnText;

  CustomDialog(
      {this.title, this.color, this.design, this.onPressed, this.btnText});

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: SingleChildScrollView(
        child: Container(
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SelectableText(
                          widget.title ?? " ",
                          /*style: TextStyle(
                              fontSize: 16,
                              fontFamily: GoogleFonts.arvo().fontFamily
                          ),*/
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.design ?? [Container()],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment:  widget.btnText == null ? MainAxisAlignment.center : MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),
                                side: BorderSide(color: Theme.of(context).accentColor)),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Close",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          widget.btnText == null ? SizedBox(): FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.transparent)),
                            onPressed: widget.onPressed,
                            child: Text(
                              widget.btnText ?? "",
                              style: TextStyle(fontSize: 12,color: Colors.white),
                            ),
                            color:
                                widget.color ?? Theme.of(context).primaryColor,
                          ),
                        ],
                      )
                    ],
                  ),
                /*  Positioned(
                    child: IconButton(
                      icon: Icon(Icons.highlight_off),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    right: -12,
                    top: -12,
                  )*/
                ],
              )),
        ),
      ),
    );
  }
}
