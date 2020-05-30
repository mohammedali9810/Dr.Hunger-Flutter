import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PieChart extends StatefulWidget {
  @override
  _PieChartState createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AspectRatio(aspectRatio: 1,child: PieChart(

      )),
    );
  }
}
