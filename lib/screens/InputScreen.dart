import 'package:breathalyzer_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.drawerBackgroundColor,
      body: ListView(
        children: [
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0,20,10,10),
            child: Text("Enter the data for All 13 VOC's \nusing the Slider",style: GoogleFonts.poppins(fontSize: 22,color: Colors.white,fontWeight: FontWeight.w600),),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0,20,10,10),
            child: Text("VOC 1",style: GoogleFonts.poppins(fontSize: 22,color: Colors.white),),
          )
          
        ],
      ),
    );
  }
}
