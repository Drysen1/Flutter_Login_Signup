import 'package:flutter/material.dart';
import 'package:flutter_login_signin/enum/start_button_press.dart';
import 'package:flutter_login_signin/screens/login_screen.dart';
import 'package:flutter_login_signin/screens/sign_up_screen.dart';
import 'package:flutter_login_signin/widgets/animated_button.dart';
import 'package:flutter_login_signin/widgets/app_name_title.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  double _loginButtonHeight = 0;
  double _signUpButtonHeight = 0;
  double _initialHeight = 0;
  StartButtonPress _startButtonPress = StartButtonPress.initial;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kIsWeb ? null : AppBar(
          title: const AppNameTitle(text: "The App", fontSize: 32),
          elevation: 0,
          backgroundColor: Colors.pinkAccent),
      body: _mainUI(),
    );
  }



  Widget _mainUI() {
    var size = MediaQuery.of(context).size;
    return size.width > 1000 ? 
      _bigSreenLayout() :
      _smallScreenLayout();
  }

  Widget _bigSreenLayout(){
    return Row(
      children: [
        Expanded(child: _bigScreenTitle()),
        Expanded(child: _startButtons())
      ]
    );
  }

  Widget _bigScreenTitle(){
    return Container(
      color: Colors.pinkAccent,
      child: const Center(
        child: AppNameTitle(
          fontSize: 80,
          text: "The App"
          )
      ),
    );
  }

  Widget _smallScreenLayout(){
    return _startButtons();
  }

  Widget _startButtons(){
    return LayoutBuilder(
      builder: (context, constraints) {   
        _setInitialHeight(constraints.biggest.height);
        return Column(
          children: [
            _loginButton(),
            _signUpButton()
          ],
        );
      },
    );
  }

  Widget _loginButton(){
    return AnimatedButton(
      height: _loginButtonHeight, 
      color: Colors.amberAccent,
      text: "Login",
      fontSize: 32,
      duration: const Duration(milliseconds: 350),
      onTap: () {
        setState(() {
          _startButtonPress = StartButtonPress.login;
          _setButtonHeights();
        });
        },
      onEnd: () async {
        await _navigateToLoginScreen();
      },
    );
  }

  Widget _signUpButton(){
   return AnimatedButton(
      height: _signUpButtonHeight, 
      color: Colors.greenAccent,
      text: "Sign up",
      fontSize: 32,
      duration: const Duration(milliseconds: 350),
      onTap: () {
        setState(() {
          _startButtonPress = StartButtonPress.signUp;
          _setButtonHeights();
        });
      },
      onEnd: () async {
        await _navigateToSignUpScreen();
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

  void _setButtonHeights(){
    switch(_startButtonPress){
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

  Future _navigateToLoginScreen() async{
    if(_startButtonPress == StartButtonPress.login){
      await Navigator.of(context).push(PageRouteBuilder(
          opaque: false,
          pageBuilder: (context, animation, secondaryAnimation) => const LoginScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transitionsBuilder:
            (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
            curve: Curves.easeIn, 
            parent: animation);
            return FadeTransition(
              opacity:animation,
              child: child,
            );
          }
        )
      ); 
    }
  }

  Future _navigateToSignUpScreen() async{
    if(_startButtonPress == StartButtonPress.signUp){
      await Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, animation, secondaryAnimation) => const SignUpScreen(),
        transitionDuration: const Duration(milliseconds: 250),
        transitionsBuilder:
          (context, animation, anotherAnimation, child) {
          animation = CurvedAnimation(
          curve: Curves.easeIn, 
          parent: animation);
          return FadeTransition(
            opacity:animation,
            child: child,
          );
        }
      )
    );
    }
  }
}
