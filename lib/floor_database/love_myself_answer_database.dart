import 'dart:async';

import 'package:emori/floor_database/dao/love_myself_answer_dao.dart';
import 'package:emori/floor_database/model/love_myself_entity.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'love_myself_answer_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [LoveMyselfAnswer])
abstract class AppDatabase extends FloorDatabase {
  LoveMyselfAnswerDao get loveMyselfAnswerDao;
}
