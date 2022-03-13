import 'package:flutter/material.dart';

const kActiveGreen = Color.fromRGBO(45, 87, 61, 1.0);
const kBackgroundColor = Color.fromRGBO(248, 241, 214, 1.0);

Text kInputTextHeading(String text, Color color) => Text(text,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: color,
    ));
Container kInputFormLine() => Container(
      height: 2,
      color: kActiveGreen,
    );
SizedBox kSizedBox(double size) => SizedBox(height: size);

const kInputFieldUnderline = TextStyle(
    fontSize: 20, color: kActiveGreen, decoration: TextDecoration.underline);

/*
* User input field constants
*/
