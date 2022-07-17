import 'package:flutter/material.dart';

Color kActiveGreen = const Color.fromRGBO(45, 87, 61, 1.0);
Color kActiveYellow = const Color.fromRGBO(248, 241, 214, 1.0);

TextStyle kTextStyle(Color color) => TextStyle(
      fontSize: 18,
      color: color,
    );

Text kInputTextHeading(String text, Color color, double fontSize) => Text(text,
    style: TextStyle(
      fontFamily: 'Montagu Slab',
      fontSize: fontSize,
      color: color,
    ));
Text kQuestionCounter(String text, Color color) => Text(
      text,
      style: TextStyle(fontSize: 16, color: color, fontFamily: 'Readex Pro'),
    );

Text kQuestionIntro(String questionIntroText) => Text(
      questionIntroText,
      style: TextStyle(
          color: kActiveGreen.withOpacity(0.5),
          fontWeight: FontWeight.bold,
          fontFamily: 'Readex Pro',
          fontSize: 20),
    );

Flexible kQuestionText(String text, Color color, double fontSize) => Flexible(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: color, fontSize: fontSize, fontFamily: 'Montagu Slab'),
        softWrap: true,
        maxLines: 2,
      ),
    );

Text kDescriptionText(String text, Color color, double fontSize) => Text(text,
    style:
        TextStyle(fontSize: fontSize, fontFamily: 'Readex Pro', color: color));

Text kCenteredDescription(String text, Color color, double fontSize) => Text(
    text,
    textAlign: TextAlign.center,
    style:
        TextStyle(fontSize: fontSize, fontFamily: 'Readex Pro', color: color));
Container kInputFormLine(Color color) => Container(
      height: 1,
      color: color,
    );
Text kTextBoldReadex(String text, Color color, double fontSize, bool isBold) =>
    Text(text,
        style: TextStyle(
            fontSize: fontSize,
            fontFamily: 'Readex Pro',
            color: color,
            fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal));

Text kTextBoldMontagu(String text, Color color, double fontSize, bool isBold) =>
    Text(text,
        style: TextStyle(
            fontSize: fontSize,
            fontFamily: 'Montagu Slab',
            color: color,
            fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal));

SizedBox kHeightSizedBox(double size) => SizedBox(height: size);

TextStyle kInputFieldUnderline = TextStyle(
    fontSize: 18,
    color: kActiveGreen,
    decoration: TextDecoration.underline,
    decorationThickness: 1.5,
    fontFamily: 'Readex Pro',
    fontWeight: FontWeight.bold);

/*
* User input field constants
*/

InputDecoration kInputFieldDecoration(String hintText, Color color) =>
    InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
        hintStyle: TextStyle(color: color, fontFamily: 'Readex Pro'),
        hintText: hintText,
        errorStyle: const TextStyle(fontSize: 16, color: Colors.red),
        border: OutlineInputBorder(borderSide: BorderSide(color: color)));
