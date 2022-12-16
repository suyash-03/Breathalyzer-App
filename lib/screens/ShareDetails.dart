import 'package:breathalyzer_app/controllers/home_controller.dart';
import 'package:breathalyzer_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ShareDetails extends StatefulWidget {
  const ShareDetails({Key? key}) : super(key: key);

  @override
  State<ShareDetails> createState() => _ShareDetailsState();
}

class _ShareDetailsState extends State<ShareDetails> {
  TextEditingController phoneNumberController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context,listen: false);
    return Scaffold(
      backgroundColor: BrandColor.drawerBackgroundColor,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20,40,10,0),
            child: Text("Share your Details",style: GoogleFonts.poppins(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,10,10,0),
            child: Text("with other people",style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,10,10,0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 350,
              decoration: const BoxDecoration(
                color: BrandColor.cordScreenGreyText,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  controller.patientSummary,style: GoogleFonts.poppins(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(height: 30,),
          Center(child: Text("Enter WhatsApp Number",style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),)),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,10,10,0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  height: 30,
                  child: TextField(
                    controller: phoneNumberController,
                    decoration: const InputDecoration(
                      filled: true, //<-- SEE HERE
                      fillColor: Colors.white, //<-- SEE HERE
                    ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ]
                  ),
                ),
                GestureDetector(
                  onTap: () async{
                    if(phoneNumberController.text.length < 10 || phoneNumberController.text.length >10){
                      Fluttertoast.showToast(msg: "Enter Valid Phone Number");
                    }else{
                      final Uri _url = Uri.parse("https://wa.me/?text=${controller.patientSummary}");
                      _launchUrl(_url);
                    }
                  },
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      color: BrandColor.categoriesBtnTextcolor,
                    ),
                    child: Center(
                      child: Text("Send",textAlign: TextAlign.center,style: GoogleFonts.poppins(color: Colors.white,fontSize: 12),),
                    ),
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 30,),
          Center(child: Text("Enter Email Address",style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),)),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,10,10,0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  height: 30,
                  child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        filled: true, //<-- SEE HERE
                        fillColor: Colors.white, //<-- SEE HERE
                      ),
                  ),
                ),
                GestureDetector(
                  onTap: () async{
                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: emailController.text,
                      query: encodeQueryParameters(<String, String>{
                        'subject': 'Hey! Checkout my latest VOC Data',
                        'body': controller.patientSummary,
                      }),
                    );
                    _launchUrl(emailLaunchUri);
                  },
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      color: BrandColor.categoriesBtnTextcolor,
                    ),
                    child: Center(
                      child: Text("Send",textAlign: TextAlign.center,style: GoogleFonts.poppins(color: Colors.white,fontSize: 12),),
                    ),
                  ),
                ),
                SizedBox(height: 50,),

              ],
            ),
          )

        ],
      ),
    );
  }
}
