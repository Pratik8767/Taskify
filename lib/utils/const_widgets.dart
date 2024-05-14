import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConstWidgets {
  Text textWidget({
    required String text,
    FontWeight fontWeight = FontWeight.normal,
    required double fontSize,
    required Color color,
  }) {
    return Text(
      text,
      softWrap: true,
      style: GoogleFonts.poppins(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
      ),
    );
  }

  Text logoTextWidget(
      {required String text, required double fontSize, required Color color}) {
    return Text(text,
        style: GoogleFonts.eduQldBeginner(
            fontSize: fontSize, fontWeight: FontWeight.bold, color: color));
  }
}
