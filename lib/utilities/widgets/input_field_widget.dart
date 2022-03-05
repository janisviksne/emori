import 'package:emori/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  InputFieldWidget(
      {Key? key,
      required this.inputValue,
      required this.fieldName,
      required this.isObscureText})
      : super(key: key);
  String inputValue;
  String fieldName;
  bool isObscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscureText,
      controller: TextEditingController(text: inputValue),
      onChanged: (val) {
        inputValue = val;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return '$fieldName lauks ir tukšs!';
        }
        return null;
      },
      style: const TextStyle(fontSize: 20, color: kActiveGreen),
      decoration: const InputDecoration(
          errorStyle: TextStyle(fontSize: 20, color: Colors.red),
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    );
  }
}
