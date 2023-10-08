import 'package:flutter/material.dart';
import 'package:todo_task/app/app.dart';
import 'package:todo_task/config/routes/app_routes.dart';
import 'package:todo_task/config/routes/route_location.dart';

import 'screens/calendar_screen/calendar_screen.dart';

void main() {
  runApp(const App());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      initialRoute: RouteLocation.calendar,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}

