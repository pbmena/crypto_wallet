import 'package:flutter/material.dart';
import '../../utils/utils.dart';

Widget appBar({
  Widget? left,
  String? title,
  Widget? right,
}) {
  return Container(
    color: baseColor,
    child: Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 50, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu_rounded,
            color: primaryColor,
          ),
          Text(
            '$title',
            style: TextStyle(
                color: primaryColor, fontSize: 20, fontWeight: FontWeight.w700),
          ),
          Icon(
            Icons.circle_notifications,
            size: 35,
            color: primaryColor,
          ),
        ],
      ),
    ),
  );
}
