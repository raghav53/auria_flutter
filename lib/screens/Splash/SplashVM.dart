import 'dart:async';
import 'dart:convert';

import 'package:auria_ai/screens/Home/HomeScreen.dart';
import 'package:auria_ai/utils/all_keys.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apis/api_controller.dart';
import '../../utils/common.dart';
import '../Onboarding/OnBoardingScreen.dart';
import '../SignUp/SignUpModel.dart';

class SplashVM {


  nextScreen(BuildContext context) {
    Timer(const Duration(seconds: 3), () => nextPage(context));
  }

  nextPage(BuildContext context) async {
    SharedPreferences srf = await SharedPreferences.getInstance();
    
    if(srf.getString(AllKeys.auth) == null || srf.getString(AllKeys.auth) == ""){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> OnBoardingScreen()), (route) => false);
    }else{
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>
          HomeScreen()), (route) => false);
    }

  }

  profile(BuildContext context) async {
    SharedPreferences srf = await SharedPreferences.getInstance();

    if(srf.getString(AllKeys.auth) == null || srf.getString(AllKeys.auth) == ""){

    }else{

        SharedPreferences srf = await SharedPreferences.getInstance();
        String res = await getMethodWithQuery("GET", "${AllKeys.getProfile}?user_id=${srf.getString(AllKeys.userID)}", null, context);

        var response = jsonDecode(res);

        signUpModel = SignUpModel.fromJson(response);
        if(signUpModel.code == 200){

        }else{

        }



    }

  }

}
