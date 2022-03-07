import 'package:flutter/material.dart';

class AnimatedBigButton extends StatelessWidget {
  final double height;
  final Color color;
  final Function onTap;
  final String text;
  const AnimatedBigButton({ Key? key, required this.height, required this.color, 
                          required this.onTap, required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: double.infinity,
      height: height,
      duration: const Duration(milliseconds: 600),
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