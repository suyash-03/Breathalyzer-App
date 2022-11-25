import 'package:breathalyzer_app/models/profile_model.dart';
import 'package:breathalyzer_app/repositories/home_repository.dart';
import 'package:breathalyzer_app/utils/failure.dart';
import 'package:breathalyzer_app/utils/status.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:breathalyzer_app/utils/functions.dart';


class HomeController with ChangeNotifier{
  final HomeRepository _homeRepository;

  late Either<Failure,ProfileModel> profileResult;

  HomeController(this._homeRepository);
  late ProfileModel profileModel;
  Status profileState = Status.INTIAL;
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


}