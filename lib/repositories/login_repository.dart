import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:breathalyzer_app/utils/custom_http_client.dart';
import 'package:breathalyzer_app/utils/failure.dart';

class LoginRepository {
  final GoogleSignIn _googleSignIn;
  final FlutterSecureStorage _secureStorage;
  final CustomHttpClient _customHttpClient;

  late String? idTokenGoogle;
  late String? studentId;

  LoginRepository(
      this._secureStorage, this._customHttpClient, this._googleSignIn);

  Future<bool> logout() async {
    try {
      await _secureStorage.deleteAll();
      await _googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      if (kDebugMode) {
        print("Error occured while signing out ${e.toString()}");
      }
      return false;
    }
  }



  Future<dynamic> signInWithGoogle() async {
    final FirebaseAuth firebaseauth = FirebaseAuth.instance;
    GoogleSignInAccount? account;
    try {
      account = await _googleSignIn.signIn();
      if (account == null) {
        throw Failure('Signing was aborted');
      } else {
        GoogleSignInAuthentication auth = await account.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: auth.accessToken,
          idToken: auth.idToken,
        );

        final UserCredential userCredential = await firebaseauth.signInWithCredential(credential);
        User? user = userCredential.user;
        idTokenGoogle = auth.idToken;
        if (kDebugMode) {
          print("id token is $idTokenGoogle");
        }
        _secureStorage.write(key: 'UUID', value: user!.uid);
        return account;
      }
    } on PlatformException catch (error) {
      if (error.code == 'network_error') {
        throw Failure('Not connected to internet');
      }
    } catch (unexpectedError) {
      await _googleSignIn.signOut();
      throw Failure('An unexpected error has occurred ($unexpectedError)');
    }
  }
}
