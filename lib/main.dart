import 'package:emori/screens/registration_screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: LoginScreen(),
      ),
      designSize: const Size(360, 780),
    );
  }
}
