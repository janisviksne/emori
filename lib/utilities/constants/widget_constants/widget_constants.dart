import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../text_constants/auth_constants.dart';

Row kBackArrow(String logMessage, BuildContext context) => Row(children: [
      IconButton(
          iconSize: 50.0,
          onPressed: () {
            Navigator.pop(context);
            log('Returning to gender selection screen');
          },
          icon: const Icon(Icons.arrow_back),
          color: kActiveYellow)
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
