import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BungeeText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  const BungeeText({ Key? key, required this.text, required this.fontSize, 
                    required this.fontWeight }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.bungee(
        color: Colors.black87,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}