import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/country.dart';
import '../models/trends_chart.dart';
import '../themes/themes.dart';
import '../utils/format.dart';

enum TrendCurrencyFilterType { Day1, Week1, Month1, Month3, Year1, Year5 }

class TrendsCurrency extends StatefulWidget {
  final String shortCurrency;
  final double exchnageRate;
  final bool isLike;
  final bool isExpand;

  const TrendsCurrency(
      {Key key,
      this.shortCurrency,
      this.exchnageRate,
      this.isLike,
      this.isExpand});

  @override
  TrendsCurrencyState createState() => TrendsCurrencyState();
}

class TrendsCurrencyState extends State<TrendsCurrency>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  String getTrendName(TrendCurrencyFilterType type) {
    switch (type) {
      case TrendCurrencyFilterType.Day1:
        return "1D";
        break;

      case TrendCurrencyFilterType.Week1:
        return "1W";
        break;

      case TrendCurrencyFilterType.Month1:
        return "1M";
        break;

      case TrendCurrencyFilterType.Month3:
        return "3M";
        break;

      case TrendCurrencyFilterType.Year1:
        return "1Y";
        break;

      case TrendCurrencyFilterType.Year5:
        return "5Y";
        break;

      default:
        return "1D";
    }
  }

  List<TrendsTask> dataSource;

  bool isStop = false;

  bool isLike;
  bool isExpand = false;
  double sizeHeight = 120;
  double oldvalue = 0;
  double randomRate() {
    return new Random().nextDouble();
  }

  int _selectTime = 0;

  Future<Null> refresh() async {
    setState(() {});
    return Null;
  }

  void changeFilterMode(TrendCurrencyFilterType type) {
    setState(() {
      switch (type) {
        case TrendCurrencyFilterType.Day1:
          dataSource = [
            TrendsTask(title: "6 AM", value: randomRate()),
            TrendsTask(title: "12 AM", value: randomRate()),
            TrendsTask(title: "6 PM", value: randomRate()),
            TrendsTask(title: "12 PM", value: randomRate()),
          ];
          break;

        case TrendCurrencyFilterType.Week1:
          dataSource = [
            TrendsTask(title: "1D", value: randomRate()),
            TrendsTask(title: "2D", value: randomRate()),
            TrendsTask(title: "3D", value: randomRate()),
            TrendsTask(title: "4D", value: randomRate()),
            TrendsTask(title: "5D", value: randomRate()),
            TrendsTask(title: "6D", value: randomRate()),
            TrendsTask(title: "7D", value: randomRate()),
          ];
          break;

        case TrendCurrencyFilterType.Month1:
          dataSource = [
            TrendsTask(title: "1D", value: randomRate()),
            TrendsTask(title: "10D", value: randomRate()),
            TrendsTask(title: "15D", value: randomRate()),
            TrendsTask(title: "20D", value: randomRate()),
            TrendsTask(title: "25D", value: randomRate()),
            TrendsTask(title: "30D", value: randomRate()),
          ];
          break;

        case TrendCurrencyFilterType.Month3:
          dataSource = [
            TrendsTask(title: "15D", value: randomRate()),
            TrendsTask(title: "1M", value: randomRate()),
            TrendsTask(title: "1M15D", value: randomRate()),
            TrendsTask(title: "2M", value: randomRate()),
            TrendsTask(title: "2M15D", value: randomRate()),
            TrendsTask(title: "3M", value: randomRate()),
          ];
          break;

        case TrendCurrencyFilterType.Year1:
          dataSource = [
            TrendsTask(title: "1M", value: randomRate()),
            TrendsTask(title: "3M", value: randomRate()),
            TrendsTask(title: "6M", value: randomRate()),
            TrendsTask(title: "9M", value: randomRate()),
            TrendsTask(title: "12M", value: randomRate()),
          ];
          break;

        case TrendCurrencyFilterType.Year5:
          dataSource = [
            TrendsTask(title: "6M", value: randomRate()),
            TrendsTask(title: "1Y", value: randomRate()),
            TrendsTask(title: "1Y6M", value: randomRate()),
            TrendsTask(title: "2Y", value: randomRate()),
            TrendsTask(title: "2Y6M", value: randomRate()),
            TrendsTask(title: "3Y", value: randomRate()),
          ];
          break;
      }
    });
  }

  Widget chartLine() {
    return Container(
      child: SfCartesianChart(
        tooltipBehavior: TooltipBehavior(enable: true),
        primaryXAxis: CategoryAxis(),
        series: <LineSeries<TrendsTask, String>>[
          LineSeries<TrendsTask, String>(
              name: "Exchange Rate",
              enableTooltip: true,
              dataSource: dataSource,
              xValueMapper: (TrendsTask tt, _) => tt.title,
              yValueMapper: (TrendsTask tt, _) => tt.value)
        ],
      ),
    );
  }

  Widget filterButton(TrendCurrencyFilterType type, int index) {
    return Expanded(
      child: FlatButton(
        padding: EdgeInsets.only(),
        onPressed: () {
          setState(() {
            _selectTime = index;
            changeFilterMode(type);
          });
        },
        color: _selectTime == index ? Colors.green[300] : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        disabledColor: Colors.transparent,
        child: Text(
          getTrendName(type),
          style: TextStyle(
              fontFamily: "Lato",
              fontWeight: FontWeight.bold,
              color: _selectTime == index ? Colors.white : Colors.grey,
              fontSize: 12),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    isLike = this.widget.isLike;
    changeFilterMode(TrendCurrencyFilterType.Day1);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpand = !isExpand;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 350),
        width: MediaQuery.of(context).size.width,
        height: isExpand ? 260 : 135,
        margin: const EdgeInsets.only(top: 10),
        child: Card(
          margin: const EdgeInsets.all(0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 60,
                    height: 40,
                    margin: const EdgeInsets.only(left: 18, top: 19),
                    alignment: Alignment.centerLeft,
                    child: SvgPicture.asset(
                      Country.getSVGfromshortCurrency(widget.shortCurrency),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 55,
                    width: isExpand ? 110 : 130,
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(top: 19, left: 20),
                    child: Text(
                      Country.getFullCurrencyfromshortCurrency(
                                      widget.shortCurrency)
                                  .length >=
                              15
                          ? Country.getFullCurrencyfromshortCurrency(
                                      widget.shortCurrency)
                                  .substring(0, 15) +
                              "..."
                          : Country.getFullCurrencyfromshortCurrency(
                              widget.shortCurrency),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  isExpand == false
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              isLike = !isLike;
                            });
                            final snackBar = SnackBar(
                              content: Text("Like is " + isLike.toString()),
                              action: SnackBarAction(
                                  label: "Undo",
                                  onPressed: () {
                                    setState(() {
                                      isLike = !isLike;
                                    });
                                  }),
                            );
                            Scaffold.of(context).showSnackBar(snackBar);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            alignment: Alignment.centerRight,
                            width: 65,
                            height: 65,
                            child: Icon(
                              isLike ? Icons.star : Icons.star_border,
                              color: isLike ? Colors.yellow : Colors.black,
                            ),
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: <Widget>[
                              Container(
                                  margin:
                                      const EdgeInsets.only(left: 30, top: 12),
                                  child: Text(
                                    doubleformat(widget.exchnageRate, 2),
                                    style: TextStyle(
                                        fontFamily: "Lato",
                                        fontSize: 28,
                                        color: ThemeApp.primaryColor,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.right,
                                  )),
                              Container(
                                  margin: const EdgeInsets.only(left: 30),
                                  child: Text(
                                    (widget.exchnageRate >= oldvalue
                                            ? "+"
                                            : "") +
                                        doubleformat(
                                            widget.exchnageRate - oldvalue, 2),
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Lato",
                                        color: widget.exchnageRate >= oldvalue
                                            ? Colors.green
                                            : Colors.red),
                                    textAlign: TextAlign.center,
                                  ))
                            ],
                          ),
                        )
                ],
              ),
              isExpand == false
                  ? Row(
                      children: <Widget>[
                        Container(
                            height: 40,
                            margin: const EdgeInsets.only(left: 20),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  (widget.exchnageRate >= oldvalue ? "+" : "") +
                                      doubleformat(
                                          widget.exchnageRate - oldvalue, 2),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Lato",
                                      color: widget.exchnageRate >= oldvalue
                                          ? Colors.green
                                          : Colors.red),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            )),
                        Container(
                          height: 40,
                          width: 130,
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(left: 28),
                          child: Text(
                            (widget.exchnageRate >= oldvalue ? "+" : "") +
                                doubleformat(widget.exchnageRate, 2),
                            style: TextStyle(
                                color: ThemeApp.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                                fontFamily: "Lato"),
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                    )
                  : Container(),
              AnimatedContainer(
                duration: Duration(milliseconds: 350),
                height: isExpand ? 120 : 0,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 350),
                  opacity: isExpand ? 1 : 0,
                  child: chartLine(),
                ),
                margin: const EdgeInsets.only(
                    top: 15, left: 12.5, right: 12.5, bottom: 5),
              ),
              AnimatedContainer(
                curve: Curves.easeIn,
                duration: Duration(milliseconds: 0),
                height: isExpand ? 40 : 0,
                margin: const EdgeInsets.only(left: 12.5, right: 12.5),
                child: Row(
                  children: <Widget>[
                    filterButton(TrendCurrencyFilterType.Day1, 0),
                    filterButton(TrendCurrencyFilterType.Week1, 1),
                    filterButton(TrendCurrencyFilterType.Month1, 2),
                    filterButton(TrendCurrencyFilterType.Month3, 3),
                    filterButton(TrendCurrencyFilterType.Year1, 4),
                    filterButton(TrendCurrencyFilterType.Year5, 5)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
