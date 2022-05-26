import 'package:emori/database_layer/love_myself_db/model/love_myself_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class LoveMyselfAnswerDao {
  @Query('SELECT * FROM LoveMyselfAnswer')
  Stream<List<LoveMyselfAnswer>> getAllLoveMyselfTaskSubmissions();

  @insert
  Future<void> insertLoveMyselfAnswer(LoveMyselfAnswer loveMyselfAnswer);
}