
import 'package:flutter/material.dart';

import '../Welcome/WelcomeScreen.dart';

class OnBoardingVM{

  var pageController = PageController();
  var isLast = false;

  nextPage(BuildContext context){
    return (!isLast)?pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut):skipClick(context);
  }

  void skipClick(BuildContext context) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const WelcomeScreen()), (route) => false);
  }

}