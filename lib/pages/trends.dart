import 'package:flutter/material.dart';

import '../components/shimmer_trends_currency.dart';
import '../themes/themes.dart';

class TrendsPage extends StatefulWidget {
  @override
  _TrendsPageState createState() => _TrendsPageState();
}

class _TrendsPageState extends State<TrendsPage> {

  List<Widget> listItem = [
    ShimmerTrendsCurrency(),
    ShimmerTrendsCurrency(),
    ShimmerTrendsCurrency()
  ];

  Future loadRealSampleListExchanger() async {}

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(accentColor: ThemeApp.primaryColor),
      child: RefreshIndicator(
        onRefresh: () async {
          return await loadRealSampleListExchanger();
        },
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: listItem.map((e) => e).toList(),
        ),
      ),
    );
  }
}
