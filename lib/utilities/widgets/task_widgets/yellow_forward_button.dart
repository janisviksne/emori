import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';

Expanded kYellowForwardButton(Widget nextScreen, BuildContext context) =>
    Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              iconSize: 100.0,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => nextScreen));
              },
              icon: SvgPicture.asset(
                  'assets/images/common/forward_button_yellow.svg'),
            ),
          ],
        ),
      ),
    );
