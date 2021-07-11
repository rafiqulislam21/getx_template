import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getx_template/constants/app_sizes.dart';

class CustomTextFieldPassword extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final IconData? icon;
  final TextEditingController? controller;
  final bool? isNumberInputOnly;

  CustomTextFieldPassword(
      {this.icon,
        this.hintText,
        this.labelText,
        this.controller,
        this.isNumberInputOnly,
      });

  @override
  _CustomTextFieldPasswordState createState() => _CustomTextFieldPasswordState();
}

class _CustomTextFieldPasswordState extends State<CustomTextFieldPassword> {
  late bool  passwordVisible;

  @override
  void initState() {
    passwordVisible = true;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.PADDING),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
          borderRadius:  BorderRadius.circular(AppSizes.RADIUS),
          /*border: Border.all(
              color: Theme.of(context).primaryColor.withOpacity(0.5),
          )*/
        ),
        child: TextField(
          controller: widget.controller,
          obscureText: passwordVisible ? true : false,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            prefixIcon: widget.icon == null ? null : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                    widget.icon
                )
            ),

            suffixIcon: IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(
                // Based on passwordVisible state choose the icon
                passwordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {
                setState(() {
                  passwordVisible = !passwordVisible;
                });
              },
            ),
            hintText: widget.hintText,
            labelText: widget.labelText??widget.hintText,
            // border: new OutlineInputBorder(
            //     borderSide: new BorderSide(color: Theme.of(context).accentColor)),
            contentPadding: EdgeInsets.all(8.0),
          ),
          keyboardType: widget.isNumberInputOnly == true
              ? TextInputType.number
              : TextInputType.text,
          inputFormatters: widget.isNumberInputOnly == true
              ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
              : null,
        ),
      ),
    );
  }
}
