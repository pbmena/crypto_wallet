import 'package:flutter/material.dart';

class ChartData {
  static List<Data> data = [
    Data(name: 'BCH', percent: 20, color: Colors.green.shade400),
    Data(name: 'BTC', percent: 35, color: Colors.orange.shade600),
    Data(name: 'UNI', percent: 15, color: Colors.pink.shade400),
    Data(name: 'ETH', percent: 20, color: Colors.grey.shade800),
    Data(name: 'ADA', percent: 10, color: Colors.blue.shade900),
  ];
}

class Data {
  final String name;
  final double percent;
  final Color color;

  Data({
    required this.name,
    required this.percent,
    required this.color,
  });
}
