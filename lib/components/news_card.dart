import 'package:flutter/material.dart';


class NewsCard extends StatefulWidget {

  final String urlImage;
  final String source;
  final DateTime dateTime;
  final String content;

  NewsCard({Key key,this.urlImage,this.source,this.dateTime,this.content}) : super(key:key);

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard>
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
      width: MediaQuery.of(context).size.width,
      height: 160,
      margin: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
      child: Card(
        color: Colors.grey[100],
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(margin: const EdgeInsets.only(left: 20,top: 12),child: Text("Source : "+widget.source,style: TextStyle(fontSize: 12,fontFamily: "Lato",fontWeight: FontWeight.bold,color: Colors.grey[700]),)),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(width: 200,margin: const EdgeInsets.only(left: 20,top: 12),child: ConstrainedBox(constraints: BoxConstraints(maxWidth: 175),child: Text(widget.content,style: TextStyle(fontSize: 15,fontFamily: "Lato",fontWeight: FontWeight.bold,color: Colors.black),)))
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(width: 100,margin: const EdgeInsets.only(left: 20,top: 30),child: Text(widget.dateTime.day.toString()+"/"+widget.dateTime.month.toString()+"/"+widget.dateTime.year.toString() +"  "+widget.dateTime.hour.toString()+":"+widget.dateTime.minute.toString(),style: TextStyle(fontSize: 10,fontFamily: "Lato",fontWeight: FontWeight.bold,color: Colors.grey),))
                      ],
                    )
                  ]
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                width: 125,
                height: 110,
                child: Card(
                  color: Colors.white,
                  child: Image.network(widget.urlImage,fit: BoxFit.fill,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}