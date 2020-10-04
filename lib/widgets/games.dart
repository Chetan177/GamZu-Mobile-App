import 'package:GameZooApp/model/game.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget gameList({List<GameModel> games, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: games.map((game) {
        return GridTile(
          child: GestureDetector(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(
              //     builder: (context) => ImageView(
              //         ImageURL : game.src.portrait
              //     )
              // ));
            },
            child: Hero(
              tag: game.backgroundImg,
              child: Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      imageUrl: game.backgroundImg,
                      fit: BoxFit.cover,
                    ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
