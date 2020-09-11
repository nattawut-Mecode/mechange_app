import 'package:flutter/material.dart';
import 'package:mechange_app/provider/theme.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerExchangerCard extends StatefulWidget {


  @override
  _ShimmerExchangerCardState createState() => _ShimmerExchangerCardState();
}

class _ShimmerExchangerCardState extends State<ShimmerExchangerCard> {
  ThemeProvider themeState;

  Shimmer shimerIcons() {
    return Shimmer.fromColors(
        child: ClipOval(
          child: Container(
            width: 60,
            height: 60,
            color: Colors.red,
          ),
        ),
        baseColor: themeState.brightness == Brightness.dark?Colors.grey[800]:Colors.grey[300],
        highlightColor: themeState.brightness == Brightness.dark?Colors.grey[700]: Colors.white);
  }

  Shimmer shimerTitle() {
    return Shimmer.fromColors(
        baseColor: themeState.brightness == Brightness.dark?Colors.grey[800]:Colors.grey[300],
        highlightColor: themeState.brightness == Brightness.dark?Colors.grey[700]: Colors.white,
        child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 150, maxHeight: 70),
            child: ListTile(
              title: Container(height: 20, child: Card()),
              subtitle: Container(height: 20, child: Card()),
            )));
  }

  Shimmer shimerExchangeRate() {
    return Shimmer.fromColors(
      baseColor: themeState.brightness == Brightness.dark?Colors.grey[800]:Colors.grey[300],
      highlightColor: themeState.brightness == Brightness.dark?Colors.grey[700]: Colors.white,
      child: Container(
        width: 55,
        height: 20,
        child: Card(),
      ),
    );
  }

  Shimmer shimmerPercentRate() {
    return Shimmer.fromColors(
      baseColor: themeState.brightness == Brightness.dark?Colors.grey[800]:Colors.grey[300],
        highlightColor: themeState.brightness == Brightness.dark?Colors.grey[700]: Colors.white,
      child: Container(
        width: 45,
        height: 20,
        child: Card(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    themeState = Provider.of<ThemeProvider>(context);
    return Container(
        margin: EdgeInsets.only(top: 17.5),
        child: Row(
          children: [
            SizedBox(width: 17.5),
            shimerIcons(),
            SizedBox(width: 5),
            shimerTitle(),
            shimerExchangeRate(),
            SizedBox(width: 17.5),
            shimmerPercentRate()
            /*Text("0.2860",style: TextStyle(fontSize: 16,fontFamily: "Lato"),),
              Text("+0.005",style: TextStyle(fontSize: 12,fontFamily: "Lato"),)*/
          ],
        ));
  }
}
