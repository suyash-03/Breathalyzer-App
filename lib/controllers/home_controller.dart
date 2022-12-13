import 'package:breathalyzer_app/models/profile_model.dart';
import 'package:breathalyzer_app/repositories/home_repository.dart';
import 'package:breathalyzer_app/utils/failure.dart';
import 'package:breathalyzer_app/utils/status.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:breathalyzer_app/utils/functions.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/map_marker_model.dart';


class HomeController with ChangeNotifier{
  final HomeRepository _homeRepository;

  late Either<Failure,ProfileModel> profileResult;
  late String currentDisease = "";

  HomeController(this._homeRepository);
  late ProfileModel profileModel;

  Status profileState = Status.INTIAL;
  Status vocDataStatus = Status.LOADING;
  Status currentDiseaseStatus = Status.LOADING;

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



    // [2,1.95,1.71,1.65,1.54,1,0.7,0.65,0.5, 0.35,0.2,0.17,0.15,0.1,0.05,0.03,0.01,0.005,0.000001,0.0];
    if(voc1Level == 1 && voc2Level == 0.35 && voc3Level == 0.01 && voc4Level == 0.0 && voc5Level == 0.5 && voc6Level == 0.0 && voc7Level == 0.01
    && voc8Level == 0.35 && voc9Level == 0.35 && voc10Level == 0.35 && voc11Level == 0.5 && voc12Level == 1.65
    && voc13Level == 0.1){
      currentDisease = "Lung Cancer";
    }
    else if(voc1Level == 1 && voc2Level == 0.2 && voc3Level == 1.65 && voc4Level == 0.03 && voc5Level == 0.2 && voc6Level == 0.5 
    && voc7Level == 0.03  && voc8Level == 0.35 && voc9Level == 0.35 && voc10Level == 0.1 && voc11Level == 0.5 && voc12Level == 0.65
    && voc13Level == 0.05){currentDisease = "Colorectal Cancer";}

    else if(voc1Level == 1 && voc2Level == 0.01 && voc3Level == 1 && voc4Level == 0.2 && voc5Level == 0.5 && voc6Level == 0.5 
    && voc7Level == 0.01  && voc8Level == 0.35 && voc9Level == 0.35 && voc10Level == 0.35 && voc11Level == 1.54 && voc12Level == 1.54
    && voc13Level == 0.1){currentDisease = "Ovarian Cancer";}

    else if(voc1Level == 1 && voc2Level == 0.01 && voc3Level == 0.2 && voc4Level == 0.05 && voc5Level == 1 && voc6Level == 0.5 
    && voc7Level == 0.01  && voc8Level == 0.5 && voc9Level == 0.35 && voc10Level == 0.35 && voc11Level == 1 && voc12Level == 0.0
    && voc13Level == 0.1){currentDisease = "Bladder Cancer";}

    else if(voc1Level == 1.54 && voc2Level == 0.05 && voc3Level == 1 && voc4Level == 0.05 && voc5Level == 0.5 && voc6Level == 0.35 
    && voc7Level == 0.05  && voc8Level == 0.2 && voc9Level == 0.35 && voc10Level == 0.35 && voc11Level == 0.5 && voc12Level == 1
    && voc13Level == 0.05){currentDisease = "Prostate Cancer";}

    else if(voc1Level == 1 && voc2Level == 0.05 && voc3Level == 0.7 && voc4Level == 0.05 && voc5Level == 0.35 && voc6Level == 0.35 
    && voc7Level == 0.05  && voc8Level == 0.05 && voc9Level == 0.35 && voc10Level == 0.35 && voc11Level == 0.35 && voc12Level == 0.65
    && voc13Level == 0.05){currentDisease = "Kidney Cancer";}

    else if(voc1Level == 1 && voc2Level == 0.05 && voc3Level == 0.65 && voc4Level == 0.03 && voc5Level == 0.65 && voc6Level == 0.35 
    && voc7Level == 0.05  && voc8Level == 0.35 && voc9Level == 0.35 && voc10Level == 0.35 && voc11Level == 0.7 && voc12Level == 0.65
    && voc13Level == 0.05){currentDisease = "Gastric Cancer";}

    else if(voc1Level == 1.54 && voc2Level == 0.2 && voc3Level == 1.54 && voc4Level == 0.05 && voc5Level == 0.7 && voc6Level == 0.65 
    && voc7Level == 0.05  && voc8Level == 0.35 && voc9Level == 0.35 && voc10Level == 0.1 && voc11Level == 1 && voc12Level == 1
    && voc13Level == 0.1){currentDisease = "Crohn's Disease";}

