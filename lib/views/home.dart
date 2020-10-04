import 'dart:convert';

import 'package:GameZooApp/model/game.dart';
import 'package:GameZooApp/model/genre.dart';
import 'package:GameZooApp/widgets/appbar.dart';
import 'package:GameZooApp/widgets/extra.dart';
import 'package:GameZooApp/widgets/games.dart';
import 'package:GameZooApp/widgets/genres.dart';
import 'package:GameZooApp/widgets/search.dart';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();

  // Genre List
  List<GenreModel> genres = new List();

  // Game List
  List<GameModel> games = new List();

  getGenre() async {
    var response = await http.get("https://api.rawg.io/api/genres");
    // Load Response as json
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["results"].forEach((element) {
      GenreModel genreModel = new GenreModel();
      genreModel = GenreModel.fromMap(element);
      genres.add(genreModel);
    });
  }

  getPopularGames() async {
    var response = await http.get("https://api.rawg.io/api/games?page_size=20");
    // Load Response as json
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["results"].forEach((element) {
      GameModel gameModel = new GameModel();
      gameModel = GameModel.fromMap(element);
      games.add(gameModel);
    });

    // create new screen
    setState(() {});
  }

  @override
  void initState() {
    // Get genres on init
    getGenre();
    // Get games on init
    getPopularGames();
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
          child: Column(
            children: <Widget>[
              searchBar(searchController),
              getSpacing(),
              genreList(genres: genres, context: context),
              gameList(games: games, context: context),

            ],
          ),
        ),
      ),
    );
  }
}
