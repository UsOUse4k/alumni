import 'package:alumni/core/theme/a_color.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DonationStatisticData extends StatelessWidget {
  const DonationStatisticData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(colors: [
            Color(0xFF1C59A3),
            Color(0xFF2A1564),
          ])
      ),
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: CategoryAxis(
            axisLine: const AxisLine(
              width: 0,
            ),
            borderWidth: 0,
            majorGridLines: const MajorGridLines(
                width: 0
            ),
            majorTickLines: const MajorTickLines(
                width: 0
            ),
            borderColor: Colors.white,
            labelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: NeutralColor.white
            )
        ),

        primaryYAxis: NumericAxis(
            isVisible: false,
            labelFormat: '{value}'
        ),
        palette: const [
          Colors.white
        ],
        series: <ColumnSeries<SalesData, String>>[
          ColumnSeries<SalesData, String>(
              dataSource:  <SalesData>[
                SalesData('2018', 5000),
                SalesData('2019', 8000),
                SalesData('2020', 14000),
                SalesData('2021', 20000),
                SalesData('2022', 30000)
              ],
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales,
              dataLabelSettings: const DataLabelSettings(
                  isVisible: true, textStyle: TextStyle(
                  color: NeutralColor.white,fontFamily: 'Intro'
              )
              )
          )
        ],

      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}