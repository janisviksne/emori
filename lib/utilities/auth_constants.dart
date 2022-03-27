import 'package:flutter/material.dart';

const kActiveGreen = Color.fromRGBO(45, 87, 61, 1.0);
const kActiveYellow = Color.fromRGBO(248, 241, 214, 1.0);
TextStyle kTextStyle(Color color) => TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: color,
    );
Text kInputTextHeading(String text, Color color, double fontSize) => Text(text,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
      color: color,
    ));
Container kInputFormLine(Color color) => Container(
      height: 1,
      color: color,
    );
SizedBox kSizedBox(double size) => SizedBox(height: size);

const kInputFieldUnderline = TextStyle(
    fontSize: 20, color: kActiveGreen, decoration: TextDecoration.underline);

/*
* User input field constants
*/
