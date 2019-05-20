import 'package:flutter/material.dart';
import 'package:sns_connect/src/widgets/background.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Background(
      child: Center(
          child: Image.asset("lib/assets/images/tene-logo.png", width: (screenWidth*0.5), height: (screenHeight*0.3),)
      ),
    );
  }
}