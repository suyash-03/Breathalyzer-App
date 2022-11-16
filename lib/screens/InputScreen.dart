import 'package:breathalyzer_app/controllers/input_controller.dart';
import 'package:breathalyzer_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

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
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,20,10,10),
                child: Text("Enter the data for All 13 VOC's \nfrom the sensor",style: GoogleFonts.poppins(fontSize: 22,color: Colors.white,fontWeight: FontWeight.w600),),
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  children:  [
                    VOC1(inputController: controller),
                    VOC1(inputController: controller),
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

class VOC1 extends StatefulWidget {
  final InputController inputController;
  const VOC1({Key? key, required this.inputController}) : super(key: key);

  @override
  State<VOC1> createState() => _VOC1State();
}

class _VOC1State extends State<VOC1> {
  List<bool> selectionList = List.filled(19, false);
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0,20,10,10),
            child: Text("VOC 1",style: GoogleFonts.poppins(fontSize: 22,color: Colors.white),),
          ),
          CheckboxListTile(
            title: Text(widget.inputController.vocDataList[0].toString(),style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),),
            checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            value: selectionList[0],
            onChanged: (newValue) {
              setState(() {
                selectionList[0] = newValue!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            title: Text(widget.inputController.vocDataList[0].toString(),style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),),
            checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            value: selectionList[0],
            onChanged: (newValue) {
              setState(() {
                selectionList[0] = newValue!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            title: Text(widget.inputController.vocDataList[1].toString(),style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),),
            checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            value: selectionList[1],
            onChanged: (newValue) {
              setState(() {
                selectionList[1] = newValue!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            title: Text(widget.inputController.vocDataList[2].toString(),style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),),
            checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            value: selectionList[2],
            onChanged: (newValue) {
              setState(() {
                selectionList[2] = newValue!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          SizedBox(height: 100,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
            child: NeoPopButton(
              color: Colors.white,
              onTapUp: () => HapticFeedback.vibrate(),
              onTapDown: () => HapticFeedback.vibrate(),
              border: Border.all(
                color: BrandColor.drawerBackgroundColor,
                width: 2,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text("next",style: GoogleFonts.poppins(color: Colors.black),),
                  ],
                ),
              ),
            ),
          ),


        ],
      );

  }
}

