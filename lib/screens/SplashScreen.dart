import 'dart:async';

import 'package:breathalyzer_app/screens/InputScreen.dart';
import 'package:breathalyzer_app/utils/assets.dart';
import 'package:breathalyzer_app/utils/colors.dart';
import 'package:breathalyzer_app/utils/constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {

  late Timer _timer;
  int _start = 2;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec, (Timer timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
        });
        Navigator.pushReplacementNamed(context, inputScreen);
      } else {
        setState(() {
          _start--;
        });
      }
    },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.drawerBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              child: Container(
                child: Image.asset(PngAssets.splashImage,),
              ),
            ),
          )
        ],
      ),
    );
  }
}
