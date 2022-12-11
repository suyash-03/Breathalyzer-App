import 'package:animate_do/animate_do.dart';
import 'package:breathalyzer_app/controllers/home_controller.dart';
import 'package:breathalyzer_app/utils/colors.dart';
import 'package:breathalyzer_app/utils/widgets/ChartWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../models/chart_data.dart';
import '../utils/status.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      final homeController = Provider.of<HomeController>(context,listen: false);
       homeController.getVOCData();
    });
    super.didChangeDependencies();
  }


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
              controller.vocDataStatus == Status.LOADING  ? SpinKitDualRing(color: Colors.white) :
              FadeInUp(
                duration: const Duration(milliseconds: 50),
                child: Center(
                    child: Container(
                      child: ChartWidget(vocHistoryList: controller.voc1History),
                    )
                ),
              ),
              FadeInUp(
                  duration: const Duration(milliseconds: 50),
                  child: Center(child: Text("VOC 1 Data",style: GoogleFonts.poppins(color: Colors.white,fontSize: 12),))),
              SizedBox(height: 20,),
              FadeInUp(
                duration: const Duration(milliseconds: 100),
                child: Center(
                    child: Container(
                      child: ChartWidget(vocHistoryList: controller.voc2History),
                    )
                ),
              ),
              FadeInUp(
                  duration: const Duration(milliseconds: 100),
                  child: Center(child: Text("VOC 2 Data",style: GoogleFonts.poppins(color: Colors.white,fontSize: 12),))),
              SizedBox(height: 20,),
              FadeInUp(
                duration: const Duration(milliseconds: 150),
                child: Center(
                    child: Container(
                      child: ChartWidget(vocHistoryList: controller.voc3History),
                    )
                ),
              ),
              FadeInUp(
                  duration: const Duration(milliseconds: 150),
                  child: Center(child: Text("VOC 3 Data",style: GoogleFonts.poppins(color: Colors.white,fontSize: 12),))),
              SizedBox(height: 20,),
              FadeInUp(
                duration: const Duration(milliseconds: 200),
                child: Center(
                    child: Container(
                      child: ChartWidget(vocHistoryList: controller.voc4History),
                    )
                ),
              ),
              FadeInUp(
                  duration: const Duration(milliseconds: 200),
                  child: Center(child: Text("VOC 4 Data",style: GoogleFonts.poppins(color: Colors.white,fontSize: 12),))),
              SizedBox(height: 20,),
              FadeInUp(
                duration: const Duration(milliseconds: 250),
                child: Center(
                    child: Container(
                      child: ChartWidget(vocHistoryList: controller.voc5History),
                    )
                ),
              ),
              FadeInUp(
                  duration: const Duration(milliseconds: 250),
                  child: Center(child: Text("VOC 5 Data",style: GoogleFonts.poppins(color: Colors.white,fontSize: 12),))),
              SizedBox(height: 20,),
              FadeInUp(
                duration: const Duration(milliseconds: 300),
                child: Center(
                    child: Container(
                      child: ChartWidget(vocHistoryList: controller.voc6History),
                    )
                ),
              ),
              FadeInUp(
                  duration: const Duration(milliseconds: 300),
                  child: Center(child: Text("VOC 6 Data",style: GoogleFonts.poppins(color: Colors.white,fontSize: 12),))),
              SizedBox(height: 20,),
              Center(
                  child: Container(
                    child: ChartWidget(vocHistoryList: controller.voc7History),
                  )
              ),
              Center(child: Text("VOC 7 Data",style: GoogleFonts.poppins(color: Colors.white,fontSize: 12),)),
              SizedBox(height: 20,),
              Center(
                  child: Container(
                    child: ChartWidget(vocHistoryList: controller.voc8History),
                  )
              ),
              Center(child: Text("VOC 8 Data",style: GoogleFonts.poppins(color: Colors.white,fontSize: 12),)),
              SizedBox(height: 20,),
              Center(
                  child: Container(
                    child: ChartWidget(vocHistoryList: controller.voc9History),
                  )
              ),
              Center(child: Text("VOC 9 Data",style: GoogleFonts.poppins(color: Colors.white,fontSize: 12),)),
              SizedBox(height: 20,),
              Center(
                  child: Container(
                    child: ChartWidget(vocHistoryList: controller.voc10History),
                  )
              ),
              Center(child: Text("VOC 10 Data",style: GoogleFonts.poppins(color: Colors.white,fontSize: 12),)),
              SizedBox(height: 20,),
              Center(
                  child: Container(
                    child: ChartWidget(vocHistoryList: controller.voc11History),
                  )
              ),
              Center(child: Text("VOC 11 Data",style: GoogleFonts.poppins(color: Colors.white,fontSize: 12),)),
              SizedBox(height: 20,),
              Center(
                  child: Container(
                    child: ChartWidget(vocHistoryList: controller.voc12History),
                  )
              ),
              Center(child: Text("VOC 12 Data",style: GoogleFonts.poppins(color: Colors.white,fontSize: 12),)),
              SizedBox(height: 20,),
              Center(
                  child: Container(
                    child: ChartWidget(vocHistoryList: controller.voc13History),
                  )
              ),
              Center(child: Text("VOC 13 Data",style: GoogleFonts.poppins(color: Colors.white,fontSize: 12),)),
              SizedBox(height: 50,),
            ],
          );
        }
      )
    );
  }
}
