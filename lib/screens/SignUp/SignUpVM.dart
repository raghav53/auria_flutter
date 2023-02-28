import 'dart:convert';
import 'dart:io';

import 'package:auria_ai/screens/Home/HomeScreen.dart';
import 'package:auria_ai/screens/SignUp/SignUpModel.dart';
import 'package:auria_ai/utils/common.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apis/api_controller.dart';
import '../../utils/all_keys.dart';
import '../../utils/strings.dart';
import '../../utils/user_preference.dart';
import '../Login/LoginScreen.dart';

class SignUpVM with ChangeNotifier{


  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  bool obscureText = true;

  bool obscureConfirm = true;

  String showPass = "assets/images/eye_open.png";

  String showPassConfirm = "assets/images/eye_open.png";

  void showHideClick(BuildContext context) {

    if(obscureText){
      obscureText = !obscureText;
      showPass = "assets/images/eye_closs.png";
    }
    else{
      obscureText = !obscureText;
      showPass = "assets/images/eye_open.png";
    }

  }

  void showHideConfirmClick(BuildContext context) {
    if(obscureConfirm){
      obscureConfirm = !obscureConfirm;
      showPassConfirm = "assets/images/eye_closs.png";
    }else{
      obscureConfirm = !obscureConfirm;
      showPassConfirm = "assets/images/eye_open.png";
    }
  }

  void signInClick(BuildContext context) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const LoginScreen()), (route) => false);
  }


  Future<void> signUp(BuildContext context) async {
    showLoader(context);
    var device_type = "1";
    if (Platform.isAndroid) {
      device_type = "1";
    } else if (Platform.isIOS) {
      device_type = "2";
    }

    Map<String ,String> map = {
      "first_name": firstName.text.toString().trim(),
      "last_name": lastName.text.toString().trim(),
      "email": email.text.toString().trim(),
      "password": password.text.toString().trim(),
      "device_type": device_type,
      "device_token": token,
    };


    SharedPreferences srf = await SharedPreferences.getInstance();
    String res = await postMethod("POST",AllKeys.signup, map, null,context);

    var response = jsonDecode(res);
    hideLoader(context);

    signUpModel = SignUpModel.fromJson(response);
    UserPreference.shared.setUserData(signUpModel);
    UserPreference.shared.setLoggedIn(true);
    if(signUpModel.code == 200){

      showToast(signUpModel.message.toString());
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

  void backClick(BuildContext context) {
    Navigator.pop(context);
  }

  bool validation() {

    RegExp regex = RegExp(pattern.toString());

    if(firstName.text.toString().trim() == ""){
      showError(Strings.enterFirstName);
      return false;
    }
    else if(lastName.text.toString().trim() == ""){
      showError(Strings.enterLastName);
      return false;
    }
    else if(email.text.toString().trim() == ""){
      showError(Strings.enterEmail);
      return false;
    }
    else if(!regex.hasMatch(email.text.toString().trim())){
      showError(Strings.enterValidEmail);
      return false;
    }
    else if(password.text.toString().trim() == ""){
      showError(Strings.enterPassword);
      return false;
    }
    else if(password.text.toString().trim().length < 6){
      showError(Strings.passwordLength);
      return false;
    }
    else if(confirmPassword.text.toString().trim() == ""){
      showError(Strings.enterConfirmPassword);
      return false;
    }
    else if(password.text.toString().trim() != confirmPassword.text.toString().trim()){
      showError(Strings.passwordNotMatch);
      return false;
    }
    else{
      return true;
    }
    
  }


}