import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


Widget brandName() {
  return  RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      children: <TextSpan>[
        TextSpan(text: 'G', style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20))),
        TextSpan(text: 'am', style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.white))),
        TextSpan(text: 'Z', style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.w700,fontSize: 20))),
        TextSpan(text: 'u', style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.pinkAccent))),
      ],
    ),
  );
}