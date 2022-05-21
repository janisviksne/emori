import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:flutter/material.dart';

class YellowContainerButton<T> extends StatelessWidget {
  //final int buttonId;
  final String title;

  // ignore: use_key_in_widget_constructors
  const YellowContainerButton({
    //required this.buttonId,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kActiveYellow,
      child: InkWell(
        child: SizedBox(
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _customContainerButton,
            ],
          ),
        ),
      ),
    );
  }

  Widget get _customContainerButton {
    return Container(
      alignment: Alignment.center,
      width: 210,
      height: 55,
      decoration: BoxDecoration(
        color: kActiveYellow,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: kActiveGreen,
          width: 1,
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
            color: kActiveGreen, fontSize: 18, fontFamily: 'Readex Pro'),
      ),
    );
  }
}
