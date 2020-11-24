import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final int current;
  final List dropItems;
  final String hintText;
  final Function(dynamic) onchange;
  final isSmall;
  final isBold;

  CustomDropdown(
      {
        @required this.hintText,
        @required this.dropItems,
        this.onchange,
        this.current,
        this.isSmall,
        this.isBold});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
//    widget.dropValue = widget.dropItems[0];
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: widget.isSmall == true ? const EdgeInsets.all(0.0) : const EdgeInsets.all(2.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Row(
          children: <Widget>[
            SizedBox(
              width:  widget.isSmall == true ? 0 : 10,
            ),
            Expanded(
              child: DropdownButton(
                isDense:  widget.isSmall == true ? true : false,
                dropdownColor: Theme.of(context).cardColor,
                hint: Text(
                  widget.hintText,
                  style: widget.isBold == true ? TextStyle(
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF918f95),
                  ) : null,
                  overflow: TextOverflow.ellipsis
                ),
                isExpanded: true,
                value: widget.current,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Theme.of(context).accentColor,
                ),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: widget.isBold == true ? width * 0.05 : null,
                  fontWeight: widget.isBold == true ? FontWeight.bold : null,
//                  color: const Color(0xFF918f95
                ),
                underline: Container(
                  height: 0,
                  color: Colors.transparent,
                ),
                onChanged: widget.onchange,
                items: widget.dropItems?.map((key) {
                  return DropdownMenuItem(
                    value: int.parse(key['id'].toString()),
                    child: Text(key['name']??key['country_name']),
                  );
                })?.toList()??[],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
