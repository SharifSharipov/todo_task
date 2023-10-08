part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class AddTask extends TaskEvent {
  final TaskModel newTask;
  AddTask({required this.newTask});
  @override
  List<Object?> get props => [newTask];
}

class UpdateTask extends TaskEvent {
  final TaskModel updateTask;
  UpdateTask({required this.updateTask});
  @override
  List<Object?> get props => [updateTask];
}

class DeleteTask extends TaskEvent {
  final int taskId;
  DeleteTask({required this.taskId});
  @override
  List<Object?> get props => [taskId];
}

class GetTask extends TaskEvent {
  @override
  List<Object?> get props => [];
}
