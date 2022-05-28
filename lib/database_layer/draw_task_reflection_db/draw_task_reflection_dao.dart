import 'package:floor/floor.dart';

import 'draw_task_reflection_model.dart';

@dao
abstract class DrawTaskReflectionDao {
  @insert
  Future<void> insertDrawTaskReflectionAnswer(
      DrawTaskReflection drawTaskReflection);
}
