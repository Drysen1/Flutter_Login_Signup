import 'package:flutter/material.dart';
import 'package:flutter_login_signin/enum/startButtonPress.dart';
import 'package:flutter_login_signin/widgets/animated_button.dart';

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
        _setInitialHeight(constraints.biggest.height);
        return Column(
          children: [
            AnimatedButton(
              height: _loginButtonHeight, 
              color: Colors.amberAccent,
              text: "Login",
              duration: const Duration(milliseconds: 400),
              onTap: () {
                setState(() {
                  _setButtonHeights(StartButtonPress.login);
                });
                },
              ),
            AnimatedButton(
              height: _signUpButtonHeight, 
              color: Colors.greenAccent,
              text: "Sign up",
              duration: const Duration(milliseconds: 400),
              onTap: () {
                setState(() {
                  _setButtonHeights(StartButtonPress.signUp);
                });
              },
            ),
          ],
        );
      },
    );
  }

  void _setInitialHeight(double height){
    if(_initialHeight == 0){
      _initialHeight = height;
      _loginButtonHeight = _initialHeight / 2;
      _signUpButtonHeight = _initialHeight / 2;
    }
  }

  void _setButtonHeights(StartButtonPress buttonPressType){
    switch(buttonPressType){
      case StartButtonPress.login: {
        if(_loginButtonHeight <= _initialHeight){
          _loginButtonHeight = _loginButtonHeight * 2;
          _signUpButtonHeight = _signUpButtonHeight - _signUpButtonHeight;
        }
      }
      break;
      case StartButtonPress.signUp: {
        if(_signUpButtonHeight <= _initialHeight){
          _loginButtonHeight = _loginButtonHeight - _loginButtonHeight;
          _signUpButtonHeight = _signUpButtonHeight * 2;
        }
      }
      break;
      default: {
        _loginButtonHeight = _initialHeight / 2;
        _signUpButtonHeight = _initialHeight / 2;
      }
    }
  }
}
