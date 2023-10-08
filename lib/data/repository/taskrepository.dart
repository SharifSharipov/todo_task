
import 'package:todo_task/data/model/model.dart';

abstract class TaskRepository {
  Future<void> insertTask(TaskModel task);
  Future<void> updateTask(TaskModel task);
  Future<void> deleteTask(TaskModel task);
  Future<List<TaskModel>> getAllTasks();

}
