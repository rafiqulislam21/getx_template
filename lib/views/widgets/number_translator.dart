import 'package:flutter/cupertino.dart';

class NumberTranslator {
  /*final String number;

  NumberTranslator({@required this.number});*/

  static String translate({@required String number}) {
    String numberStr = number.toString();
    String newNumberStr = "";
    if (number != null) {
           for (int i = 0; i < numberStr.length; i++) {
        if (numberStr[i] == '.') {
          newNumberStr = newNumberStr + ".";
        }else if (numberStr[i] == '0') {
          newNumberStr = newNumberStr + "০";
        }else if (numberStr[i] == '1') {
          newNumberStr = newNumberStr + "১";
        }else if (numberStr[i] == '2') {
          newNumberStr = newNumberStr + "২";
        }else if (numberStr[i] == '3') {
          newNumberStr = newNumberStr + "৩";
        }else if (numberStr[i] == '4') {
          newNumberStr = newNumberStr + "৪";
        }else if (numberStr[i] == '5') {
          newNumberStr = newNumberStr + "৫";
        }else if (numberStr[i] == '6') {
          newNumberStr = newNumberStr + "৬";
        }else if (numberStr[i] == '7') {
          newNumberStr = newNumberStr + "৭";
        }else if (numberStr[i] == '8') {
          newNumberStr = newNumberStr + "৮";
        }else if (numberStr[i] == '9') {
          newNumberStr = newNumberStr + "৯";
        }else if (numberStr[i] == '-') {
          newNumberStr = newNumberStr + "-";
        }
      }
    }
    return newNumberStr;
  }
}
