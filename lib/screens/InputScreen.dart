import 'package:breathalyzer_app/controllers/input_controller.dart';
import 'package:breathalyzer_app/screens/InputScreens/voc10.dart';
import 'package:breathalyzer_app/screens/InputScreens/voc12.dart';
import 'package:breathalyzer_app/screens/InputScreens/voc13.dart';
import 'package:breathalyzer_app/screens/InputScreens/voc2.dart';
import 'package:breathalyzer_app/screens/InputScreens/voc3.dart';
import 'package:breathalyzer_app/screens/InputScreens/voc4.dart';
import 'package:breathalyzer_app/screens/InputScreens/voc5.dart';
import 'package:breathalyzer_app/screens/InputScreens/voc6.dart';
import 'package:breathalyzer_app/screens/InputScreens/voc7.dart';
import 'package:breathalyzer_app/screens/InputScreens/voc8.dart';
import 'package:breathalyzer_app/screens/InputScreens/voc9.dart';
import 'package:breathalyzer_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'InputScreens/voc1.dart';
import 'InputScreens/voc11.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    return Consumer<InputController>(
      builder: (context,controller,child){
        return Scaffold(
          backgroundColor: BrandColor.drawerBackgroundColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,20,10,10),
                child: Text("Enter the data for All 13 VOC's \nfrom the sensor",style: GoogleFonts.poppins(fontSize: 22,color: Colors.white,fontWeight: FontWeight.w600),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,20,10,0),
                child: Text("All Values are scaled by /10^6",style: GoogleFonts.poppins(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w400),),
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  children:  [
                    VOC1(inputController: controller,pageController: pageController,),
                    VOC2(inputController: controller,pageController: pageController,),
                    VOC3(inputController: controller,pageController: pageController,),
                    VOC4(inputController: controller,pageController: pageController,),
                    VOC5(inputController: controller,pageController: pageController,),
                    VOC6(inputController: controller,pageController: pageController,),
                    VOC7(inputController: controller,pageController: pageController,),
                    VOC8(inputController: controller,pageController: pageController,),
                    VOC9(inputController: controller,pageController: pageController,),
                    VOC10(inputController: controller,pageController: pageController,),
                    VOC11(inputController: controller,pageController: pageController,),
                    VOC12(inputController: controller,pageController: pageController,),
                    VOC13(inputController: controller,pageController: pageController,),
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }
}



