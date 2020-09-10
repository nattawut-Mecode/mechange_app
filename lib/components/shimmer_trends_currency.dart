import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTrendsCurrency extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}