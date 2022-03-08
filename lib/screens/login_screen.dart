import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_login_signin/widgets/app_name_title.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kIsWeb ? null : AppBar(
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
    );
  }

  Widget _loginUI(){
    return Container(
      color: Colors.amberAccent,
    );
  }
}