import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/exchanger.dart';
import '../provider/is_buy.dart';

class ExchangerCard extends StatefulWidget {
  final String exchangerStr;
  final double buy;
  final double sell;

  ExchangerCard(
      {@required this.exchangerStr, @required this.buy, @required this.sell});

  @override
  _ExchangerCardState createState() => _ExchangerCardState();
}

class _ExchangerCardState extends State<ExchangerCard> {
  Widget iconExchanger() {
    return Container(
      width: 60,
      height: 60,
      child: Image.asset(Exchanger.getPngfromSortName(widget.exchangerStr)),
    );
  }

  Widget buySellText(BuyProvider buyProvider) {
    return Text(
      (buyProvider.isBuy ? widget.buy : widget.sell).toString(),
      style: TextStyle(fontFamily: "Lato", fontSize: 16),
    );
  }

  Widget textName() {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 117.5, maxHeight: 70),
      child: Text(
        Exchanger.getFullNamefromSortName(widget.exchangerStr),
        style: TextStyle(fontFamily: "Raleway", fontSize: 14),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isBuy = Provider.of<BuyProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      margin: EdgeInsets.only(top: 17.5),
      child: Column(
        children: [
          FlatButton(
            padding: EdgeInsets.only(),
            child: Row(
              children: [
                SizedBox(width: 17.5),
                iconExchanger(),
                SizedBox(width: 20),
                textName(),
                SizedBox(
                  width: 15,
                ),
                buySellText(isBuy),
                SizedBox(width: 22.5),
                Text(
                  "+0.005",
                  style: TextStyle(
                      fontFamily: "Lato", fontSize: 11.5, color: Colors.green),
                ),
                SizedBox(height: 10)
              ],
            ),
            onPressed: () {},
          ),
          Divider(indent: 20, endIndent: 20)
        ],
      ),
    );
  }
}
