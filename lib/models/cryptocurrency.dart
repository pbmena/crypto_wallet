import 'package:crypto_wallet/utils/constants.dart';

class CryptoList {
  String iconLogo;
  String cryptoCurrency;
  String cryptoQuantity;
  String cryptoBalance;
  double percent;

  CryptoList({
    required this.iconLogo,
    required this.cryptoCurrency,
    required this.cryptoQuantity,
    required this.cryptoBalance,
    required this.percent,
  });
}

final cryptoList = [
  CryptoList(
    iconLogo: iconCryptoPath[0],
    cryptoCurrency: 'BTC',
    cryptoQuantity: '1.24415',
    cryptoBalance: '\$ 51.423',
    percent: 5.17,
  ),
  CryptoList(
    iconLogo: iconCryptoPath[1],
    cryptoCurrency: 'ETH',
    cryptoQuantity: '2.15741',
    cryptoBalance: '\$ 638',
    percent: 1.43,
  ),
  CryptoList(
    iconLogo: iconCryptoPath[2],
    cryptoCurrency: 'ADA',
    cryptoQuantity: '10.15741',
    cryptoBalance: '\$ 35.672',
    percent: 1.43,
  ),
  CryptoList(
    iconLogo: iconCryptoPath[3],
    cryptoCurrency: 'XRP',
    cryptoQuantity: '261.73645',
    cryptoBalance: '\$ 0.45',
    percent: -2.78,
  ),
  CryptoList(
    iconLogo: iconCryptoPath[4],
    cryptoCurrency: 'DOT',
    cryptoQuantity: '3.14362',
    cryptoBalance: '\$ 143.282',
    percent: 5.03,
  ),
  CryptoList(
    iconLogo: iconCryptoPath[5],
    cryptoCurrency: 'BCH',
    cryptoQuantity: '1.72839',
    cryptoBalance: '\$ 1.423.282',
    percent: 6.36,
  ),
  CryptoList(
    iconLogo: iconCryptoPath[6],
    cryptoCurrency: 'UNI',
    cryptoQuantity: '15.13661',
    cryptoBalance: '\$ 34.148',
    percent: 2.41,
  ),
  CryptoList(
    iconLogo: iconCryptoPath[7],
    cryptoCurrency: 'LTC',
    cryptoQuantity: '16.14362',
    cryptoBalance: '\$ 243.282',
    percent: 31.73,
  ),
  CryptoList(
    iconLogo: iconCryptoPath[8],
    cryptoCurrency: 'XMR',
    cryptoQuantity: '2.83952',
    cryptoBalance: '\$ 10.519',
    percent: -2.18,
  ),
  CryptoList(
    iconLogo: iconCryptoPath[9],
    cryptoCurrency: 'LINK',
    cryptoQuantity: '8.82745',
    cryptoBalance: '\$ 16.729',
    percent: 15.03,
  ),
];
