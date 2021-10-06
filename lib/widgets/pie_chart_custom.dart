import 'package:crypto_wallet/models/models.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../utils/utils.dart';

List<PieChartSectionData> getSections(int touchedIndex) => ChartData.data
    .asMap()
    .map<int, PieChartSectionData>((index, data) {
      final isTouched = index == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 100 : 80;

      final value = PieChartSectionData(
        color: data.color,
        value: data.percent,
        title: '${data.percent}%',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
          color: baseColor,
        ),
      );
      return MapEntry(index, value);
    })
    .values
    .toList();
