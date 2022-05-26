import 'package:emori/screens/main_menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //ToDo go through all dependencies to make sure im not hoarding them
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: MainMenuScreen(),
      ),
      designSize: const Size(360, 780),
    );
  }
}
