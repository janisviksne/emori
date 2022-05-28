import 'package:floor/floor.dart';

@entity
class LoveMyselfReflection {
  @PrimaryKey(autoGenerate: true)
  final int? reflectionAnswerId;

  late String answerTitle1;
  late String answerDateTime;

  LoveMyselfReflection(
      {this.reflectionAnswerId,
      required this.answerTitle1,
      required this.answerDateTime});
}
