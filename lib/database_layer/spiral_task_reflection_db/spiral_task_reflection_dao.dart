import 'package:emori/database_layer/spiral_task_reflection_db/spiral_task_reflection_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class SpiralTaskReflectionDao {
  @insert
  Future<void> insertDrawTaskReflectionAnswer(
      SpiralTaskReflection drawTaskReflection);
}
