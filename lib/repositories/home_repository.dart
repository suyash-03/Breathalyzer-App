import 'package:breathalyzer_app/models/profile_model.dart';
import 'package:breathalyzer_app/utils/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../utils/custom_http_client.dart';

class HomeRepository{
  final CustomHttpClient _customHttpClient;
  final FlutterSecureStorage _flutterSecureStorage;
  HomeRepository(this._customHttpClient,this._flutterSecureStorage);

  Future<ProfileModel> getUserProfile() async{
    try{
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User user = auth.currentUser!;
      print("GHSDS");
      ProfileModel profileModel = ProfileModel(name: user.displayName!, imageUrl: user.photoURL!);
      return profileModel;
    }catch(e){
      throw Failure("Some Error Occurred");
    }
  }
}