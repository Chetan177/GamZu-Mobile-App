import 'package:GameZooApp/views/search.dart';
import 'package:flutter/material.dart';

Widget searchBar(TextEditingController searchController, context) {
  return Material(
    color: Colors.transparent,
    child: Container(
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

          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Search(
                            searchQuery: searchController.text,
                          )));
            },
            child: Container(
              child: Icon(
                Icons.search,
                color: Colors.pinkAccent,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
