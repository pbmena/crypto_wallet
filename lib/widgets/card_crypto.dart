import 'package:flutter/material.dart';
import 'package:crypto_wallet/models/models.dart';
import '../../utils/utils.dart';

class CardCrypto extends StatelessWidget {
  const CardCrypto({Key? key, required this.cryptoList}) : super(key: key);
  final CryptoList cryptoList;

  @override
  Widget build(BuildContext context) {
    double padding = 20;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(padding),
      decoration: BOXDECORATION,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            cryptoList.iconLogo,
            width: 50,
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  cryptoList.cryptoCurrency,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                Text(
                  cryptoList.cryptoQuantity,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                cryptoList.cryptoBalance,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                cryptoList.percent >= 0
                    ? '+' + cryptoList.percent.toString() + '%'
                    : cryptoList.percent.toString() + '%',
                style: TextStyle(
                  color: cryptoList.percent >= 0 ? buyColor : sellColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
