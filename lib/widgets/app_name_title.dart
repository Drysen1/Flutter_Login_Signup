import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppNameTitle extends StatelessWidget {
  final String text;
  final double fontSize;
  const AppNameTitle({ Key? key, required this.text, required this.fontSize }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lobster(
        color: Colors.black87,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(5, 5),
            blurRadius: 15),
        ]
      ),
    );
  }
}