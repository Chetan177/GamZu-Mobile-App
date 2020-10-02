import 'package:flutter/material.dart';

Widget searchBar(TextEditingController searchController) {
  return Container(
    decoration: BoxDecoration(
        color: Color(0xfff5f8fd), borderRadius: BorderRadius.circular(30)),
    padding: EdgeInsets.symmetric(horizontal: 24),
    margin: EdgeInsets.symmetric(horizontal: 24),
    child: Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
                hintText: "search game", border: InputBorder.none),
          ),
        ),
        InkWell(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => Search(
            //               searchQuery: searchController.text,
            //             )));
          },
          child: Container(child: Icon(Icons.search)),
        ),
      ],
    ),
  );
}
