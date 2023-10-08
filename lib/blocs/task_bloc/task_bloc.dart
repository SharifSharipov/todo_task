import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_task/data/local_data_base/local_data_base.dart';
import 'package:todo_task/data/model/model.dart';
import 'package:todo_task/data/status/status.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc()
      : super(TaskState(
          status: FormStatus.pure,
          tasks: [],
          statusText: "",
          eventName: "",
          eventTime: "",
          eventDescription: "",
          eventLocation: "",
          eventPriority: "",
        )) {
    on<AddTask>(_addTask);
    on<GetTask>(_getTasks);
    on<UpdateTask>(_updateTask);
    on<DeleteTask>(_deleteTask);
  }
  _addTask(AddTask event, Emitter<TaskState> emit) async {
    emit(state.copyWith(
        status: FormStatus.loading, statusText: "Adding Task...!"));
    LocalDatabase.getInstance;
    LocalDatabase.addTask(event.newTask);
    emit(state.copyWith(
        status: FormStatus.success,
        statusText: "Added Task!",
        tasks: [...state.tasks, event.newTask]));
  }

  _getTasks(GetTask event, Emitter<TaskState> emit) async {
    emit(state.copyWith(
        status: FormStatus.loading, statusText: "Getting Tasks!"));
    List<TaskModel> tasks = await LocalDatabase.getAllTasks();

    emit(state.copyWith(
        statusText: "Tasks Fetched!",
        status: FormStatus.success,
        tasks: tasks));
  }

  _updateTask(UpdateTask event, Emitter<TaskState> emit) async {
    emit(state.copyWith(
        status: FormStatus.loading, statusText: "Update Task...!"));
    LocalDatabase.updateTask(task: event.updateTask);
    List<TaskModel> tasks = await LocalDatabase.getAllTasks();
    emit(state.copyWith(
        statusText: "Updated Task!", status: FormStatus.success, tasks: tasks));
  }

  _deleteTask(DeleteTask event, Emitter<TaskState> emit) async {
    emit(
      state.copyWith(
        status: FormStatus.loading,
        statusText: "Deleting Task...",
      ),
    );
    LocalDatabase.deleteTask(id: event.taskId);
    List<TaskModel> tasks = await LocalDatabase.getAllTasks();
    emit(
      state.copyWith(
        status: FormStatus.success,
        statusText: "Task deleted !!!",
        tasks: tasks,
      ),
    );
  }
}
