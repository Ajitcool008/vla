import 'package:flutter/material.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData(
    primaryColor: MyColors.primaryColor1,
    backgroundColor: MyColors.primaryColor1,
    // fontFamily:
  );
}

class MyColors {
  static const Color primaryColor1 = Color(0xffffd346);
}

TextStyle feesStyle = TextStyle(fontSize: 14,color: Colors.black54, fontWeight: FontWeight.w700);
