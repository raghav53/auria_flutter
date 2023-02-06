

import 'dart:convert';

import 'package:auria_ai/screens/ForgotPassword/ForgoPasswordScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apis/api_controller.dart';
import '../../utils/all_keys.dart';
import '../../utils/common.dart';
import '../../utils/strings.dart';
import '../Home/HomeScreen.dart';
import '../SignUp/SignUpModel.dart';

class LoginVM with ChangeNotifier{

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

  }

  void clickGmail(BuildContext context) {


  }


  void signUpClick(BuildContext context) {
    Navigator.pop(context);
  }

  Future<void> signIn(BuildContext context) async {
    showLoader(context);

    Map<String ,String> map = {
      "email": email.text.toString().trim(),
      "password": password.text.toString().trim(),
      "device_type": "1",
      "device_token": "qwe",
    };


    SharedPreferences srf = await SharedPreferences.getInstance();
    String res = await postMethod("POST",AllKeys.login, map, null,context);

    var response = jsonDecode(res);
    hideLoader(context);
    signUpModel = SignUpModel.fromJson(response);
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