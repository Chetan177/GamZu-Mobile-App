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
        TextSpan(text: 'G', style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.black87, fontWeight: FontWeight.w700, fontSize: 20))),
        TextSpan(text: 'ame ', style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.black87))),
        TextSpan(text: 'Z', style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700,fontSize: 20))),
        TextSpan(text: 'oo', style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.blue))),
      ],
    ),
  );
}