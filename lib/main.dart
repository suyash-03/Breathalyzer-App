import 'package:breathalyzer_app/repositories/login_repository.dart';
import 'package:breathalyzer_app/screens/HomeScreen.dart';
import 'package:breathalyzer_app/screens/InputScreen.dart';
import 'package:breathalyzer_app/screens/LoginScreen.dart';
import 'package:breathalyzer_app/screens/SplashScreen.dart';
import 'package:breathalyzer_app/utils/constants.dart';
import 'package:breathalyzer_app/utils/custom_http_client.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'controllers/home_controller.dart';
import 'controllers/login_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  await Firebase.initializeApp();
  final CustomHttpClient _customHttpClient = CustomHttpClient(testBaseUrl, Client());
  GoogleSignIn _googleSignIn = GoogleSignIn();

  LoginRepository _loginRepository = LoginRepository(
    _secureStorage,
    _customHttpClient,
    _googleSignIn,
  );
  String? res = await _secureStorage.read(key: 'UUID');
  print(res);
  if (await _secureStorage.read(key: 'UUID') == null) {
    //Not logged in
    runApp(MyApp(
        initialRoute: loginScreen,
        loginRepository: _loginRepository,
        flutterSecureStorage: _secureStorage,));
  } else {
    //If logged in
    runApp(
      MyApp(
          initialRoute: splashScreen,
          loginRepository: _loginRepository,
          flutterSecureStorage: _secureStorage,),
    );
  }
}

class MyApp extends StatefulWidget {
  final String initialRoute;
  final LoginRepository loginRepository;
  final FlutterSecureStorage flutterSecureStorage;

  MyApp(
      {required this.initialRoute,
        required this.loginRepository,
        required this.flutterSecureStorage,
      });

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  late LoginController _loginController;
  late HomeController _homeController;




  @override
  void initState() {

    _loginController = LoginController(widget.loginRepository);
    _homeController = HomeController();
    super.initState();
  }

  @override
  void dispose() {
    _loginController.dispose();
    _homeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Breathalyzer App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          darkTheme: ThemeData.dark(),
          initialRoute: widget.initialRoute,
          routes: {
            homeScreen: (_) {
              return MultiProvider(
                providers: [
                  ChangeNotifierProvider.value(value: _loginController),
                ],
                child: const HomeScreen(),
              );
            },
            loginScreen: (_) {
              return MultiProvider(
                providers: [
                  ChangeNotifierProvider.value(value: _loginController),
                ],
                child: const LoginScreen(),
              );
            },
            splashScreen: (_) {
              return const SplashScreen();
            },
            inputScreen: (_){
              return const InputScreen();
            }
          }),
    );
  }
}