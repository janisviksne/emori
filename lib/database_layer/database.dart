import 'dart:async';

import 'package:emori/database_layer/draw_task_reflection_db/draw_task_reflection_dao.dart';
import 'package:emori/database_layer/love_myself_db/love_myself_answer_dao.dart';
import 'package:emori/database_layer/love_myself_db/love_myself_answer_model.dart';
import 'package:emori/database_layer/love_myself_reflection_db/love_myself_reflection_dao.dart';
import 'package:emori/database_layer/spiral_task_reflection_db/spiral_task_reflection_dao.dart';
import 'package:emori/database_layer/spiral_task_reflection_db/spiral_task_reflection_model.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'draw_task_reflection_db/draw_task_reflection_model.dart';
import 'love_myself_db/love_myself_answer_dao.dart';
import 'love_myself_reflection_db/love_myself_reflection_model.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 3, entities: [
  LoveMyselfAnswer,
  DrawTaskReflection,
  LoveMyselfReflection,
  SpiralTaskReflection
])
abstract class ReflectionAnswerDatabase extends FloorDatabase {
  LoveMyselfAnswerDao get loveMyselfAnswerDao;
  DrawTaskReflectionDao get drawTaskReflectionDao;
  LoveMyselfReflectionDao get loveMyselfReflectionDao;
  SpiralTaskReflectionDao get spiralTaskReflectionDao;
}
