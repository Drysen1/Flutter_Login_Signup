import 'package:flutter/material.dart';
import 'package:flutter_login_signin/widgets/bungee_text.dart';

class BungeeButton extends StatelessWidget {
  final String text;
  const BungeeButton({ Key? key, required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.fromLTRB(22, 20, 22, 20),
        primary: Colors.pinkAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )
      ),
      onPressed: () {},
      child: BungeeText(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        text: text,
      )
    );
  }
}