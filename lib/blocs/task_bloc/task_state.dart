part of 'task_bloc.dart';

class TaskState extends Equatable {
  final String eventName;
  final String eventDescription;
  final List<TaskModel> tasks;
  final FormStatus status;
  final String statusText;
  final String eventLocation;
  final String eventTime;
  final String eventPriority;

 TaskState({
    required this.status,
    required this.tasks,
    required this.statusText,
    this.eventPriority = "",
    this.eventLocation = "",
    this.eventDescription = "",
    this.eventTime = "",
    this.eventName = "",
  });
  TaskState copyWith({
    String? eventName,
    List<TaskModel>? tasks,
    String? eventDescription,
    FormStatus? status,
    String?statusText,
    String? eventLocation,
    String? eventTime,
    String? eventPriority,
  }) {
    return TaskState(
      eventName: eventName ?? this.eventName,
      tasks:tasks??this.tasks,
      eventDescription: eventDescription ?? this.eventDescription,
      status: status ?? this.status,
      statusText: statusText ?? this.statusText,
      eventLocation: eventLocation ?? this.eventLocation,
      eventTime: eventTime ?? this.eventTime,
      eventPriority: eventPriority ?? this.eventPriority,
    );
  }

  @override
  String toString() {
    return """
      eventName:$eventName,
      eventDescription:$eventDescription,
      status:$status,
      errorText:$statusText
      eventLocation:$eventLocation, 
      eventTime:$eventTime
      eventPriority:$eventPriority
    """;
  }

  @override
  List<Object?> get props => [
        eventName,
        eventDescription,
        status,
        statusText,
        eventLocation,
        eventTime,
        eventPriority,
      ];
}
