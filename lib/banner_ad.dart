import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import 'ad_state.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({Key? key}) : super(key: key);

  @override
  _BannerAdWidgetState createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  BannerAd? bannerAd;

  @override
  void didChangeDependencies() {
    final adState = Provider.of<AdState>(context);
    adState.initStatus.then((status) => {
          setState(() {
            bannerAd = adState.createBannerAd()..load();
          })
        });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return bannerAd == null
        ? SizedBox(height: 50.0)
        : Container(
            child: AdWidget(ad: bannerAd!),
            width: bannerAd!.size.width.toDouble(),
            height: 50.0,
            alignment: Alignment.center,
          );
  }
}
