import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChart extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  LineChart({Key? key}) : super(key: key);

  @override
  _LineChartState createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Column(children: [
        //Initialize the chart widget
        Expanded(
          flex: 3,
          child: SfCartesianChart(
              borderWidth: 0,
              borderColor: Colors.white,
              plotAreaBorderWidth: 0,
              plotAreaBackgroundColor: Colors.white,
              plotAreaBorderColor: Colors.white,
              primaryXAxis: CategoryAxis(
                axisBorderType: AxisBorderType.withoutTopAndBottom,
                isVisible: true,
                axisLine: const AxisLine(width: 0, color: Colors.red),
                majorGridLines: const MajorGridLines(width: 0),
                majorTickLines: const MajorTickLines(width: 0),
                borderWidth: 0,
              ),
              primaryYAxis: CategoryAxis(
                  interval: 10,
                  axisLine: const AxisLine(width: 0, color: Colors.red),
                  // majorGridLines: MajorGridLines(width: 0),
                  majorTickLines: const MajorTickLines(width: 0)),

              // Chart title
              // title: ChartTitle(text: 'Half yearly sales analysis'),
              // Enable legend
              legend: Legend(isVisible: false),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<_SalesData, String>>[
                LineSeries<_SalesData, String>(
                    dataSource: data,
                    xValueMapper: (_SalesData sales, _) => sales.year,
                    yValueMapper: (_SalesData sales, _) => sales.sales,
                    name: 'Sales',
                    // Enable data label
                    dataLabelSettings: const DataLabelSettings(isVisible: true))
              ]),
        ),
        // Expanded(
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     //Initialize the spark charts widget
        //     child: SfSparkLineChart.custom(
        //       //Enable the trackball
        //       trackball: SparkChartTrackball(
        //           activationMode: SparkChartActivationMode.tap),
        //       //Enable marker
        //       marker: SparkChartMarker(
        //           displayMode: SparkChartMarkerDisplayMode.all),
        //       //Enable data label
        //       labelDisplayMode: SparkChartLabelDisplayMode.all,
        //       xValueMapper: (int index) => data[index].year,
        //       yValueMapper: (int index) => data[index].sales,
        //       dataCount: 3,
        //     ),
        //   ),
        // )
      ]),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
