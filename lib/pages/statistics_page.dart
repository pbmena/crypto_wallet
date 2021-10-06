import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../utils/utils.dart';
import '../../../widgets/widgets.dart';

class StatisticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            _cardWallet(
              iconUrl: iconCryptoPath[0],
              crypto: 'Bitcoin',
              cryptoSymbol: 'BTC',
              totalCrypto: '1,294385 (BTC)',
              total: '\$64.456,87 USD',
              percent: -2.33,
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _chipContainer(textChip: '1D'),
                  Text('7D'),
                  Text('1M'),
                  Text('3M'),
                  Text('1Y'),
                  Text('YTD'),
                  Text('ALL'),
                ],
              ),
            ),
            cardStatistics(
              padding: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'BTC to USD Chart',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: primaryColor,
                            letterSpacing: -.6,
                          ),
                        ),
                        Row(
                          children: [
                            _chipContainer(textChip: 'Price'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _size.height / 5,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: LineChart(
                            sampleData(),
                          ),
                        ),
                        Positioned(
                          bottom: 45,
                          right: 20,
                          child: Row(
                            children: [
                              Text(
                                'Crypto Market',
                                style: TextStyle(
                                  color: baseColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  letterSpacing: -.8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: _floatingButton(
                    text: 'BUY',
                    color: buyColor,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: _floatingButton(
                    text: 'SELL',
                    color: sellColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  LineChartData sampleData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          showOnTopOfTheChartBoxArea: true,
          fitInsideVertically: false,
          tooltipRoundedRadius: 20,
        ),
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        topTitles: SideTitles(
          showTitles: false,
        ),
        bottomTitles: SideTitles(
          showTitles: true,
          interval: 4,
          reservedSize: 14,
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          reservedSize: 4,
          margin: 10,
        ),
        rightTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      maxX: 24,
      maxY: 5,
      minY: 1,
      lineBarsData: linesBarData(),
    );
  }

  List<LineChartBarData> linesBarData() {
    return [
      LineChartBarData(
        spots: [
          FlSpot(0, 2),
          FlSpot(6, 2.8),
          FlSpot(8, 2.0),
          FlSpot(10, 2.5),
          FlSpot(14, 3.2),
          FlSpot(16, 2.2),
          FlSpot(18, 2.6),
          FlSpot(24, 5),
        ],
        isCurved: false,
        colors: [
          colorLineChart,
        ],
        barWidth: 6,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: true,
        ),
        belowBarData: BarAreaData(
          show: true,
          applyCutOffY: true,
          cutOffY: 1,
          gradientFrom: const Offset(1, 1),
          gradientTo: const Offset(1, 0),
          colors: [
            colorGradient1,
            colorGradient2,
          ],
        ),
      ),
    ];
  }

  Widget _chipContainer({String? textChip}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: CHIPDECORATION,
      child: Text(
        textChip!,
        style: TextStyle(color: baseColor, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _cardWallet({
    required String crypto,
    cryptoSymbol,
    iconUrl,
    total,
    totalCrypto,
    required double percent,
  }) {
    return cardStatistics(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('$iconUrl', width: 50),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 2),
                    customText(
                      '$crypto',
                      20,
                      tWalletColor,
                      FontWeight.w700,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                      decoration: CHIPDECORATION,
                      child: customText(
                        '$cryptoSymbol',
                        10,
                        baseColor,
                        FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child:
                    Icon(Icons.keyboard_arrow_down, size: 30, color: sellColor),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                    color: percent >= 0 ? buyColor : sellColor,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Text(
                  percent >= 0 ? '+ $percent %' : '$percent %',
                  style: TextStyle(
                    color: baseColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          customText(
            '$totalCrypto',
            25,
            tWalletColor,
            FontWeight.w700,
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customText(
                '$total',
                15,
                primaryColor,
                FontWeight.w700,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _floatingButton({Color? color, required String text}) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(primary: color, elevation: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: customText(
          '$text',
          20,
          baseColor,
          FontWeight.w700,
        ),
      ),
    );
  }

  Widget customText(
    String text,
    double fontSize,
    Color color,
    FontWeight fontWeight,
  ) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
