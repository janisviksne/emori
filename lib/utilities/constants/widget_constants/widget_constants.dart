import 'package:emori/utilities/constants/text_constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Row kBackArrowYellow(BuildContext context) => Row(children: [
      IconButton(
          iconSize: 50.0,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset('assets/images/common/back_arrow_yellow.svg'))
    ]);

Row kBackArrowGreen(BuildContext context) => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          iconSize: 50.0,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset('assets/images/common/back_arrow_green.svg'),
        ),
      ],
    );

Row kYellowExitCross(BuildContext context) => Row(children: [
      IconButton(
          iconSize: 50.0,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset('assets/images/common/yellow_exit_cross.svg'))
    ]);

Row kTaskDescriptionListItem(String listItem) => Row(
      children: [
        Image.asset('assets/images/common/bullet_point.png'),
        kTextBoldReadex(listItem, kActiveGreen, 16, false)
      ],
    );
