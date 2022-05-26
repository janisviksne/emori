import 'dart:async';

import 'package:emori/database_layer/love_myself_db/love_myself_answer_dao.dart';
import 'package:emori/database_layer/love_myself_db/love_myself_model.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'love_myself_answer_dao.dart';

part '../love_myself_db/love_myself_answer_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [LoveMyselfAnswer])
abstract class LMAnswerDatabase extends FloorDatabase {
  LoveMyselfAnswerDao get loveMyselfAnswerDao;
}
