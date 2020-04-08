import 'package:Covid19Nigeria/Components/CardTitle.dart';
import 'package:Covid19Nigeria/Components/Legends.dart';
import 'package:Covid19Nigeria/Helpers/ChartSampleData.dart';
import 'package:Covid19Nigeria/Providers/AppBrain.dart';
import 'package:Covid19Nigeria/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Charts extends StatelessWidget {
  final List<ChartSampleData> chartData = <ChartSampleData>[
    ChartSampleData(x: 'Confirmed', y: 189386, text: ''),
    ChartSampleData(x: 'Dead', y: 7700, text: ''),
    ChartSampleData(x: 'Recovered', y: 86000, text: ''),
  ];
  List<DoughnutSeries<ChartSampleData, String>> getDefaultDoughnutSeries(
      bool isTileView,context) {
    return <DoughnutSeries<ChartSampleData, String>>[
      DoughnutSeries<ChartSampleData, String>(
          radius: '80%',
          explode: true,
          explodeOffset: '10%',
          dataSource: Provider.of<AppBrain>(context).isloading1? chartData:
          Provider.of<AppBrain>(context).chartData,
          // cornerStyle: CornerStyle.endCurve,

          xValueMapper: (ChartSampleData data, _) => data.x,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelMapper: (ChartSampleData data, _) => data.text,
          dataLabelSettings:
              DataLabelSettings(isVisible: true, useSeriesColor: true))
    ];
  }

  legend(LegendRenderArgs arg) {
    // arg.legendIconType=LegendIconType.image;
    arg.text = chartData[arg.pointIndex].y.toInt().toString() +
        ' ' +
        chartData[arg.pointIndex].x;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 350,
        width: MediaQuery.of(context).size.width,
        child: Card(
            elevation: 0.5,
            color: Colors.white70,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CardTitle('World Statistics'),
                  Container(
                    height: 300,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: SfCircularChart(
                            margin: EdgeInsets.all(0),
                            legend: Legend(isVisible: false),
                            //  onLegendItemRender: (LegendRenderArgs arg) => legend(arg),
                            series: getDefaultDoughnutSeries(false,context),
                            tooltipBehavior: TooltipBehavior(enable: true),
                            //backgroundColor: Colors.white60,
                            palette: [
                              Colors.indigo,
                              Colors.red,
                              Colors.green,
                            ],
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              MyLegend(
                                 Provider.of<AppBrain>(context).chartData[0] , AppTheme().kcolors[0]),
                              //   SizedBox(height: 8,),
                              MyLegend(Provider.of<AppBrain>(context).chartData[1], AppTheme().kcolors[1]),
                              //  SizedBox(height: 8,),
                              MyLegend(Provider.of<AppBrain>(context).chartData[2], AppTheme().kcolors[2])
                            ],
                          ),
                          flex: 1,
                        )
                      ],
                    ),
                  ),
                ])),
      ),
    );
  }
}
