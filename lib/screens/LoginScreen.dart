import 'package:breathalyzer_app/utils/assets.dart';
import 'package:breathalyzer_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../controllers/login_controller.dart';
import '../utils/colors.dart';
import '../utils/textstyles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(
        backgroundColor: BrandColor.drawerBackgroundColor,
        body: Consumer<LoginController>(
          builder: (context, controller, child) {
            final stack = Container(
              alignment: Alignment.topCenter,
              color: BrandColor.drawerBackgroundColor,
              child: Center(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 130),
                      child: Text(
                        "Breathalyzer App",
                        textAlign: TextAlign.center,
                        style: w600.size32,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "All your medical needs in one app",
                      textAlign: TextAlign.center,
                      style: w600.copyWith(
                          fontSize: 18, color: "#BCBCBC".fromHexToColor()),
                    ),
                    const SizedBox(
                      height: 60,
                    ),

                    SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.asset(PngAssets.loginImage),
                    ),
                    SizedBox(height: 50,),
                    Stack(
                      children: [
                        Visibility(
                          visible:
                          controller.loginState == LoginState.Initial ||
                              controller.loginState == LoginState.Loaded,
                          child: GestureDetector(
                            onTap: () {
                              controller.signIn();
                            },
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                width: 250,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          "#5A67FD".fromHexToColor(),
                                          "#568EFC".fromHexToColor()
                                        ])),
                                child: Text(
                                  "Login with BITS Mail",
                                  textAlign: TextAlign.center,
                                  style: w600.size18,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: controller.loginState == LoginState.Loading,
                          child: const Center(
                            child: SpinKitPulse(
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            );
            if (controller.loginState != LoginState.Loaded) {
              return stack;
            } else {
              return controller.loginResult.fold((failure) {
                Fluttertoast.showToast(msg: failure.message);
                return stack;
              }, (account) {
                SchedulerBinding.instance.addPostFrameCallback(
                      (_) async {

                    Fluttertoast.showToast(
                        msg: 'Welcome ${account.displayName}');

                    FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
                    if(await flutterSecureStorage.read(key: "data") == null){
                      Navigator.of(context).pushReplacementNamed(inputScreen);
                    }else{
                      Navigator.of(context).pushReplacementNamed(homeScreen);
                    }
                  },
                );
                return Container();
              });
            }
          },
        ),
      ),
    );
  }
}
