/*


import 'package:todo_task/data/local_data_base/local_data_base.dart';
import 'package:todo_task/data/model/model.dart';

import 'taskrepository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final LocalDatabase _datasource;
  TaskRepositoryImpl(this._datasource);
  @override
  Future<void> addTask(TaskModel task) async {
    try {
      await _datasource.addTask(task);
    } catch (e) {
      throw '$e';
    }
  }
  @override
  Future<void> deleteTask(TaskModel task) async {
    try {
      await _datasource.deleteTask(task);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<List<TaskModel>> getAllTasks() async {
    try {
      return await _datasource.getAllTasks();
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> updateTask(TaskModel task) async {
    try {
      await _datasource.updateTask(task);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> insertTask(TaskModel task) {
    throw UnimplementedError();
  }
}
*/
