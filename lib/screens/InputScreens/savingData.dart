import 'package:breathalyzer_app/controllers/input_controller.dart';
import 'package:breathalyzer_app/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../utils/constants.dart';

class SavingDataScreen extends StatefulWidget {
  const SavingDataScreen({Key? key}) : super(key: key);

  @override
  State<SavingDataScreen> createState() => _SavingDataScreenState();
}

class _SavingDataScreenState extends State<SavingDataScreen> {

  void saveData(Map<String,double> vocData) async{
    final db = FirebaseFirestore.instance;
    final QuerySnapshot qSnap = await db.collection('users').get();
    final int documentsLength = qSnap.size;
    await db.collection("users").doc('vocData${documentsLength+1}').set(vocData);
    FlutterSecureStorage flutterSecureStorage = new FlutterSecureStorage();
    flutterSecureStorage.write(key: "data", value: "Y");

    Navigator.pushReplacementNamed(context, homeScreen);
  }

  @override
  Widget build(BuildContext context) {
    final inputController = Provider.of<InputController>(context);
    final vocData = <String, double>{
      "voc1": inputController.vocChoiceList[0],
      "voc2": inputController.vocChoiceList[1],
      "voc3": inputController.vocChoiceList[2],
      "voc4": inputController.vocChoiceList[3],
      "voc5": inputController.vocChoiceList[4],
      "voc6": inputController.vocChoiceList[5],
      "voc7": inputController.vocChoiceList[6],
      "voc8": inputController.vocChoiceList[7],
      "voc9": inputController.vocChoiceList[8],
      "voc10": inputController.vocChoiceList[9],
      "voc11": inputController.vocChoiceList[10],
      "voc12": inputController.vocChoiceList[11],
      "voc13": inputController.vocChoiceList[12],
    };
    saveData(vocData);
    return Scaffold(
      backgroundColor: BrandColor.drawerBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SpinKitDualRing(
            color: Colors.white,
          ),
          SizedBox(height: 30,),
          Text("Saving Data and Analyzing",style: GoogleFonts.poppins(color: Colors.white,
          fontSize: 20,fontWeight: FontWeight.w600),)
        ],
      ),
    );
  }
}
