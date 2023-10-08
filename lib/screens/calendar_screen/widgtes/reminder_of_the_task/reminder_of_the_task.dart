import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_task/utils/app_icons/app_icons.dart';
import 'package:todo_task/utils/screen_size_controller/screen_size_controller.dart';
class ReminderOfTheTask extends StatelessWidget {
  const ReminderOfTheTask(
      {super.key,
        required this.title,
        required this.subTitle,
        required this.time,
        this.location = "",
        required this.color,
        required this.subColor,
        required this.textColor});

  final String title;
  final String subTitle;
  final String time;
  final String location;
  final Color color;
  final Color subColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10), topLeft: Radius.circular(10)),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: subColor),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                    height: 21 / 14,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: textColor,
                    height: 12 / 8,
                  ),
                  textAlign: TextAlign.left,
                ),
                10.ph,
                Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.timeIcon,
                      colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
                    ),
                    4.pw,
                    Text(
                      time,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: textColor,
                        height: 15 / 10,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    10.pw,
                    location.isEmpty
                        ? const Text("")
                        : SvgPicture.asset(
                      AppIcons.location,
                      colorFilter:
                      ColorFilter.mode(textColor, BlendMode.srcIn),
                    ),
                    4.pw,
                    Text(
                      location,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: textColor,
                        height: 15 / 10,
                      ),
                      textAlign: TextAlign.left,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        14.ph,
      ],
    );
  }
}
