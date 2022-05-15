import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Row kBackArrowYellow(String logMessage, BuildContext context) => Row(children: [
      IconButton(
          iconSize: 50.0,
          onPressed: () {
            Navigator.pop(context);
            log('Returning to gender selection screen');
          },
          icon: SvgPicture.asset('assets/images/common/back_arrow_yellow.svg'))
    ]);

Container kBackArrowGreen(BuildContext context) => Container(
      child: Row(
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
      ),
    );
