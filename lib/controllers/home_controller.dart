import 'package:breathalyzer_app/models/profile_model.dart';
import 'package:breathalyzer_app/repositories/home_repository.dart';
import 'package:breathalyzer_app/utils/failure.dart';
import 'package:breathalyzer_app/utils/status.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:breathalyzer_app/utils/functions.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class HomeController with ChangeNotifier{
  final HomeRepository _homeRepository;

  late Either<Failure,ProfileModel> profileResult;
  late String currentDisease = "";

  HomeController(this._homeRepository);
  late ProfileModel profileModel;

  Status profileState = Status.INTIAL;
  Status vocDataStatus = Status.LOADING;

  Future getProfile() async {
    profileState = Status.LOADING;
    notifyListeners();
    await Task(() => _homeRepository.getUserProfile())
        .attempt()
        .mapLeftToFailure()
        .run()
        .then((result) {
      profileResult = result as Either<Failure, ProfileModel>;
    });
    profileResult.fold((l) {profileState = Status.ERROR;
    notifyListeners();
    }, (r) {
      notifyListeners();
      profileModel = r;
      return profileState = Status.LOADED;
    });
  }

  void getCurrentDiseaseData() async{
    final db = FirebaseFirestore.instance;
    FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
    String? uid = await flutterSecureStorage.read(key: "UUID");
    final QuerySnapshot qSnap = await db.collection('users').doc(uid).collection("userData").get();
    final int documentsLength = qSnap.size;

    DocumentSnapshot snapshot =  await db.collection("users").doc(uid).collection("userData").doc("vocData$documentsLength").get();
    print(snapshot.data().toString());

    double voc1Level = snapshot["voc1"];
    double voc2Level = snapshot["voc2"];
    double voc3Level = snapshot["voc3"];
    double voc4Level = snapshot["voc4"];
    double voc5Level = snapshot["voc5"];
    double voc6Level = snapshot["voc6"];
    double voc7Level = snapshot["voc7"];
    double voc8Level = snapshot["voc8"];
    double voc9Level = snapshot["voc9"];
    double voc10Level = snapshot["voc10"];
    double voc11Level = snapshot["voc11"];
    double voc12Level = snapshot["voc12"];
    double voc13Level = snapshot["voc13"];



    // [2,1.95,1.71,1.65,1.54,1,0.7,0.65,0.5, 0.35,0.2,0.17,0.15,0.1,0.05,0.03,0.01,0.005,0.000001];
    if(voc1Level == 1.54 && voc2Level == 0.35 && voc3Level == 0.01 && voc5Level == 0.5 && voc7Level == 0.01
    && voc8Level == 0.17 && voc9Level == 0.2 && voc10Level == 0.2 && voc11Level == 0.35 && voc12Level == 1.65
    && voc13Level == 0.1){
      currentDisease = "Lung Cancer";
    }else if(voc1Level == 1.54){

    }



  }

  List<double> voc1History = [];
  List<double> voc2History = [];
  List<double> voc3History = [];
  List<double> voc4History = [];
  List<double> voc5History = [];
  List<double> voc6History = [];
  List<double> voc7History = [];
  List<double> voc8History = [];
  List<double> voc9History = [];
  List<double> voc10History = [];
  List<double> voc11History = [];
  List<double> voc12History = [];
  List<double> voc13History = [];


  void getVOCData() async {
    voc1History.clear(); voc2History.clear(); voc3History.clear(); voc4History.clear();
    voc5History.clear(); voc6History.clear(); voc7History.clear(); voc8History.clear();
    voc9History.clear(); voc10History.clear(); voc11History.clear(); voc12History.clear();
    voc13History.clear();
    final db = FirebaseFirestore.instance;
    FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
    String? uid = await flutterSecureStorage.read(key: "UUID");
    final QuerySnapshot qSnap = await db.collection('users').doc(uid).collection("userData").get();
    final int documentsLength = qSnap.size;
    List<DocumentReference> vocDataList = [];
    for(int i=1; i<=documentsLength; i++){
      vocDataList.add(db.collection("users").doc(uid).collection("userData").doc("vocData$i"));
    }

    for(int i=0; i<vocDataList.length; i++){
      int vocDocNumber = i;

      await vocDataList[vocDocNumber].get().then<dynamic>(( DocumentSnapshot snapshot) async{
        voc1History.add(snapshot["voc1"]);
        voc2History.add(snapshot["voc2"]);
        voc3History.add(snapshot["voc3"]);
        voc4History.add(snapshot["voc4"]);
        voc5History.add(snapshot["voc5"]);
        voc6History.add(snapshot["voc6"]);
        voc7History.add(snapshot["voc7"]);
        voc8History.add(snapshot["voc8"]);
        voc9History.add(snapshot["voc9"]);
        voc10History.add(snapshot["voc10"]);
        voc11History.add(snapshot["voc11"]);
        voc12History.add(snapshot["voc12"]);
        voc13History.add(snapshot["voc13"]);
      });
    }

    vocDataStatus = Status.LOADED;


    for(int i=0; i<voc1History.length; i++){
      print(voc1History[i]);
    }

    notifyListeners();
  }


}