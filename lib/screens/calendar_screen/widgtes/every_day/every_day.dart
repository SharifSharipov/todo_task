import 'package:flutter/material.dart';
class EveryDay extends StatelessWidget {
  const EveryDay({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.symmetric(horizontal: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Sun",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xff969696),
              height: 18 / 12,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            "Mon",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xff969696),
              height: 18 / 12,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            "Tue",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xff969696),
              height: 18 / 12,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            "Wed",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xff969696),
              height: 18 / 12,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            "Thu",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xff969696),
              height: 18 / 12,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            "Fri",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xff969696),
              height: 18 / 12,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            "Sat",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xff969696),
              height: 18 / 12,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}