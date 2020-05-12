import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../models/chart.dart';

class Charts extends StatefulWidget {
  final List<Chart> data;
  Charts({Key key, this.data}) : super(key: key);

  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  @override
  Widget build(BuildContext context) {
    List<charts.Series<Chart, String>> series = [
      charts.Series(
        id: 'Cases',
        data: widget.data,
        domainFn: (Chart series, _) => series.date,
        measureFn: (Chart series, _) => series.cases,
        colorFn: (Chart series, _) =>
            charts.ColorUtil.fromDartColor(Color(0XFFf7797d)),
      )
    ];

    return charts.BarChart(series,
        animate: true,
        defaultRenderer: new charts.BarRendererConfig(
            // By default, bar renderer will draw rounded bars with a constant
            // radius of 30.
            // To not have any rounded corners, use [NoCornerStrategy]
            // To change the radius of the bars, use [ConstCornerStrategy]
            cornerStrategy: const charts.ConstCornerStrategy(7)),
        domainAxis: charts.OrdinalAxisSpec(
          renderSpec: charts.SmallTickRendererSpec(
            labelRotation: 40,
            lineStyle: new charts.LineStyleSpec(
                color: charts.ColorUtil.fromDartColor(Colors.grey[400])),
            labelStyle: charts.TextStyleSpec(
                fontSize: 13,
                color: charts.ColorUtil.fromDartColor(Colors.grey[400])),
          ),
        ),
        primaryMeasureAxis: new charts.NumericAxisSpec(
            renderSpec: new charts.GridlineRendererSpec(
          lineStyle: new charts.LineStyleSpec(
              color: charts.ColorUtil.fromDartColor(Colors.grey[400])),
          labelStyle: new charts.TextStyleSpec(
              fontSize: 11,
              color: charts.ColorUtil.fromDartColor(Colors.grey[400])),
        )));
  }
}
