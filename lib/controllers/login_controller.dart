// ignore: import_of_legacy_library_into_null_safe
import 'package:breathalyzer_app/utils/functions.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../repositories/login_repository.dart';
import '../utils/failure.dart';

enum LoginState { Initial, Loading, Loaded }

class LoginController with ChangeNotifier {
  final LoginRepository _loginRepository;
  late LoginState loginState;
  late Either<Failure, dynamic> loginResult;

  LoginController(this._loginRepository) {
    loginState = LoginState.Initial;
    notifyListeners();
  }

  void signIn() async {
    loginState = LoginState.Loading;
    notifyListeners();
    await Task(() => _loginRepository.signInWithGoogle())
        .attempt()
        .mapLeftToFailure()
        .run()
        .then((result) {
      loginResult = result;
      notifyListeners();
    });
    loginState = LoginState.Loaded;
    notifyListeners();
  }

  Future<bool> logout() async {
    bool isLoggedOut = await _loginRepository.logout();
    return isLoggedOut;
  }
}
