import 'dart:developer';

import 'package:flutter/material.dart';

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
