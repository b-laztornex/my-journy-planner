import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ChartIndicator extends StatelessWidget {
  final double? percentage;
  const ChartIndicator({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    double percent = percentage! / 1000;
    return CircularPercentIndicator(
      radius: 60.0,
      lineWidth: 5.0,
      percent: percent,
      center: new Text("$percent%"),
      progressColor: Colors.green,
    );
  }
}