    else if(voc1Level == 1 && voc2Level == 0.01 && voc3Level == 0.03 && voc4Level == 0.05 && voc5Level == 0.01 && voc6Level == 0.35 
    && voc7Level == 0.01  && voc8Level == 0.005 && voc9Level == 0.35 && voc10Level == 0.03 && voc11Level == 0.35 && voc12Level == 0.35
    && voc13Level == 0.03){currentDisease = "Ulcerative Colitis";}

    else if(voc1Level == 0.7 && voc2Level == 0.05 && voc3Level == 0.35 && voc4Level == 0.03 && voc5Level == 0.01 && voc6Level == 0.35 
    && voc7Level == 0.01  && voc8Level == 0.05 && voc9Level == 0.35 && voc10Level == 0.05 && voc11Level == 0.35 && voc12Level == 0.35
    && voc13Level == 0.01){currentDisease = "Irritable bowel disease";}

    else if(voc1Level == 1 && voc2Level == 0.05 && voc3Level == 0.0 && voc4Level == 0.01 && voc5Level == 0.0 && voc6Level == 0.35
    && voc7Level == 0.03  && voc8Level == 0.35 && voc9Level == 0.35 && voc10Level == 0.03 && voc11Level == 1 && voc12Level == 0.35
    && voc13Level == 0.05){currentDisease = "Idiopathic Parkinson";}

    else if(voc1Level == 1 && voc2Level == 0.15 && voc3Level == 1.54 && voc4Level == 0.01 && voc5Level == 1 && voc6Level == 0.5 
    && voc7Level == 0.01  && voc8Level == 0.2 && voc9Level == 0.5 && voc10Level == 0.35 && voc11Level == 1.54 && voc12Level == 1.54
    && voc13Level == 0.05){currentDisease = "Atypical Parkinsonism";}

    else if(voc1Level == 1 && voc2Level == 0.03 && voc3Level == 1.65 && voc4Level == 0.01 && voc5Level == 0.5 && voc6Level == 0.5 
    && voc7Level == 0.05  && voc8Level == 0.2 && voc9Level == 0.5 && voc10Level == 0.35 && voc11Level == 1.54 && voc12Level == 1.54
    && voc13Level == 0.05){currentDisease = "Head and neck Cancer";}

    else if(voc1Level == 1 && voc2Level == 0.01 && voc3Level == 1.54 && voc4Level == 0.05 && voc5Level == 0.35 && voc6Level == 1.65 
    && voc7Level == 0.01  && voc8Level == 0.35 && voc9Level == 0.35 && voc10Level == 0.35 && voc11Level == 1 && voc12Level == 0.5
    && voc13Level == 0.05){currentDisease = "Multiple Sclerosis";}

    else if(voc1Level == 1 && voc2Level == 0.2 && voc3Level == 1 && voc4Level == 0.05 && voc5Level == 0.0 && voc6Level == 0.35
    && voc7Level == 0.01  && voc8Level == 0.01 && voc9Level == 0.35 && voc10Level == 0.1 && voc11Level == 0.35 && voc12Level == 1
    && voc13Level == 0.05){currentDisease = "Pulmonary Hypertension";}

    else if(voc1Level == 1 && voc2Level == 0.03 && voc3Level == 0.35 && voc4Level == 0.05 && voc5Level == 0.0 && voc6Level == 0.35
    && voc7Level == 0.01  && voc8Level == 0.01 && voc9Level == 0.35 && voc10Level == 0.05 && voc11Level == 0.35 && voc12Level == 0.65
    && voc13Level == 0.01){currentDisease = "Pre Eclampsia Toxemia";}
    else{
      currentDisease = "No Disease";
    }

    currentDiseaseStatus = Status.LOADED;
    notifyListeners();

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

  late Either<Failure, List<MapMarkerModel>> mapMarkerResponse;
  late List<MapMarkerModel> mapMarkerList;
  Status mapMarkerStatus = Status.INTIAL;
  Future getMapMarkers() async {
    mapMarkerStatus = Status.LOADING;
    notifyListeners();
    await Task(() => _homeRepository.getMapMarkers())
        .attempt()
        .mapLeftToFailure()
        .run()
        .then((result) {
      mapMarkerResponse = result as Either<Failure, List<MapMarkerModel>>;
    });
    mapMarkerStatus = Status.LOADED;
    notifyListeners();
    mapMarkerResponse.fold((l) => mapMarkerStatus = Status.ERROR, (r) {
      mapMarkerList = r;
      return mapMarkerStatus = Status.LOADED;
    });
  }

  bool _currentLocationDetermined = false;

  bool get currentLocationDetermined => _currentLocationDetermined;
  set currentLocationDetermined(bool currentLocationDetermined){
    _currentLocationDetermined = currentLocationDetermined;
    notifyListeners();
  }


}