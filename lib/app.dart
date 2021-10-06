import 'package:crypto_wallet/pages/statistics_page.dart';
import 'package:crypto_wallet/pages/pie_chart_page.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../../../widgets/widgets.dart';
import 'pages/home/home_page.dart';

enum TabItem { home, chart, statistics }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TabItem _current = TabItem.home;

  final List<TabItem> _tabs = [
    TabItem.home,
    TabItem.chart,
    TabItem.statistics,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: SafeArea(
            top: false,
            child: appBar(
              left: Icon(Icons.notes, color: primaryColor),
              title: 'Crypto Wallet',
              right: Icon(Icons.account_balance_wallet, color: primaryColor),
            )),
      ),
      body: _buildNavPage(),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  Widget _bottomNavBar() {
    return BottomNavigationBar(
      items: _tabs
          .map((tabItem) => _bottomNavBarItems(_icon(tabItem), tabItem))
          .toList(),
      onTap: _selectTab,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    );
  }

  BottomNavigationBarItem _bottomNavBarItems(IconData icon, TabItem tabItem) {
    final Color color = _current == tabItem ? colorDark : colorLight;
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
          color: color,
        ),
        label: '');
  }

  void _selectTab(int index) {
    TabItem selectTabItem = _tabs[index];
    setState(() {
      _current = selectTabItem;
    });
  }

  IconData _icon(TabItem item) {
    switch (item) {
      case TabItem.home:
        return Icons.account_balance_wallet;
      case TabItem.chart:
        return Icons.pie_chart_rounded;
      case TabItem.statistics:
        return Icons.insert_chart;

      default:
        throw 'Unknown $item';
    }
  }

  Widget _buildNavPage() {
    switch (_current) {
      case TabItem.home:
        return HomeScreen();
      case TabItem.chart:
        return PieChartScreen();
      case TabItem.statistics:
        return StatisticsPage();

      default:
        return HomeScreen();
    }
  }
}
