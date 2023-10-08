import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_task/blocs/task_bloc/task_bloc.dart';
import 'package:todo_task/config/routes/route_location.dart';
import 'package:todo_task/screens/details_screen/detail_screen.dart';
import 'package:todo_task/utils/app_icons/app_icons.dart';
import 'package:todo_task/utils/colors/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/utils/screen_size_controller/screen_size_controller.dart';

import 'widgtes/calendar/calendar_widget.dart';
import 'widgtes/reminder_of_the_task/reminder_of_the_task.dart';
import 'widgtes/schedule_iteam/sechudel_iteam.dart';
class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  String day = DateTime.now().weekday == 0
      ? "Monday"
      : DateTime.now().weekday == 1
      ? "Tuesday"
      : DateTime.now().weekday == 2
      ? "Wednesday"
      : DateTime.now().weekday == 3
      ? "Tuesday"
      : DateTime.now().weekday == 4
      ? "Friday"
      : DateTime.now().weekday == 5
      ? "Saturday"
      : "Sunday";
  bool isVisible = true;

  @override
  void initState() {
    _getTasks();
    super.initState();
  }
  _getTasks() {
    context.read<TaskBloc>().add(GetTask());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: 72,
        title: Column(
          children: [
            Text(
              day,
              style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.c_292929,
                height: 21 / 14,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateTime.now().toString().substring(0,16),
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: AppColors.c_292929,
                      height: 15 / 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  4.pw,
                  GestureDetector(
                    onTap: () {
                      isVisible = !isVisible;
                      setState(() {});
                    },
                    child: isVisible
                        ? const Icon(Icons.keyboard_arrow_up)
                        : const Icon(Icons.keyboard_arrow_down),
                  )
                ],
              ),
            )
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset(AppIcons.notification))
        ],
      ),
      body:BlocBuilder<TaskBloc, TaskState>(builder: (BuildContext context, TaskState state) {
        return ListView(children: [
          36.ph,
          Visibility(
            visible: isVisible,
            child: TaskCalendardata(
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime(2950),
                onDateChanged: (v) {
                  setState(() {
                    switch (v.weekday) {
                      case 0:
                        {
                          day = "Monday";
                        }
                        break;

                      case 1:
                        {
                          day = "Tuesday";
                        }
                        break;
                      case 2:
                        {
                          day = "Wednesday";
                        }
                        break;

                      case 3:
                        {
                          day = "Thursday";
                        }
                        break;
                      case 4:
                        {
                          day = "Friday";
                        }
                        break;
                      case 5:
                        {
                          day = "Saturday";
                        }
                        break;
                      case 6:
                        {
                          day = "Sunday";
                        }
                        break;

                      default:
                        {
                          //statements;
                        }
                        break;
                    }
                  });
                }),
          ),
          ScheduleItem(
            onTap: () {
              Navigator.pushNamed(context, RouteLocation.todoAdd);
            },
          ),
          18.ph,
          ...List.generate(
            state.tasks.length,
                (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailScreen(taskModel: state.tasks[index]),
                    ),
                  );
                },
                child:  ReminderOfTheTask(
                  textColor: state.tasks[index].priorityColor == "Blue"
                      ? AppColors.c_056ea2
                      : state.tasks[index].priorityColor == "Orange"
                      ? AppColors.c_b86e00
                      : AppColors.c_c02200,
                  subColor: state.tasks[index].priorityColor == "Blue"
                      ? AppColors.c_C6E6F6
                      : state.tasks[index].priorityColor == "Orange"
                      ? AppColors.c_F6E3C6
                      : AppColors.c_F6CFC6,
                  color: state.tasks[index].priorityColor == "Blue"
                      ? AppColors.c_009FEE
                      : state.tasks[index].priorityColor == "Orange"
                      ? AppColors.c_EE8F00
                      : AppColors.c_EE2B00,
                  title: state.tasks[index].eventName,
                  subTitle: state.tasks[index].eventDescription,
                  time: state.tasks[index].eventTime,
                  location: state.tasks[index].eventLocation,
                ),
              ),
            ),
          )
        ],
        );
      },)
    );
  }
}
