import 'package:GameZooApp/widgets/appbar.dart';
import 'package:GameZooApp/widgets/search.dart';
import "package:flutter/material.dart";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF212121),
        appBar: AppBar(
          backgroundColor: Color(0xFF212121),
          centerTitle: true,
          title: brandName(),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(children: <Widget>[
              searchBar(searchController),
            ]),
          ),
        ));
  }
}
