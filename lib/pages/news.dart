import 'package:flutter/material.dart';

import '../components/shimmer_trends_currency.dart';

import '../themes/themes.dart';

import '../components/news_card.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<Widget> listItem = [
    ShimmerTrendsCurrency(),
    ShimmerTrendsCurrency(),
    ShimmerTrendsCurrency()
  ];

  Future loadRealSampleListExchanger() async {
    setState(() {
      listItem = [
        NewsCard(
          source: "blognone",
          content:
              "โครงการเงินดิจิทัล Libra ออกเอกสารทางเทคนิคเวอร์ชันปรับปรุงใหม่...",
          dateTime: DateTime.now(),
          urlImage:
              "https://www.blognone.com/sites/default/files/styles/thumbnail/public/topics-images/libra.png?itok=KtxaGNMg",
        ),
        NewsCard(
          source: "blognone",
          content:
              "Binance ตลาดซื้อขายเงินคริปโตรายใหญ่ ประกาศเข้าซื้อกิจการ CoinMarketCap...",
          dateTime: DateTime.now(),
          urlImage:
              "https://www.blognone.com/sites/default/files/styles/thumbnail/public/news-thumbnails/FNue6te7_400x400_1.jpg?itok=1oaqqfzc",
        ),
        NewsCard(
          source: "blognone",
          content:
              "วิกฤติเศรษฐกิจจากโรค COVID-19 ทำให้ตลาดหุ้นทั่วโลกตกอย่างต่อเนื่อง...",
          dateTime: DateTime.now(),
          urlImage:
              "https://www.blognone.com/sites/default/files/styles/thumbnail/public/topics-images/bitcoin.png?itok=I0kCGvlu",
        ),
        NewsCard(
          source: "blognone",
          content:
              "โครงการเงินดิจิทัล Libra ออกเอกสารทางเทคนิคเวอร์ชันปรับปรุงใหม่...",
          dateTime: DateTime.now(),
          urlImage:
              "https://www.blognone.com/sites/default/files/styles/thumbnail/public/topics-images/libra.png?itok=KtxaGNMg",
        ),
        NewsCard(
          source: "blognone",
          content:
              "Binance ตลาดซื้อขายเงินคริปโตรายใหญ่ ประกาศเข้าซื้อกิจการ CoinMarketCap...",
          dateTime: DateTime.now(),
          urlImage:
              "https://www.blognone.com/sites/default/files/styles/thumbnail/public/news-thumbnails/FNue6te7_400x400_1.jpg?itok=1oaqqfzc",
        ),
        NewsCard(
          source: "blognone",
          content:
              "วิกฤติเศรษฐกิจจากโรค COVID-19 ทำให้ตลาดหุ้นทั่วโลกตกอย่างต่อเนื่อง...",
          dateTime: DateTime.now(),
          urlImage:
              "https://www.blognone.com/sites/default/files/styles/thumbnail/public/topics-images/bitcoin.png?itok=I0kCGvlu",
        ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(accentColor: ThemeApp.primaryColor),
      child: RefreshIndicator(
        onRefresh: () async {
          return await loadRealSampleListExchanger();
        },
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: listItem.map((e) => e).toList(),
        ),
      ),
    );
  }
}
