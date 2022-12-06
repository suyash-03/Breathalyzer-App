import 'package:breathalyzer_app/controllers/home_controller.dart';
import 'package:breathalyzer_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.drawerBackgroundColor,
      body: Consumer<HomeController>(
        builder: (context,controller,child){
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20,50,0,20),
                child: Text("History of VOC Input",style: GoogleFonts.poppins(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
              ),
              Center(
                  child: Container(
                      // child: SfCartesianChart(
                      //     primaryXAxis: NumericAxis(minimum: 0,maximum: (widget.priceList.length-1)*5,interval: 5),
                      //     primaryYAxis: NumericAxis(minimum: (mini-widget.change).abs(), maximum: (maxi+widget.change).abs(), interval: widget.change.abs()+1),
                      //     tooltipBehavior: _tooltip,
                      //     series: <ChartSeries<ChartData, double>>[
                      //       LineSeries<ChartData, double>(
                      //         dataSource: data,
                      //         xValueMapper: (ChartData data, _) => data.x,
                      //         yValueMapper: (ChartData data, _) => data.y,
                      //         color: const Color(0xff5ea586),
                      //         width: 5,
                      //       )
                      //     ]),
                  )
              ),
            ],
          );
        }
      )
    );
  }
}
