import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ExchangerShimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 17.5),
        child: Row(
          children: [
            SizedBox(width: 17.5),
            Shimmer.fromColors(
                child: ClipOval(
                  child: Container(
                    width: 60,
                    height: 60,
                    color: Colors.red,
                  ),
                ),
                baseColor: Colors.grey[300],
                highlightColor: Colors.white),
                SizedBox(width: 5),
            Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.white,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 150,
                  maxHeight: 70
                ),
                child: ListTile(
                  title: Container(height: 20,child: Card()),
                  subtitle: Container(height: 20,child: Card()),
                ))
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.white,
                child: Container(
                  width: 55,
                  height: 20,
                  child: Card(),
                ),
              ),
              SizedBox(width: 17.5),
              Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.white,
                child: Container(
                  width: 45,
                  height: 20,
                  child: Card(),
                ),
              )
              /*Text("0.2860",style: TextStyle(fontSize: 16,fontFamily: "Lato"),),
              Text("+0.005",style: TextStyle(fontSize: 12,fontFamily: "Lato"),)*/
          ],
        ));
  }
}
