import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.red,
      title: "eDICE",
      home: PreHomeScreen(),
    ),
  );
}

class PreHomeScreen extends StatefulWidget {
  @override
  _PreHomeScreenState createState() => _PreHomeScreenState();
}

class _PreHomeScreenState extends State<PreHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      navigateAfterSeconds: HOMEScreen(),
      seconds: 5,
      backgroundColor: Color(0xFFE63946),
      title: Text(
        "eDICE",
        style: GoogleFonts.yatraOne(
          color: Color(0xFFF1FAEE),
          fontSize: 64,
          fontWeight: FontWeight.bold,
        ),
      ),
      loaderColor: Color(0xFFF1FAEE),
    );
  }
}

class HOMEScreen extends StatefulWidget {
  @override
  _HOMEScreenState createState() => _HOMEScreenState();
}

class _HOMEScreenState extends State<HOMEScreen> {
  var leftDiceNumber = 1;
  var rightDiceNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE63946),
      appBar: AppBar(
        elevation: 16,
        shadowColor: Colors.redAccent,
        backgroundColor: Color(0xFFE63946),
        centerTitle: true,
        title: Text(
          "eDICE",
          style: GoogleFonts.yatraOne(),
        ),
        leading: Icon(
          FontAwesome5.dice_five,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Expanded(
                  flex: 1,
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent),
                      enableFeedback: true,
                    ),
                    onLongPress: () {
                      HapticFeedback.vibrate();
                    },
                    onPressed: () {
                      HapticFeedback.mediumImpact();
                      setState(
                        () {
                          leftDiceNumber = Random.secure().nextInt(6) + 1;
                        },
                      );
                    },
                    child: Image(
                      image: AssetImage(
                        "assets/images/dice$leftDiceNumber.png",
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                child: Expanded(
                  flex: 1,
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent),
                      enableFeedback: true,
                    ),
                    onLongPress: () {
                      HapticFeedback.vibrate();
                    },
                    onPressed: () {
                      HapticFeedback.mediumImpact();
                      setState(
                        () {
                          rightDiceNumber = Random.secure().nextInt(6) + 1;
                        },
                      );
                    },
                    child: Image(
                      image: AssetImage(
                        "assets/images/dice$rightDiceNumber.png",
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
