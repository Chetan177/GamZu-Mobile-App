import "package:flutter/material.dart";
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFF212121), boxShadow: [
        BoxShadow(blurRadius: 20, color: Color(0xFF212121).withOpacity(.1))
      ]),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
              gap: 8,
              activeColor: Colors.pinkAccent,
              iconSize: 20,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              duration: Duration(milliseconds: 800),
              tabBackgroundColor: Colors.grey[800],
              tabs: [
                GButton(
                  iconColor: Colors.white70,
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  iconColor: Colors.white70,
                  icon: LineIcons.heart_o,
                  text: 'Likes',
                ),
                GButton(
                  iconColor: Colors.white70,
                  icon: LineIcons.search,
                  text: 'Search',
                ),
                GButton(
                  iconColor: Colors.white70,
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              }),
        ),
      ),
    );
  }
}
