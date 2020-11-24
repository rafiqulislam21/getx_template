import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldPassword extends StatefulWidget {
  final String hintText;
  final String labelText;
  final IconData icon;
  final TextEditingController controller;
  final bool isNumberInputOnly;
  final formKey;

  CustomTextFieldPassword(
      {this.icon,
        this.hintText,
        this.labelText,
        this.controller,
        this.isNumberInputOnly,
        this.formKey});

  @override
  _CustomTextFieldPasswordState createState() => _CustomTextFieldPasswordState();
}

class _CustomTextFieldPasswordState extends State<CustomTextFieldPassword> {
  bool  passwordVisible;

  @override
  void initState() {
    passwordVisible = true;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextField(
          controller: widget.controller,
          obscureText: passwordVisible ? true : false,
          decoration: InputDecoration(
            prefixIcon: widget.icon == null ? null : Padding(
                padding: const EdgeInsets.all(10.0),
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
            border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Theme.of(context).accentColor)),
            contentPadding: EdgeInsets.all(10),
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
