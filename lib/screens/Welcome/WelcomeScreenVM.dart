import 'package:auria_ai/screens/Login/LoginScreen.dart';
import 'package:auria_ai/screens/SignUp/SignUpScreen.dart';
import 'package:flutter/material.dart';

class WelcomeScreenVM with ChangeNotifier{

  void clickEmail(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
  }

  void clickApple(BuildContext context) {

  }

  void clickGmail(BuildContext context) {


  }

  void clickSignIn(BuildContext context) {

    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));

  }



}