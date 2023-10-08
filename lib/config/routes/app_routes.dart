import 'package:flutter/material.dart';
import 'package:todo_task/data/model/model.dart';
import 'package:todo_task/screens/add_event_screen/add_event_screen.dart';
import 'package:todo_task/screens/calendar_screen/calendar_screen.dart';
import 'package:todo_task/screens/details_screen/detail_screen.dart';
import 'route_location.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteLocation.calendar:
        return MaterialPageRoute(
          builder: (context) => const CalendarScreen(),
        );
      case RouteLocation.todoAdd:
        return MaterialPageRoute(
          builder: (context) => const TaskAddScreen(),
        );
      case RouteLocation.detail:
        return MaterialPageRoute(
            builder: (context) => DetailScreen(
                  taskModel: TaskModel(
                      eventDescription: '',
                      eventName: '',
                      eventLocation: '',
                      priorityColor: '',
                      eventTime: ''),
                ));
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route not available!"),
            ),
          ),
        );
    }
  }
}
