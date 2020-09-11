import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../provider/theme.dart';

class ShimmerTrendsCurrency extends StatefulWidget {
  @override
  _ShimmerTrendsCurrencyState createState() => _ShimmerTrendsCurrencyState();
}

class _ShimmerTrendsCurrencyState extends State<ShimmerTrendsCurrency> {
  ThemeProvider themeState;

  @override
  Widget build(BuildContext context) {
    themeState = Provider.of<ThemeProvider>(context);
    return Container(
      margin: EdgeInsets.only(left: 22.5, right: 22.5, top: 12.5),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Shimmer.fromColors(
          baseColor: themeState.brightness == Brightness.dark
              ? Colors.grey[800]
              : Colors.grey[300],
          highlightColor: themeState.brightness == Brightness.dark
              ? Colors.grey[700]
              : Colors.white,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 135,
            child: Card(),
          ),
        ),
      ),
    );
  }
}
