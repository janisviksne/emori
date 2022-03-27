import 'package:flutter/cupertino.dart';

class DatePickerUtils {
  static void showDatePicker(BuildContext context,
          {required Widget child, required VoidCallback onClicked}) =>
      showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
                actions: [
                  child,
                ],
                cancelButton: CupertinoActionSheetAction(
                  child: const Text('Atcelt'),
                  onPressed: onClicked,
                ),
              ));
}
