import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_task/blocs/task_bloc/task_bloc.dart';
import 'package:todo_task/config/routes/route_location.dart';
import 'package:todo_task/data/model/model.dart';
import 'package:todo_task/data/status/status.dart';
import 'package:todo_task/utils/app_icons/app_icons.dart';
import 'package:todo_task/utils/colors/app_colors.dart';
import 'package:todo_task/utils/error_dialog/error_dialog.dart';
import 'package:todo_task/utils/screen_size_controller/screen_size_controller.dart';
import 'widgets/global_text_filds.dart';
class TaskAddScreen extends StatefulWidget {
  const TaskAddScreen({super.key, this.newEventModel});

  final TaskModel? newEventModel;

  @override
  State<TaskAddScreen> createState() => _TaskAddScreenState();
}

class _TaskAddScreenState extends State<TaskAddScreen> {
  String selectedColor = 'Red';
  List<String> colors = ['Red', 'Blue', 'Orange'];
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  TextEditingController taskLocationController = TextEditingController();
  TextEditingController taskTimeController = TextEditingController();

  @override
  void initState() {
    if (widget.newEventModel != null) {
      taskTimeController.text = widget.newEventModel!.eventTime;
      taskDescriptionController.text = widget.newEventModel!.eventDescription;
      taskNameController.text = widget.newEventModel!.eventName;
      taskLocationController.text = widget.newEventModel!.eventLocation;
      selectedColor = widget.newEventModel!.priorityColor;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
      ),
      body: BlocConsumer<TaskBloc, TaskState>(
        listener: (context, state) {
          if (state.status == FormStatus.loading) {
            const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == FormStatus.failure) {
            if (state.status == FormStatus.failure) {
              errorDialog(context, state.statusText);
            }
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 13, right: 19),
                child: ListView(
                  children: [
                    16.ph,
                    const Text(
                      "Event name",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff111827),
                        height: 20 / 14,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    4.ph,
                    GlobalTextField(
                      controller: taskNameController,
                      onChanged: (v) {
                        state.copyWith(eventName: v.toString());
                      },
                      hintText: "Event name",
                    ),
                    16.ph,
                    const Text(
                      "Event description",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff111827),
                        height: 20 / 14,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    GlobalTextField(
                      controller: taskDescriptionController,
                      onChanged: (v) {
                        state.copyWith(eventDescription: v.toString());
                      },
                      hintText: "Event description",
                      maxLines: 5,
                    ),
                    16.ph,
                    const Text(
                      "Event location",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff111827),
                        height: 20 / 14,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    4.ph,
                    GlobalTextField(
                      controller: taskLocationController,
                      onChanged: (v) {
                        state.copyWith(eventLocation: v.toString());
                      },
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 8),
                        child: SvgPicture.asset(AppIcons.location),
                      ),
                      hintText: "Event location",
                    ),
                    16.ph,
                    const Text(
                      "Priority color",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff111827),
                        height: 20 / 14,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    6.ph,
                    DropdownButton<String>(
                      value: selectedColor,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedColor = newValue!;
                        });
                      },
                      items:
                      colors.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Container(
                              height: 20,
                              width: 23,
                              color: value == "Red"
                                  ? AppColors.c_EE2B00
                                  : value == "Blue"
                                  ? AppColors.c_009FEE
                                  : AppColors.c_EE8F00,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    16.ph,
                    const Text(
                      "Event time",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff111827),
                        height: 20 / 14,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    4.ph,
                    GlobalTextField(
                      controller: taskTimeController,
                      onChanged: (v) {
                        state.copyWith(eventTime: v.toString());
                      },
                      hintText: "Event time",
                    ),
                    150.ph,
                  ],
                ),
              ),
              Positioned(
                bottom: 15,
                left: 16,
                right: 16,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.transparent)),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.c_009FEE,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        if (widget.newEventModel == null) {
                          context.read<TaskBloc>().add(
                            AddTask(
                              newTask: TaskModel(
                                eventLocation: taskLocationController.text,
                                eventName: taskNameController.text,
                                priorityColor: selectedColor.toString(),
                                eventDescription: taskDescriptionController.text,
                                eventTime: taskTimeController.text,
                              ),
                            ),
                          );
                        } else {
                          context.read<TaskBloc>().add(
                            UpdateTask(
                              updateTask :TaskModel(
                                eventLocation: taskLocationController.text,
                                eventName: taskNameController.text,
                                priorityColor: selectedColor.toString(),
                                eventDescription:
                                taskDescriptionController.text,
                                eventTime: taskTimeController.text,
                              ),
                            ),
                          );

                        }
                        Navigator.pop(context, RouteLocation.calendar);
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13),
                          child: Text(
                            widget.newEventModel == null ? "Add" : "Update",
                            style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              height: 15 / 10,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
