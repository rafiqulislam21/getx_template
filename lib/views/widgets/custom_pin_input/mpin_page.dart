import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'mpin_widget.dart';

class CustomPinInput extends StatefulWidget {
  final IconData? icon;
  final int pinLength;
  final String? matchingOtp;
  final Function(String) onMatched;
  final int resendDuration;
  final VoidCallback resendOnPress;

  const CustomPinInput(
      {Key? key,
      this.icon = Icons.lock_open_rounded,
      required this.pinLength,
      required this.onMatched,
      this.resendDuration = 30,
      required this.resendOnPress,
      required this.matchingOtp})
      : super(key: key);

  @override
  _CustomPinInputState createState() => _CustomPinInputState();
}

class _CustomPinInputState extends State<CustomPinInput> {
  MPinController mPinController = MPinController();
  int _start = 30;
  Timer? _timer;

  @override
  void initState() {
    _start = widget.resendDuration;
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          /*Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.white, Colors.grey, Colors.black],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
          ),*/
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    widget.icon,
                    color: Theme.of(context).primaryColor.withOpacity(0.9),
                    size: 120,
                  ),
                  Text(
                    "Please Enter ${widget.pinLength} digit OTP",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  MPinWidget(
                    pinLength: widget.pinLength,
                    controller: mPinController,
                    onCompleted: (mPin) {
                      // print('You entered -> $mPin');
                      if (mPin == widget.matchingOtp) {
                        widget.onMatched(mPin);
                        print("otp matched");
                        /*showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Success'),
                                content: Text('Go to next page'),
                              );
                            });*/
                      } else {
                        //animate wrong input
                        mPinController.notifyWrongInput();
                      }
                    },
                  ),
                  SizedBox(height: 16),
                  _start == widget.resendDuration
                      ? RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Didn't received code?",
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                              TextSpan(
                                  text: " Resend",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print("Api call for resend otp");
                                      startTimer();
                                      widget.resendOnPress();
                                    }),
                            ],
                          ),
                        )
                      : Text(
                          "Resend OTP in" + " $_start s",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                  Divider(),
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    childAspectRatio: 1.6,
                    children: List.generate(
                        9, (index) => buildMaterialButton(index + 1)),
                  ),
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    childAspectRatio: 1.6,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          mPinController.delete();
                        },
                        textColor: Theme.of(context).primaryColor,
                        child: Icon(Icons.clear),
                      ),
                      buildMaterialButton(0),
                      MaterialButton(
                        onPressed: () {
                          mPinController.delete();
                        },
                        textColor: Theme.of(context).primaryColor,
                        child: Icon(Icons.backspace_rounded),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  MaterialButton buildMaterialButton(int input) {
    return MaterialButton(
      onPressed: () {
        mPinController.addInput('$input');
      },
      textColor: Theme.of(context).primaryColor,
      child: Text(
        '$input',
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
            _start = widget.resendDuration;
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }
}
