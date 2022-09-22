import 'package:flutter/material.dart';
import 'package:flunkey/logIn.dart';
import 'package:flunkey/homePage.dart';

class CurrentState extends StatelessWidget{

  bool state=false;

   CurrentState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(state){
      return const HomePage();
    }else{
      return const LogIn();
    }
  }
}