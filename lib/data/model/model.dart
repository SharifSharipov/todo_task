import 'dart:ui';

class TaskModelFields {
  static const String id = "id";
  static const String eventName = "event_name";
  static const String eventDescription = "event_description";
  static const String eventLocation = "event_location";
  static const String priorityColor = "priority_color";
  static const String eventTime = "event_time";
  static const String taskTable = "todo_table";
  static const String values = "values";
}

class TaskModel {
  final int? id;
  final String eventName;
  final String eventDescription;
  final String eventLocation;
  final String priorityColor;
  final String eventTime;
  TaskModel(
      {this.id,
      required this.eventName,
      required this.eventDescription,
      required this.eventLocation,
      required this.priorityColor,
      required this.eventTime});
  TaskModel copyWith({
    int? id,
    String? eventName,
    String? eventDescription,
    String? eventLocation,
    String? priorityColor,
    String? eventTime,
  }) {
    return TaskModel(
        id: id ?? this.id,
        eventName: eventName ?? this.eventName,
        eventDescription: eventDescription ?? this.eventDescription,
        eventLocation: eventLocation ?? this.eventLocation,
        priorityColor: priorityColor ?? this.priorityColor,
        eventTime: eventTime ?? this.eventTime);
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      eventName: json[TaskModelFields.eventName] as String? ?? "",
      eventDescription: json[TaskModelFields.eventDescription] as String? ?? "",
      eventLocation: json[TaskModelFields.eventLocation] as String? ?? "",
      priorityColor: json[TaskModelFields.priorityColor] as String? ?? "",
      eventTime: json[TaskModelFields.eventTime] as String? ?? "",
    );
  }
  Map<String, dynamic> toJson() => {
        TaskModelFields.eventName: eventTime,
        TaskModelFields.eventDescription: eventDescription,
        TaskModelFields.eventLocation: eventLocation,
        TaskModelFields.priorityColor: priorityColor,
        TaskModelFields.eventTime: eventTime,
      };
  @override
  String toString() {
    return """
    ${TaskModelFields.eventName}:$eventTime,
    ${TaskModelFields.eventDescription}:$eventDescription,
    ${TaskModelFields.eventLocation}:$eventLocation,
    ${TaskModelFields.priorityColor}:$priorityColor,
    ${TaskModelFields.eventTime}:$eventName,
    """;
  }
}
