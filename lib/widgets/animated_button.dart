import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedButton extends StatelessWidget {
  final double height;
  final Color color;
  final Function onTap;
  final String text;
  final Duration duration;
  final double fontSize;
  final Function onEnd;
  const AnimatedButton({ Key? key, required this.height, required this.color, 
                          required this.onTap, required this.text, 
                          required this.duration, required this.fontSize, 
                          required this.onEnd }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: double.infinity,
      height: height,
      duration: duration,
      child: InkWell(
        splashColor: Colors.pinkAccent,
        child: Ink(
          color: color,
          child: Center(
            child: _buttonText(),
          ),
        ),
        onTap: () { onTap(); }
      ),
      onEnd: () { onEnd(); },
    );
  }

  Widget _buttonText(){
    return Text(
      text,
      style: GoogleFonts.bungee(
        color: Colors.black87,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}