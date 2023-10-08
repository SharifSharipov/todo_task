import 'package:flutter/material.dart';
import 'package:todo_task/utils/colors/app_colors.dart';
import 'package:todo_task/utils/screen_size_controller/screen_size_controller.dart';

class DescriptionItem extends StatelessWidget {
  const DescriptionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return           ListView(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      children: [
        SizedBox(
          height: 296 / 812 * MediaQuery.of(context).size.height,
        ),
        28.ph,
        const Text(
          "Reminder",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
            height: 24 / 16,
          ),
          textAlign: TextAlign.left,
        ),
        10.ph,
        Text(
          "15 minutes befor",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.c_7c7b7b,
            height: 24 / 16,
          ),
          textAlign: TextAlign.left,
        ),
        22.ph,
        const Text(
          "Description",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
            height: 24 / 16,
          ),
          textAlign: TextAlign.left,
        ),
        10.ph,
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel ex sit amet neque dignissim mattis non eu est. Etiam pulvinar est mi, et porta magna accumsan nec. Ut vitae urna nisl. Integer gravida sollicitudin massa, ut congue orci posuere sit amet. Aenean laoreet egestas est, ut auctor nulla suscipit non. ",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: AppColors.c_999999,
          ),
          textAlign: TextAlign.left,
        )
      ],
    );
  }
}