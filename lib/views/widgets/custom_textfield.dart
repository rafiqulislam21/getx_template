import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getx_template/constants/app_sizes.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final IconData? icon;

  final TextEditingController? controller;
  final bool? isNumberInputOnly;
  final formKey;
  final readOnly;

  CustomTextField(
      {this.hintText,
        this.controller,
        this.isNumberInputOnly,
        this.formKey,
        this.readOnly,
        this.icon,
        this.labelText});

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
          enabled: readOnly == true ? false : true,
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,

             prefixIcon: icon == null ? null : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon
              )
            ),
            hintText: hintText,
            labelText: labelText??hintText,
            // border: new OutlineInputBorder(
            //     borderSide: new BorderSide(color: Theme.of(context).accentColor)),
            contentPadding: EdgeInsets.all(8.0),
          ),
          keyboardType: isNumberInputOnly == true
              ? TextInputType.number
              : TextInputType.text,
          inputFormatters: isNumberInputOnly == true
              ? <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ] : null,
        ),
      ),
    );
  }
}