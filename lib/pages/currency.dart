import 'package:flutter/material.dart';

import '../components/shimmer_exchanger_card.dart';

class CurrencyPage extends StatefulWidget {
  @override
  _CurrencyPageState createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ExchangerShimer(),
        ExchangerShimer(),
        ExchangerShimer(),
      ],
    );
  }
}
