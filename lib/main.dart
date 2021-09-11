import 'package:flutter/material.dart';
import 'package:google_ads_example/ad_state.dart';
import 'package:google_ads_example/home.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final initStatus = MobileAds.instance.initialize();
  final adState = AdState(initStatus);

  runApp(
    Provider.value(
      value: adState,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Home(),
    );
  }
}
