import 'package:flutter/material.dart';
import 'package:google_ads_example/ad_state.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class InterstitialAdWidget extends StatefulWidget {
  final Widget child;

  const InterstitialAdWidget({Key? key, required this.child}) : super(key: key);

  @override
  _InterstitialAdWidgetState createState() => _InterstitialAdWidgetState();
}

class _InterstitialAdWidgetState extends State<InterstitialAdWidget> {
  InterstitialAd? interstitialAd;

  @override
  void didChangeDependencies() {
    final adState = Provider.of<AdState>(context);
    adState.initStatus.then((status) {
      InterstitialAd.load(
        adUnitId: adState.interstitialAdId,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) => {
            setState(() {
              interstitialAd = ad;
              interstitialAd!.fullScreenContentCallback =
                  adState.interstitialAdLoadCallback;
            })
          },
          onAdFailedToLoad: (error) => print('InterstitialAd Failed: $error'),
        ),
      );
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return interstitialAd == null
        ? widget.child
        : GestureDetector(
            onTap: () {
              interstitialAd!.show();
            },
            child: widget.child,
          );
  }
}
