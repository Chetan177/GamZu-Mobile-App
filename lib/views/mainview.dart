import 'dart:convert';
import 'package:GameZooApp/model/game.dart';
import 'package:GameZooApp/model/genre.dart';
import 'package:GameZooApp/views/search.dart';
import 'package:GameZooApp/widgets/extra.dart';
import 'package:GameZooApp/widgets/games.dart';
import 'package:GameZooApp/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
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
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    // Get genres on init
    getGenre();
    // Get games on init
    getPopularGames();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            searchBar(searchController, context),
            getSpacing(), // genreList(genres: genres, context: context),
            gameList(games: games, context: context),
          ],
        ),
      ),
    );
  }
}
