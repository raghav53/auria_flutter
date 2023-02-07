import 'dart:convert';
import 'dart:io';

import 'package:auria_ai/apis/api_controller.dart';
import 'package:auria_ai/screens/Home/HomeScreen.dart';
import 'package:auria_ai/screens/Login/LoginScreen.dart';
import 'package:auria_ai/screens/SignUp/SignUpScreen.dart';
import 'package:auria_ai/utils/all_keys.dart';
import 'package:auria_ai/utils/common.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../SignUp/SignUpModel.dart';

class WelcomeScreenVM with ChangeNotifier{

  void clickEmail(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
  }

  void clickApple(BuildContext context) {

  }

  void clickGmail(BuildContext context) {

    googleSignup(context);

  }

  void clickSignIn(BuildContext context) {

    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));

  }


  Future<void> googleSignup(BuildContext context) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;
      if (result != null) {
        socialLogin(user,context);
      }else{
        showError("Something wrong");
      }
    }
  }


  Future<void> socialLogin(User? user,BuildContext context) async {
    showLoader(context);

    List<String> name = user!.displayName.toString().split(" ");

    var device_type = "1";

    if (Platform.isAndroid) {
      device_type = "1";
    }
    else if (Platform.isIOS) {
      device_type = "2";
    }

    Map<String,String> map = {
      "social_id":user.uid,
      "social_type":"1",
      "first_name":name[0],
      "last_name":name[1],
      "email":user.email.toString(),
      "device_type": device_type,
      "device_token":token,
    };

    print("JHIJKHKJ$map");

    SharedPreferences srf = await SharedPreferences.getInstance();
    String res = await postMethod("POST", AllKeys.socialLogin, map, null, context);

    var response = jsonDecode(res);

    signUpModel = SignUpModel.fromJson(response);
    hideLoader(context);
    if(signUpModel.code == 200){
      srf.setString(AllKeys.auth, signUpModel.body!.authorization.toString());
      srf.setString(AllKeys.userID, signUpModel.body!.id.toString());
      srf.setString(AllKeys.userFirstName, signUpModel.body!.firstName.toString());
      srf.setString(AllKeys.userLastName, signUpModel.body!.lastName.toString());
      srf.setString(AllKeys.userEmail, signUpModel.body!.email.toString());

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const HomeScreen()), (route) => false);

    }else{
      showError(signUpModel.message.toString());
    }


  }
}