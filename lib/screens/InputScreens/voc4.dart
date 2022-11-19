import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import '../../controllers/input_controller.dart';
import '../../utils/colors.dart';

class VOC4 extends StatefulWidget {
  final InputController inputController;
  final PageController pageController;
  const VOC4({Key? key, required this.inputController,required this.pageController}) : super(key: key);

  @override
  State<VOC4> createState() => _VOC4State();
}

class _VOC4State extends State<VOC4> {
  List<bool> selectionList = List.filled(19, false);
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0,0,10,10),
          child: Text("VOC 4",style: GoogleFonts.poppins(fontSize: 22,color: Colors.white),),
        ),
        Row(
          children: [
            Flexible(
              child: CheckboxListTile(
                title: Text(widget.inputController.vocDataList[0].toString(),style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),),
                checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                value: selectionList[0],
                onChanged: (newValue) {
                  setState(() {
                    for(int i=0;i<selectionList.length; i++){
                      selectionList[i] = false;
                    }
                    selectionList[0] = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            Flexible(
              child: CheckboxListTile(
                title: Text(widget.inputController.vocDataList[1].toString(),style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),),
                checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                value: selectionList[1],
                onChanged: (newValue) {
                  setState(() {
                    for(int i=0;i<selectionList.length; i++){
                      selectionList[i] = false;
                    }
                    selectionList[1] = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            Flexible(
              child: CheckboxListTile(
                title: Text(widget.inputController.vocDataList[2].toString(),style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),),
                checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                value: selectionList[2],
                onChanged: (newValue) {
                  setState(() {
                    for(int i=0;i<selectionList.length; i++){
                      selectionList[i] = false;
                    }
                    selectionList[2] = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: CheckboxListTile(
                title: Text(widget.inputController.vocDataList[3].toString(),style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),),
                checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                value: selectionList[3],
                onChanged: (newValue) {
                  setState(() {
                    for(int i=0;i<selectionList.length; i++){
                      selectionList[i] = false;
                    }
                    selectionList[3] = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            Flexible(
              child: CheckboxListTile(
                title: Text(widget.inputController.vocDataList[4].toString(),style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),),
                checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                value: selectionList[4],
                onChanged: (newValue) {
                  setState(() {
                    for(int i=0;i<selectionList.length; i++){
                      selectionList[i] = false;
                    }
                    selectionList[4] = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            Flexible(
              child: CheckboxListTile(
                title: Text(widget.inputController.vocDataList[5].toString(),style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),),
                checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                value: selectionList[5],
                onChanged: (newValue) {
                  setState(() {
                    for(int i=0;i<selectionList.length; i++){
                      selectionList[i] = false;
                    }
                    selectionList[5] = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: CheckboxListTile(
                title: Text(widget.inputController.vocDataList[6].toString(),style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),),
                checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                value: selectionList[6],
                onChanged: (newValue) {
                  setState(() {
                    for(int i=0;i<selectionList.length; i++){
                      selectionList[i] = false;
                    }
                    selectionList[6] = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            Flexible(
              child: CheckboxListTile(
                title: Text(widget.inputController.vocDataList[7].toString(),style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),),
                checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                value: selectionList[7],
                onChanged: (newValue) {
                  setState(() {
                    for(int i=0;i<selectionList.length; i++){
                      selectionList[i] = false;
                    }
                    selectionList[7] = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            Flexible(
              child: CheckboxListTile(
                title: Text(widget.inputController.vocDataList[8].toString(),style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),),
                checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                value: selectionList[8],
                onChanged: (newValue) {
                  setState(() {
                    for(int i=0;i<selectionList.length; i++){
                      selectionList[i] = false;
                    }
                    selectionList[8] = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: CheckboxListTile(
                title: Text(widget.inputController.vocDataList[9].toString(),style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),),
                checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                value: selectionList[9],
                onChanged: (newValue) {
                  setState(() {
                    for(int i=0;i<selectionList.length; i++){
                      selectionList[i] = false;
                    }
                    selectionList[9] = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            Flexible(
              child: CheckboxListTile(
                title: Text(widget.inputController.vocDataList[10].toString(),style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),),
                checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                value: selectionList[10],
                onChanged: (newValue) {
                  setState(() {
                    for(int i=0;i<selectionList.length; i++){
                      selectionList[i] = false;
                    }
                    selectionList[10] = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            Flexible(
              child: CheckboxListTile(
                title: Text(widget.inputController.vocDataList[11].toString(),style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),),
                checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                value: selectionList[11],
                onChanged: (newValue) {
                  setState(() {
                    for(int i=0;i<selectionList.length; i++){
                      selectionList[i] = false;
                    }
                    selectionList[11] = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
          ],
        ),          Row(
          children: [
            Flexible(
              child: CheckboxListTile(
                title: Text(widget.inputController.vocDataList[12].toString(),style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),),
                checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                value: selectionList[12],
                onChanged: (newValue) {
                  setState(() {
                    for(int i=0;i<selectionList.length; i++){
                      selectionList[i] = false;
                    }
                    selectionList[12] = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            Flexible(
              child: CheckboxListTile(
                title: Text(widget.inputController.vocDataList[13].toString(),style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),),
                checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                value: selectionList[13],
                onChanged: (newValue) {
                  setState(() {
                    for(int i=0;i<selectionList.length; i++){
                      selectionList[i] = false;
                    }
                    selectionList[13] = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            Flexible(
              child: CheckboxListTile(
                title: Text(widget.inputController.vocDataList[14].toString(),style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),),
                checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                value: selectionList[14],
                onChanged: (newValue) {
                  setState(() {
                    for(int i=0;i<selectionList.length; i++){
                      selectionList[i] = false;
                    }
                    selectionList[14] = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
          ],
        ),          Row(
          children: [
            Flexible(
              child: CheckboxListTile(
                title: Text(widget.inputController.vocDataList[15].toString(),style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),),
                checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                value: selectionList[15],
                onChanged: (newValue) {
                  setState(() {
                    for(int i=0;i<selectionList.length; i++){
                      selectionList[i] = false;
                    }
                    selectionList[15] = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            Flexible(
              child: CheckboxListTile(
                title: Text(widget.inputController.vocDataList[16].toString(),style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),),
                checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                value: selectionList[16],
                onChanged: (newValue) {
                  setState(() {
                    for(int i=0;i<selectionList.length; i++){
                      selectionList[i] = false;
                    }
                    selectionList[16] = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            Flexible(
              child: CheckboxListTile(
                title: Text(widget.inputController.vocDataList[17].toString(),style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),),
                checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                value: selectionList[17],
                onChanged: (newValue) {
                  setState(() {
                    for(int i=0;i<selectionList.length; i++){
                      selectionList[i] = false;
                    }
                    selectionList[17] = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
          ],
        ),          Row(
          children: [
            Flexible(
              child: CheckboxListTile(
                title: Text(widget.inputController.vocDataList[18].toString(),style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),),
                checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                value: selectionList[18],
                onChanged: (newValue) {
                  setState(() {
                    for(int i=0;i<selectionList.length; i++){
                      selectionList[i] = false;
                    }
                    selectionList[18] = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
          child: NeoPopButton(
            color: Colors.white,
            onTapUp: (){
              HapticFeedback.vibrate();
              widget.pageController.nextPage(duration: Duration(milliseconds: 200), curve: Curves.easeIn);
            },
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
          child: NeoPopButton(
            color: Colors.black,
            onTapUp: (){
              HapticFeedback.vibrate();
              widget.pageController.previousPage(duration: Duration(milliseconds: 200), curve: Curves.easeIn);
            },
            onTapDown: () => HapticFeedback.vibrate(),
            border: Border.all(
              color: Colors.black12,
              width: 2,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Text("previous",style: GoogleFonts.poppins(color: Colors.white),),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 100,)
      ],
    );
  }
}