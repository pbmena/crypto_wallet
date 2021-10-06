import 'package:flutter/material.dart';
import 'package:crypto_wallet/models/models.dart';

import '../../../utils/utils.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.pie_chart_sharp, color: primaryColor),
                  Text('Portfolio', style: homeTextStyle),
                ],
              ),
              Row(children: [
                Text(
                  'Price',
                  style: homeTextStyle,
                ),
                Icon(Icons.keyboard_arrow_down, color: primaryColor),
              ]),
              Row(children: [
                Text(
                  '24h %',
                  style: homeTextStyle,
                ),
                Icon(Icons.keyboard_arrow_down, color: primaryColor),
              ])
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: cryptoList.length,
                  itemBuilder: (context, index) {
                    final _cryptoList = cryptoList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: CardCrypto(cryptoList: _cryptoList),
                    );
                  }),
            ),
          ),
        ),
      ],
    );
  }
}
