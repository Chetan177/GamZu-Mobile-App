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
  List<GameModel> searchGames = new List();

  TextEditingController searchController = new TextEditingController();

  getSearchGames(String query) async {
    print(query);
    searchGames.clear();
    var response = await http
        .get("https://api.rawg.io/api/games?page_size=20&search=$query");

    // Load Response as json
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["results"].forEach((element) {
      GameModel gameModel = new GameModel();
      gameModel = GameModel.fromMap(element);
      if(gameModel.backgroundImg != null){
        searchGames.add(gameModel);
      }
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

    getSearchGames(widget.searchQuery);
    super.initState();
    searchController.text = widget.searchQuery;
    super.initState();
  }

  // TODO fix search
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.20),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24),
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            hintText: "Search game",
                            hintStyle: TextStyle(
                              color: Colors.white70.withOpacity(.5),
                            ),
                            border: InputBorder.none,
                            hoverColor: Colors.pinkAccent),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        getSearchGames(searchController.text);
                      },

                        child: Container(
                          child: Icon(
                            Icons.search,
                            color: Colors.pinkAccent,
                          ),
                        )
                    ),
                  ],
                ),

              ),
              getSpacing(),
              gameList(games: searchGames, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
