import 'package:flutter/material.dart';
import 'package:google_ads_example/interstitial_ad.dart';
import 'dart:math' as math;

import 'banner_ad.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _items = List.generate(40, (index) {
      if (index % 5 == 0) {
        return BannerAdWidget();
      }
      return Container(
        width: double.infinity,
        height: 50,
        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(1.0),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Ads Demo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) =>
                  InterstitialAdWidget(child: _items[index]),
            ),
          ),
          BannerAdWidget(),
        ],
      ),
    );
  }
}
