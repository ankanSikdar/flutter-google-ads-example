import 'package:flutter/material.dart';
import 'dart:math' as math;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ads Demo'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Container(
          width: double.infinity,
          height: 50,
          color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
              .withOpacity(1.0),
        ),
      ),
    );
  }
}
