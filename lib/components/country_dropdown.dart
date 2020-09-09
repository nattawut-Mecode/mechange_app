import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mechange_app/models/country.dart';


class CountryDropDownItem extends StatefulWidget {


  final String shortCurrency;

  const CountryDropDownItem({
    Key key,
    this.shortCurrency
  });

  @override
  _CountryDropDownItemState createState() => _CountryDropDownItemState();
}

class _CountryDropDownItemState extends State<CountryDropDownItem>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: 35,
            height: 35,
            child: SvgPicture.asset(Country.getSVGfromshortCurrency(widget.shortCurrency)),
          ),
          Padding(
            padding: const EdgeInsets.only(left:15),
            child: Text(widget.shortCurrency,style: TextStyle(fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  }
}