import 'dart:convert';

import 'package:GameZooApp/model/colors.dart';
import 'package:GameZooApp/model/game.dart';
import 'package:GameZooApp/model/genre.dart';
import 'package:GameZooApp/views/favourite.dart';
import 'package:GameZooApp/views/mainview.dart';
import 'package:GameZooApp/views/profile.dart';
import 'package:GameZooApp/views/search.dart';
import 'package:GameZooApp/widgets/appbar.dart';
import 'package:GameZooApp/widgets/extra.dart';
import 'package:GameZooApp/widgets/games.dart';
import 'package:GameZooApp/widgets/genres.dart';
import 'package:GameZooApp/widgets/navbar.dart';
import 'package:GameZooApp/widgets/search.dart';
import "package:flutter/material.dart";


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ValueChanged<int> onChange;
  int counter = 0;

  // View List
  static List<Widget> _widgetOptions = <Widget>[
    MainView(),
    Favourite(),
    Search(),
    Profile(),
  ];


  @override
  void initState() {
    super.initState();
    onChange = (value) {
      setState(() {
        counter = value;
      });
      print("counter: " + counter.toString());
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Primary,
      appBar: AppBar(
        backgroundColor: Primary,
        centerTitle: true,
        title: brandName(),
        elevation: 0.0,
      ),
      body: _widgetOptions.elementAt(counter),
      bottomNavigationBar: BottomNavBar(onChange),
    );
  }
}
