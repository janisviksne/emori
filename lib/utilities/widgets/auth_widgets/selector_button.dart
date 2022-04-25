import 'package:flutter/material.dart';

import '../../constants/text_constants/auth_constants.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => kActiveYellow)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            SizedBox(width: 8),
            Text(
              'Izvēlies',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: kActiveGreen),
            ),
          ],
        ),
        onPressed: onClicked,
      );
}
