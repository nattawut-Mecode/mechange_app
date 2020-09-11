import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTrendsCurrency extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 22.5,right: 22.5,top: 12.5),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[100],
          highlightColor: Colors.grey[300],
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