import 'package:emori/database_layer/love_myself_reflection_db/love_myself_reflection_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class LoveMyselfReflectionDao {
  @insert
  Future<void> insertLMReflectionAnswer(
      LoveMyselfReflection loveMyselfReflection);
}
