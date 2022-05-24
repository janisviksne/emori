import 'package:emori/floor_database/model/love_myself_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class LoveMyselfAnswerDao {
  @Query('SELECT * FROM LoveMyselfAnswer')
  Stream<List<LoveMyselfAnswer>> getAllLoveMyselfTaskSubmissions();

  @insert
  Future<void> insertLoveMyselfAnswer(LoveMyselfAnswer loveMyselfAnswer);
}
