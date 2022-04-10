import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PickerUtils {
  static List<Widget> workStatusModelBuilder<M>(
          List<M> models, Widget Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, Widget>(
              (index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();

  static void showPicker(BuildContext context,
          {required Widget child, required VoidCallback onClicked}) =>
      showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            child,
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text('Izvēlēties'),
            onPressed: onClicked,
          ),
        ),
      );
}
