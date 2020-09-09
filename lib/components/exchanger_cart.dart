import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExchangerCard extends StatefulWidget {
  @override
  _ExchangerCardState createState() => _ExchangerCardState();
}

class _ExchangerCardState extends State<ExchangerCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            margin: EdgeInsets.only(top: 17.5),
            child: Row(
              children: [
                SizedBox(width: 17.5),
                Container(
                  width: 60,
                  height: 60,
                  child: Image.asset("assets/exchangers/ven_bbl.png"),
                ),
                SizedBox(width: 20),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 117.5, maxHeight: 70),
                  child: Text("asdasdasdasdasdasdasdasd",style: TextStyle(fontFamily: "Raleway",fontSize: 14),),
                ),
                SizedBox(width: 15,),
                Text("0.2560",style: TextStyle(fontFamily: "Lato",fontSize: 16),),
                SizedBox(width: 22.5),
                Text("+0.005",style: TextStyle(fontFamily: "Lato",fontSize: 11.5,color: Colors.green),),
              ],
            ),
          );
  }
}
