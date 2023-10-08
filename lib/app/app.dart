import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/blocs/task_bloc/task_bloc.dart';
import 'package:todo_task/main.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
           BlocProvider(create: (context)=>TaskBloc())
        ], child: MyApp(),
        );
  }
}