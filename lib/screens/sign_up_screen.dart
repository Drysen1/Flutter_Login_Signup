import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login_signin/widgets/app_name_title.dart';
import 'package:flutter_login_signin/widgets/bungee_button.dart';
import 'package:flutter_login_signin/widgets/bungee_text.dart';
import 'package:flutter_login_signin/widgets/bungee_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with TickerProviderStateMixin {
  late AnimationController _titleController;
  late AnimationController _emailController;
  late AnimationController _usernameController;
  late AnimationController _passwordController;
  late AnimationController _buttonController;
  late Animation<double> _titleAnimation;
  late Animation<double> _emailAnimation;
  late Animation<double> _usernameAnimation;
  late Animation<double> _passwordAnimation;
  late Animation<double> _buttonAnimation;

  @override
  void initState() {
    super.initState();

      _titleController = _animationController(700);
      _emailController = _animationController(800);
      _usernameController = _animationController(900);
      _passwordController = _animationController(1000);
      _buttonController = _animationController(1100);

      _titleAnimation = CurvedAnimation(parent: _titleController, curve: Curves.easeInToLinear);
      _emailAnimation = CurvedAnimation(parent: _emailController, curve: Curves.easeInToLinear);
      _usernameAnimation = CurvedAnimation(parent: _usernameController, curve: Curves.easeInToLinear);
      _passwordAnimation = CurvedAnimation(parent: _passwordController, curve: Curves.easeInToLinear);
      _buttonAnimation = CurvedAnimation(parent: _buttonController, curve: Curves.easeInToLinear);
  
      _titleController.forward();
      _emailController.forward();
      _usernameController.forward();
      _passwordController.forward();
      _buttonController.forward();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: size.width > 1000 ? null : AppBar(
          title: const AppNameTitle(text: "The App", fontSize: 32),
          elevation: 0,
          backgroundColor: Colors.pinkAccent),
      backgroundColor: Colors.transparent,
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
        Expanded(child: _signUpUI())
      ]
    );
  }

  Widget _smallScreenLayout(){
    return _signUpUI();
  }


  Widget _bigScreenTitle(){
    return Container(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.pinkAccent,
        onTap: () {
          Navigator.pop(context);
        },
      )
    );
  }


  Widget _signUpUI(){
    return Container(
      color: Colors.greenAccent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _title(),
            const SizedBox(height: 20,),
            _emailText(),
            const SizedBox(height: 10),
            _usernameText(),
            const SizedBox(height: 10,),
            _passwordText(),
            const SizedBox(height: 30,),
            _loginButton()
          ],
        ),
      ),
    );
  }

  Widget _title(){
    return FadeTransition(
      opacity: _titleAnimation,
      child: const BungeeText(
        text: "Sign Up", 
        fontSize: 48, 
        fontWeight: FontWeight.bold
      ),
    );
  }

  Widget _emailText(){
    return FadeTransition(
      opacity: _emailAnimation,
      child: const SizedBox(
        width: 340,
        child: BungeeTextfield(
          labelText: "Email", 
          isPassword: false
        ),
      ),
    );
  }

  Widget _usernameText(){
    return FadeTransition(
      opacity: _usernameAnimation,
      child: const SizedBox(
        width: 340,
        child: BungeeTextfield(
          labelText: "Username", 
          isPassword: false
        ),
      ),
    );
  }

  Widget _passwordText(){
    return FadeTransition(
      opacity: _passwordAnimation,
      child: const SizedBox(
        width: 340,
        child: BungeeTextfield(
          labelText: "Password", 
          isPassword: true
        ),
      ),
    );
  }

  Widget _loginButton(){
    return FadeTransition(
      opacity: _buttonAnimation,
      child: const SizedBox(
        width: 340,
        child: BungeeButton(
          text: "Sign Up",
        )
      ),
    );
  }

  AnimationController _animationController(int milliseconds){
    return AnimationController(
      duration: Duration(milliseconds: milliseconds),
      vsync: this,
      value: 0,
      lowerBound: 0,
      upperBound: 1
    );
  }
}