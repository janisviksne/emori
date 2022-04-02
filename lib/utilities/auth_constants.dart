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

Text kDescriptionText(String text, Color color, double fontSize) =>
    Text(text, style: TextStyle(fontSize: fontSize, color: color));

Container kInputFormLine(Color color) => Container(
      height: 1,
      color: color,
    );

SizedBox kSizedBox(double size) => SizedBox(height: size);

const kInputFieldUnderline = TextStyle(
    fontSize: 18, color: kActiveGreen, decoration: TextDecoration.underline);

/*
* User input field constants
*/

InputDecoration kInputFieldDecoration(String hintText) => InputDecoration(
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: kActiveGreen),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: kActiveGreen),
    ),
    hintStyle:
        const TextStyle(color: kActiveGreen, fontWeight: FontWeight.bold),
    hintText: hintText,
    errorStyle: const TextStyle(fontSize: 20, color: Colors.red),
    border: const OutlineInputBorder(borderSide: BorderSide.none));
