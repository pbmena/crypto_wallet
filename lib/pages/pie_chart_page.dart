import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../utils/utils.dart';
import '../../../widgets/widgets.dart';

class PieChartScreen extends StatefulWidget {
  @override
  _PieChartScreenState createState() => _PieChartScreenState();
}

class _PieChartScreenState extends State<PieChartScreen> {
  int touchedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Container(
                width: _size.width - 10,
                decoration: BoxDecoration(
                  color: baseColor,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                padding: EdgeInsets.all(20),
                child: Card(
                  elevation: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: _size.height / 3.0,
                        width: _size.width,
                        child: PieChart(
                          PieChartData(
                            pieTouchData: PieTouchData(
                              touchCallback: (flTouchEvent, pieTouchResponse) {
                                setState(() {
                                  if ((pieTouchResponse!.touchedSection
                                          is FlLongPressEnd) ||
                                      (pieTouchResponse.touchedSection
                                          is FlPanEndEvent)) {
                                    touchedIndex = -1;
                                  } else {
                                    touchedIndex = pieTouchResponse
                                        .touchedSection!.touchedSectionIndex;
                                  }
                                });
                              },
                            ),
                            borderData: FlBorderData(show: false),
                            sectionsSpace: 5,
                            centerSpaceRadius: 48,
                            sections: getSections(touchedIndex),
                            startDegreeOffset: 25,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 30, horizontal: 0),
                            child: IndicatorsWidget(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () {},
                child: _cardTotalWallet(
                  context,
                  total: '\$64.456,87',
                  totalCrypto: '1,294385 (BTC)',
                  percent: 4.37,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardTotalWallet(
    BuildContext context, {
    String? total,
    totalCrypto,
    double? percent,
  }) {
    final _size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Container(
        width: _size.width - 10,
        decoration: BOXDECORATION,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipOval(
                  child: Material(
                    color: primaryColor,
                    child: SizedBox(
                      width: 56,
                      height: 56,
                      child: Icon(
                        Icons.account_balance_wallet,
                        color: baseColor,
                        size: 25,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Total Wallet",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                Row(
                  children: [
                    Text('(USD)'),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ],
            ),
            SizedBox(height: 25),
            Text(
              '$total',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
                color: tWalletColor,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '$totalCrypto',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: primaryColor,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: percent! >= 0 ? buyColor : sellColor,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Text(
                    percent >= 0 ? '+$percent %' : '$percent %',
                    style: TextStyle(
                      fontSize: 16,
                      color: baseColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
