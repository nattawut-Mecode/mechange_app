import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import '../themes/themes.dart';
import '../components/shimmer_exchanger_card.dart';
import '../components/exchanger_cart.dart';

class CurrencyPage extends StatefulWidget {
  @override
  _CurrencyPageState createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  List<Widget> listItem = [
    ExchangerShimer(),
    ExchangerShimer(),
    ExchangerShimer()
  ];

  Future loadRealSampleListExchanger() async {
    setState(() {
      listItem.clear();
      listItem.add(ExchangerCard());
    });
  }

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
