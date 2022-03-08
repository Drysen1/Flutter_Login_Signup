import 'package:flutter/material.dart';
import 'package:flutter_login_signin/widgets/app_name_title.dart';
import 'package:flutter_login_signin/widgets/bungee_button.dart';
import 'package:flutter_login_signin/widgets/bungee_text.dart';
import 'package:flutter_login_signin/widgets/bungee_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin {
  late AnimationController _titleController;
  late AnimationController _usernameController;
  late AnimationController _passwordController;
  late AnimationController _buttonController;
  late Animation<double> _titleAnimation;
  late Animation<double> _usernameAnimation;
  late Animation<double> _passwordAnimation;
  late Animation<double> _buttonAnimation;

  @override
  void initState() {
    super.initState();

      _titleController = _animationController(1000);
      _usernameController = _animationController(1100);
      _passwordController = _animationController(1200);
      _buttonController = _animationController(1300);

      _titleAnimation = CurvedAnimation(parent: _titleController, curve: Curves.easeInCubic);
      _usernameAnimation = CurvedAnimation(parent: _usernameController, curve: Curves.easeInCubic);
      _passwordAnimation = CurvedAnimation(parent: _passwordController, curve: Curves.easeInCubic);
      _buttonAnimation = CurvedAnimation(parent: _buttonController, curve: Curves.easeInCubic);
  
      _titleController.forward();
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
        Expanded(child: _loginUI())
      ]
    );
  }

  Widget _smallScreenLayout(){
    return _loginUI();
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

  Widget _loginUI(){
    return Container(
      color: Colors.amberAccent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _title(),
            const SizedBox(height: 20,),
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
        text: "Login", 
        fontSize: 48, 
        fontWeight: FontWeight.bold
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
          text: "Login",
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