import 'package:flutter/material.dart';
import 'package:google_ads_example/ad_state.dart';
import 'dart:math' as math;

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BannerAd? bannerAd;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initStatus.then((status) => {
          setState(() {
            bannerAd = adState.createBannerAd()..load();
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ads Demo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Container(
                width: double.infinity,
                height: 50,
                color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                    .withOpacity(1.0),
              ),
            ),
          ),
          bannerAd == null
              ? SizedBox(height: 50.0)
              : Container(
                  height: 50.0,
                  child: AdWidget(
                    ad: bannerAd!,
                  ),
                ),
        ],
      ),
    );
  }
}
