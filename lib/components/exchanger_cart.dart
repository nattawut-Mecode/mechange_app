import 'package:flutter/material.dart';
import 'package:mechange_app/models/exchanger.dart';
import 'package:mechange_app/provider/is_buy.dart';
import 'package:provider/provider.dart';

import '../components/exchanger_cart.dart';

class ExchangerCard extends StatefulWidget {

  final String exchangerStr;
  final double buy;
  final double sell;

  ExchangerCard({@required this.exchangerStr,@required this.buy,@required this.sell});

  @override
  _ExchangerCardState createState() => _ExchangerCardState();
}

class _ExchangerCardState extends State<ExchangerCard> {
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
                Container(
                  width: 60,
                  height: 60,
                  child: Image.asset(Exchanger.getPngfromSortName(widget.exchangerStr)),
                ),
                SizedBox(width: 20),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 117.5, maxHeight: 70),
                  child: Text(
                    Exchanger.getFullNamefromSortName(widget.exchangerStr),
                    style: TextStyle(fontFamily: "Raleway", fontSize: 14),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  (isBuy.isBuy? widget.buy:widget.sell).toString(),
                  style: TextStyle(fontFamily: "Lato", fontSize: 16),
                ),
                SizedBox(width: 22.5),
                Text(
                  "+0.005",
                  style: TextStyle(
                      fontFamily: "Lato", fontSize: 11.5, color: Colors.green),
                ),
                SizedBox(height: 10)
              ],
            ),
            onPressed: (){

            },
          ),
          Divider (indent: 20,endIndent: 20)
        ],
      ),
    );
  }
}
