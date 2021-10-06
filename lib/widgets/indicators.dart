import 'package:crypto_wallet/models/models.dart';
import 'package:flutter/material.dart';
import '../../utils/utils.dart';

class IndicatorsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: ChartData.data
            .map(
              (data) => Container(
                child: buildIndicator(
                  text: data.name,
                  color: data.color,
                ),
              ),
            )
            .toList(),
      );
  Widget buildIndicator({
    required String text,
    required Color color,
    bool isSquare = false,
    double size = 14,
    Color textColor = COLORINDICATORW,
  }) =>
      Row(
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
              color: color,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
          const SizedBox(width: 8),
        ],
      );
}
