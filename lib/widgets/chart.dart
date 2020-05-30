import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {

  List<PieChartSectionData> _sections = List<PieChartSectionData>();

  @override
  void initState() {
    super.initState();
    PieChartSectionData _item1 = PieChartSectionData(
      color: Colors.red,
      value: 40,
      title: 'protein',
      radius: 45,
      showTitle: true,
      titleStyle: TextStyle(color: Colors.white),
    );
    PieChartSectionData _item2 = PieChartSectionData(
      color: Colors.amber,
      value: 25,
      title: 'carbs',
      radius: 45,
      showTitle: true,
      titleStyle: TextStyle(color: Colors.white),
    );
    PieChartSectionData _item3 = PieChartSectionData(
      color: Colors.purple,
      value: 35,
      title: 'Fat',
      radius: 45,
      showTitle: true,
      titleStyle: TextStyle(color: Colors.white),
    );
    _sections = [_item1,_item2,_item3];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: PieChart(
            PieChartData(
                sections: _sections,
                borderData: FlBorderData(show: false),
                sectionsSpace: 0,
                centerSpaceRadius: 30,
            )
        ),
    );
  }
}
