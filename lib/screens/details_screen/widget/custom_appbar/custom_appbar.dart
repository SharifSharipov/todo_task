import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_task/data/model/model.dart';
import 'package:todo_task/screens/add_event_screen/add_event_screen.dart';
import 'package:todo_task/utils/app_icons/app_icons.dart';
import 'package:todo_task/utils/colors/app_colors.dart';
import 'package:todo_task/utils/screen_size_controller/screen_size_controller.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.eventModel});

  final TaskModel eventModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 296 / 812 * MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: eventModel.priorityColor == "Blue"
            ? AppColors.c_009FEE
            : eventModel.priorityColor == "Orange"
            ? AppColors.c_EE8F00
            : AppColors.c_EE2B00,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            18.ph,
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskAddScreen(
                      newEventModel: eventModel,
                    ),
                  ),
                );
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(AppIcons.arrowBackLeft),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: Row(
                      children: [
                        SvgPicture.asset(AppIcons.edit),
                        const Text(
                          "Edit",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                            height: 21 / 14,
                          ),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            20.ph,
            Text(
              eventModel.eventName,
              style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
                height: 39 / 26,
              ),
              textAlign: TextAlign.left,
            ),
            Text(
              eventModel.eventDescription,
              style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 8,
                fontWeight: FontWeight.w400,
                color: AppColors.white,
                height: 12 / 8,
              ),
              textAlign: TextAlign.left,
            ),
            10.ph,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  AppIcons.timeIcon,
                  colorFilter:
                  const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                ),
                4.pw,
                Text(
                  eventModel.eventTime,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                    height: 15 / 10,
                  ),
                  textAlign: TextAlign.left,
                )
              ],
            ),
            10.ph,
            Row(
              children: [
                SvgPicture.asset(
                  AppIcons.location,
                  colorFilter:
                  const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                ),
                4.pw,
                Text(
                  eventModel.eventLocation,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                    height: 15 / 10,
                  ),
                  textAlign: TextAlign.left,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}