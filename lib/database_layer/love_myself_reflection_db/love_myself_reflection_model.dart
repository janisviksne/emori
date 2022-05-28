import 'package:floor/floor.dart';

@entity
class LoveMyselfReflection {
  @PrimaryKey(autoGenerate: true)
  final int? reflectionAnswerId;

  late String answerTitle1;
  late String answerTitle2;
  late String answerTitle3;
  late String answerDateTime;

  LoveMyselfReflection(
      {this.reflectionAnswerId,
      required this.answerTitle1,
      required this.answerTitle2,
      required this.answerTitle3,
      required this.answerDateTime});
}
