import 'dart:async';

import 'package:GameZooApp/model/colors.dart';
import 'package:GameZooApp/views/home.dart';
import 'package:GameZooApp/views/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      // 5s over, navigate to a new page
      Navigator.push(context,  PageTransition(
        curve: Curves.ease,
        type: PageTransitionType.fade,
        duration: Duration(seconds: 2),
        child: Home(),
      ));
    } );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Primary,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset('assets/splash.svg',
                          height: MediaQuery
                              .of(context)
                              .size
                              .height,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          semanticsLabel: 'Logo'),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
