import 'package:flutter/material.dart';
import 'package:flutter_login_signin/enum/startbuttonenum.dart';
import 'package:flutter_login_signin/widgets/animated_big_button.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  double _loginButtonHeight = 0;
  double _signUpButtonHeight = 0;
  double _initialHeight = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "THE APP",
            style: TextStyle(
              color: Colors.black87
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.pinkAccent),
      body: _mainUI(),
    );
  }

  Widget _mainUI() {
    return LayoutBuilder(
      builder: (context, constraints) {        
        _initialHeight = constraints.biggest.height;
        _setButtonHeights(StartButtonEnum.initial);
        return Column(
          children: [
            AnimatedBigButton(
              height: _loginButtonHeight, 
              color: Colors.amberAccent,
              text: "Login",
              onTap: () {
                setState(() {
                  _setButtonHeights(StartButtonEnum.login);
                });
                },
              ),
            AnimatedBigButton(
              height: _signUpButtonHeight, 
              color: Colors.greenAccent,
              text: "Sign up",
              onTap: () {
                setState(() {
                  _setButtonHeights(StartButtonEnum.signup);
                });
              },
            ),
          ],
        );
      },
    );
  }

  void _setButtonHeights(StartButtonEnum buttonState){
    switch(buttonState){
      case StartButtonEnum.login: {
        _loginButtonHeight = _loginButtonHeight * 2;
        _signUpButtonHeight = _signUpButtonHeight - _signUpButtonHeight; 
      }
      break;
      case StartButtonEnum.signup: {
        _loginButtonHeight = _loginButtonHeight - _loginButtonHeight;
        _signUpButtonHeight = _signUpButtonHeight * 2;  
      }
      break;
      case StartButtonEnum.initial:
      default: {
        if(_loginButtonHeight <= 0 && _signUpButtonHeight <= 0) {
          _loginButtonHeight = _initialHeight / 2;
          _signUpButtonHeight = _initialHeight / 2;
        }
      }
    }
  }
}
