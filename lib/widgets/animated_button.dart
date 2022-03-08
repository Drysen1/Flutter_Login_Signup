import 'package:flutter/material.dart';

class AnimatedButton extends StatelessWidget {
  final double height;
  final Color color;
  final Function onTap;
  final String text;
  final Duration duration;
  const AnimatedButton({ Key? key, required this.height, required this.color, 
                          required this.onTap, required this.text, 
                          required this.duration }) : super(key: key);

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
            child: Text(text),
          ),
        ),
        onTap: () { onTap(); }
      ),
    );
  }
}