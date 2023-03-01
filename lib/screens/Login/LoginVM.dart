

import 'dart:convert';
import 'dart:io';

import 'package:auria_ai/screens/ForgotPassword/ForgoPasswordScreen.dart';
import 'package:auria_ai/screens/Welcome/WelcomeScreenVM.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apis/api_controller.dart';
import '../../utils/all_keys.dart';
import '../../utils/common.dart';
import '../../utils/strings.dart';
import '../../utils/user_preference.dart';
import '../EditProfile/EditProfileScreen.dart';
import '../Home/HomeScreen.dart';
import '../SignUp/SignUpModel.dart';

class LoginVM with ChangeNotifier{

  var vm = WelcomeScreenVM();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscureText = true;
  String showPass = "assets/images/eye_open.png";




  void showHideClick(BuildContext context) {
    if(obscureText){
      obscureText = !obscureText;
      showPass = "assets/images/eye_closs.png";
    }else{
      obscureText = !obscureText;
      showPass = "assets/images/eye_open.png";
    }

  }


  void clickApple(BuildContext context) {
    platform.invokeMethod('iosAppLogin');
    _appleSignIn(context);
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

      if(signUpModel.body!.email.toString() == "null"){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfileScreen(from: "0")));
      }else{
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const HomeScreen()), (route) => false);
      }

    }else{
      showError(signUpModel.message.toString());
    }
  }

  void clickGmail(BuildContext context) {

    vm.googleSignup(context);

  }


  void signUpClick(BuildContext context) {
    Navigator.pop(context);
  }

  Future<void> signIn(BuildContext context) async {
    showLoader(context);

    var device_type = "1";
    if (Platform.isAndroid) {
      device_type = "1";
    } else if (Platform.isIOS) {
      device_type = "2";
    }

    Map<String ,String> map = {
      "email": email.text.toString().trim(),
      "password": password.text.toString().trim(),
      "device_type": device_type,
      "device_token": token,
    };

    SharedPreferences srf = await SharedPreferences.getInstance();
    String res = await postMethod("POST",AllKeys.login, map, null,context);

    var response = jsonDecode(res);
    hideLoader(context);
    signUpModel = SignUpModel.fromJson(response);
    UserPreference.shared.setUserData(signUpModel);
    UserPreference.shared.setLoggedIn(true);
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

  void clickForgotPassword(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const ForgotPasswordScreen()));

  }

  bool validation() {

    RegExp regex = RegExp(pattern.toString());

    if(email.text.toString().trim() == ""){
      showError(Strings.enterEmail);
      return false;
    } else if(!regex.hasMatch(email.text.toString().trim())){
      showError(Strings.enterValidEmail);
      return false;
    }
    else if(password.text.toString().trim() == ""){
      showError(Strings.enterPassword);
      return false;
    }
    else{
      return true;
    }
  }

}
