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
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/user_preference.dart';
import '../SignUp/SignUpModel.dart';

class WelcomeScreenVM with ChangeNotifier{

  void clickEmail(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
  }

  void clickApple(BuildContext context) {
    platform.invokeMethod('iosAppLogin');
    _appleSignIn(context);

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

        List<String> name = user!.displayName.toString().split(" ");

        socialData(user.uid,user.email,name[0],name[1],context);

      }else{
        showError("Something wrong");
      }
    }
  }


  Future<void> _appleSignIn(BuildContext context) async {
    try {
      platform.setMethodCallHandler((call) async {
        switch (call.method) {
          case 'iosAppLogin':
            debugPrint('apple login credential ${call.arguments}');
            if (call.arguments["status"] == "success") {
              String? name = call.arguments["firstName"].toString();
              if (name != null) {
                name = "$name ${call.arguments["lastName"]}";
              }
              List<String> name2 = name.toString().split(" ");
              socialData(call.arguments["appleId"],call.arguments["email"].toString(),name2[0].toString(),name2[1].toString(),context);
            }
            return;
          default:
            throw PlatformException(code: '1', message: 'Not Implemented');
        }
      });
    } on PlatformException catch (e) {
      debugPrint('PlatformException: apple login : $e');
    }
  }

  Future<void> socialData(String uid, String? email, String firstName, String lastName, BuildContext context) async {


    var device_type = "1";
    var social_type = "1";

    if (Platform.isAndroid) {
      device_type = "1";
      social_type = "1";
    }
    else if (Platform.isIOS) {
      device_type = "2";
      social_type = "3";
    }

    Map<String,String> map = {
      "social_id": uid,
      "social_type":social_type,
      "first_name":firstName,
      "last_name":lastName,
      "email":email.toString(),
      "device_type": device_type,
      "device_token":token,
    };
    print("JHIJKHKJ$map");
    showLoader(context);
    socialLogin(map,context);
  }

  Future<void> socialLogin(Map<String, String> map, BuildContext context) async {
    SharedPreferences srf = await SharedPreferences.getInstance();
    String res = await postMethod("POST", AllKeys.socialLogin, map, null, context);

    var response = jsonDecode(res);

    signUpModel = SignUpModel.fromJson(response);
    UserPreference.shared.setUserData(signUpModel);
    UserPreference.shared.setLoggedIn(true);
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