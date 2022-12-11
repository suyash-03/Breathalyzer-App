import 'dart:math';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import '../../models/chart_data.dart';

class ChartWidget extends StatefulWidget {
  final List<double> vocHistoryList;
  const ChartWidget({Key? key, required this.vocHistoryList}) : super(key: key);

  @override
  ChartWidgetState createState() => ChartWidgetState();
}

class ChartWidgetState extends State<ChartWidget> {
  late List<ChartData> data;
  late TooltipBehavior _tooltip;
  double maxi = 0.0;
  double mini = 0.0;

  @override
  void initState() {
    data = [];

    for(int i=0; i<widget.vocHistoryList.length; i++){
      mini = min(mini, widget.vocHistoryList[i]);
      maxi = max(maxi, widget.vocHistoryList[i]);
    }

    for(int i=0; i<widget.vocHistoryList.length; i++){
      ChartData chartData =  ChartData(xValue: i, yValue: widget.vocHistoryList[i]);
      data.add(chartData);
    }

    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        primaryXAxis: NumericAxis(minimum: 0,maximum: widget.vocHistoryList.length.toDouble(),interval: 1),
        primaryYAxis: NumericAxis(minimum: mini, maximum: maxi+1, interval: 0.4),
        tooltipBehavior: _tooltip,
        series: <ChartSeries<ChartData, int>>[
          LineSeries<ChartData, int>(
            dataSource: data,
            xValueMapper: (ChartData data, _) => data.xValue,
            yValueMapper: (ChartData data, _) => data.yValue,
            color: const Color(0xff5ea586),
            width: 5,
          )
        ]);
  }
}





