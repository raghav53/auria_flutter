import 'dart:async';
import 'dart:convert';

import 'package:auria_ai/screens/Home/HomeScreen.dart';
import 'package:auria_ai/utils/all_keys.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apis/api_controller.dart';
import '../../utils/common.dart';
import '../../utils/user_preference.dart';
import '../Onboarding/OnBoardingScreen.dart';
import '../SignUp/SignUpModel.dart';

class SplashVM {


  void firebaseToken() {
    FirebaseMessaging.instance.getToken().then((value) {
      token = value.toString();
      print("FCMTOKEM+++++ $token");
    });
  }


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
        UserPreference.shared.setUserData(signUpModel);
        UserPreference.shared.setLoggedIn(true);
    }

  }

}
