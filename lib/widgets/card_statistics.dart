import 'package:flutter/material.dart';
import '../../utils/utils.dart';

Widget cardStatistics({
  double width = double.infinity,
  double padding = 20,
  Widget? child,
}) {
  return Container(
    width: width,
    padding: EdgeInsets.all(padding),
    decoration: BOXDECORATION,
    child: child,
  );
}
