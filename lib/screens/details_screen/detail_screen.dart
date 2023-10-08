import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_task/blocs/task_bloc/task_bloc.dart';
import 'package:todo_task/config/routes/route_location.dart';
import 'package:todo_task/data/model/model.dart';
import 'package:todo_task/utils/app_icons/app_icons.dart';
import 'package:todo_task/utils/colors/app_colors.dart';
import 'package:todo_task/utils/screen_size_controller/screen_size_controller.dart';

import 'widget/custom_appbar/custom_appbar.dart';
import 'widget/description_iteam/description_iteam.dart';


class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.taskModel});

  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: taskModel.priorityColor == "Blue"
              ? AppColors.c_009FEE
              : taskModel.priorityColor== "Orange"
              ? AppColors.c_EE8F00
              : AppColors.c_EE2B00,
        ),
      ),
      body: Stack(
        children: [
          const DescriptionItem(),
          CustomAppBar(eventModel: taskModel),
          Positioned(
            bottom: 28,
            right: 28,
            left: 28,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Colors.transparent)),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.c_FEE8E9,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    showAdaptiveDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog.adaptive(
                            title: const Text(
                              "Warning",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                                height: 24 / 16,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            content: const Text(
                              "Do you really delete it?",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff7c7b7b),
                                height: 24 / 16,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () async {

                                  context.read<TaskBloc>().add(
                                    DeleteTask(taskId: taskModel.id!),
                                  );
                                  Navigator.pushReplacementNamed(
                                      context, RouteLocation.calendar);
                                },
                                child: const Text(
                                  "YES",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff7c7b7b),
                                    height: 24 / 16,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "NO",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff7c7b7b),
                                    height: 24 / 16,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          );
                        });
                  },
                  child: Center(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppIcons.delete,
                              colorFilter: const ColorFilter.mode(
                                  AppColors.c_c02200, BlendMode.srcIn),
                            ),
                            2.pw,
                            const Text(
                              "Delete Event",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.c_292929,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}