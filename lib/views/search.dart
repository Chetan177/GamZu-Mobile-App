import 'dart:convert';
import 'package:GameZooApp/widgets/appbar.dart';
import 'package:GameZooApp/widgets/extra.dart';
import 'package:GameZooApp/widgets/games.dart';
import 'package:GameZooApp/widgets/search.dart';
import 'package:http/http.dart' as http;
import 'package:GameZooApp/model/colors.dart';
import 'package:GameZooApp/model/game.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  final String searchQuery;

  Search({this.searchQuery});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // Game List
  List<GameModel> games = new List();

  TextEditingController searchController = new TextEditingController();

  getSearchGames(String query) async {
    var response = await http
        .get("https://api.rawg.io/api/games?page_size=20&search=$query");

    // Load Response as json
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["results"].forEach((element) {
      GameModel gameModel = new GameModel();
      gameModel = GameModel.fromMap(element);
      games.add(gameModel);
    });
    print(games[0].backgroundImg);
    // create new screen
    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();

    getSearchGames(widget.searchQuery);
    searchController.text = widget.searchQuery;

  }

  // TODO fix search
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Primary,
        centerTitle: true,
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              searchBar(searchController, context),
              getSpacing(),
              gameList(games: games, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
