import 'package:flutter/material.dart';

import '../themes/themes.dart';
import '../components/shimmer_exchanger_card.dart';

class CurrencyPage extends StatefulWidget {
  @override
  _CurrencyPageState createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        accentColor: ThemeApp.primaryColor
      ),
      child: RefreshIndicator(
        onRefresh: () async {
          return await Future.delayed(Duration(seconds: 3));
        },
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            ExchangerShimer(),
            ExchangerShimer(),
            ExchangerShimer(),
          ],
        ),
      ),
    );
  }
}
