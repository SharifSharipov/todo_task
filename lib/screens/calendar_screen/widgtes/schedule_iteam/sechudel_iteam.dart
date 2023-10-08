import 'package:flutter/material.dart';
import 'package:todo_task/utils/colors/app_colors.dart';
class ScheduleItem extends StatelessWidget {
  const ScheduleItem({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Schedule",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.c_292929,
              height: 21 / 14,
            ),
            textAlign: TextAlign.left,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.transparent)),
            child: Material(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.c_009FEE,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: onTap,
                child: const Center(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22,vertical: 8),
                      child: Text(
                        "+ Add Event",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                          height: 15/10,
                        ),
                        textAlign: TextAlign.left,
                      )
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