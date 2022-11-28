import 'package:animate_do/animate_do.dart';
import 'package:breathalyzer_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenButton extends StatefulWidget {
  final String text;
  final IconData icon;
  const HomeScreenButton({Key? key, required this.text, required this.icon}) : super(key: key);

  @override
  State<HomeScreenButton> createState() => _HomeScreenButtonState();
}

class _HomeScreenButtonState extends State<HomeScreenButton> {
  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 400),
      child: Align(
        child: Stack(
          children: [
            Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: "#1E2326".fromHexToColor()),
                height: 45,
                width: 262,
                child: Text("      ${widget.text}",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w500))),
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15)),
                  color: "#142A37".fromHexToColor()),
            ),
             Positioned(
              left: 11,
              top: 10,
              child: Icon(widget.icon,color: Colors.white,),
            ),
          ],
        ),
      ),
    );
  }
}
