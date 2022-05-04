import 'package:emori/screens/questionnaire_screens/questionnaire_intro.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: const QuestionnaireAIntroScreen(),
    );
  }
}
