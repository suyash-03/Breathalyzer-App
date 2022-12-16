import 'package:animate_do/animate_do.dart';
import 'package:breathalyzer_app/controllers/home_controller.dart';
import 'package:breathalyzer_app/utils/colors.dart';
import 'package:breathalyzer_app/utils/constants.dart';
import 'package:breathalyzer_app/utils/widgets/homeScreenButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../utils/status.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String currentDisease = "";
  FlutterSecureStorage flutterSecureStorage = const FlutterSecureStorage();
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      final homeController = Provider.of<HomeController>(context,listen: false);
      await homeController.getProfile();
      homeController.getCurrentDiseaseData();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context,controller,child){
        return Scaffold(
          backgroundColor: BrandColor.drawerBackgroundColor,
          body: controller.profileState == Status.LOADING  ? Container(
            child: const Center(
               child: SpinKitDualRing(color: Colors.white,),
            ),
          ) : controller.profileState == Status.LOADED ? controller.profileResult.fold(
                  (l) => Center(),
                  (r) => ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,20,20,20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(50)),
                                child: SizedBox(
                                  width: 30,
                                    height: 30,
                                    child: Image.network(controller.profileModel.imageUrl))),
                            Container(
                              child: IconButton(onPressed: () async{
                                flutterSecureStorage.deleteAll();
                                Navigator.pushNamedAndRemoveUntil(context, loginScreen, (route) => false);
                              }, icon: const Icon(Icons.logout,color: Colors.white,)),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,0,20,10),
                        child: Row(
                          children: [
                            Text("Welcome ",style: GoogleFonts.poppins(fontSize: 20,color: Colors.white,),),
                          Text(controller.profileModel.name,style: GoogleFonts.poppins(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w800,),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,10,20,20),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          decoration: const BoxDecoration(
                            color: BrandColor.cordScreenGreyText,
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: controller.currentDiseaseStatus == Status.LOADING ? const Center(
                            child: SpinKitDualRing(color: Colors.white,),
                          ) : Row(
                            children:  [
                              Container(
                                height: 200,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 200,
                                      width: 20,
                                      decoration: const BoxDecoration(
                                          color: BrandColor.checkoutBtnDark
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15.0,35,20,40),
                                child: Text("You have \n""symptoms of \n${controller.currentDisease}", style: GoogleFonts.poppins(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),),
                              ),

                              const SizedBox(width: 50,),
                              GestureDetector(
                                onTap: (){
                                  Navigator.pushNamed(context, inputScreen);
                                },
                                child: Container(
                                  width: 100,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: BrandColor.categoriesBtnTextcolor,

                                  ),
                                  child: Center(
                                    child: Text("Enter Latest Data",textAlign: TextAlign.center,style: GoogleFonts.poppins(color: Colors.white,fontSize: 12),),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25.0,5,0,5),
                        child: Text("Highest VOC Levels", style: GoogleFonts.poppins(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,5,20,0),
                        child: Container(width: MediaQuery.of(context).size.width,height: 60,
                          decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: BrandColor.cordScreenGreyText,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10,15,10,10),
                              child: controller.currentDiseaseStatus == Status.LOADING ? SpinKitPulse(color: Colors.white) : ListView.builder(
                                itemCount: 3,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context,index){
                                  return Text("${index + 1}) ${controller.topVOCData[index]}  ",style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),);
                                },
                                ),
                            ),
                          ),

                        ),
                      ),
                      SizedBox(height: 60,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, historyScreen);
                        },
                          child: const HomeScreenButton(text: "History", icon: Icons.bar_chart)),
                      const SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, viewHospitalsScreen);
                        },
                          child: const HomeScreenButton(text: "View Hospitals", icon: Icons.local_hospital)),
                      const SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, dietScreen);
                        },
                          child: const HomeScreenButton(text: "Diet Recommendations", icon: Icons.receipt)),
                      const SizedBox(height: 20,),
                      GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, shareScreen);
                          },
                          child: const HomeScreenButton(text: "Share Details", icon: Icons.share)),
                      SizedBox(height: 50,),

                    ],
                  )): Center(child: Text("Some Error Occurred",style: GoogleFonts.poppins(color: Colors.white,fontSize: 24),),),

        );
      }
    );
  }
}
