import 'package:flutter/material.dart';
import 'package:flutter_login_signin/widgets/bungee_text.dart';
import 'package:google_fonts/google_fonts.dart';

class BungeeTextfield extends StatelessWidget {
  final String labelText;
  final bool isPassword;
  const BungeeTextfield({ Key? key, required this.labelText, 
                  required this.isPassword }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        label: BungeeText(
          text: labelText,
          fontSize: 20,
          fontWeight: FontWeight.normal,
        )
      ),
      style: _textStyle(),
    );
  }

  TextStyle _textStyle(){
    return GoogleFonts.bungee(
      color: Colors.black87,
      fontSize: 20,
      fontWeight: FontWeight.normal,
    );
  }
}