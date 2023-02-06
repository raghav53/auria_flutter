
import 'dart:convert';

import 'package:auria_ai/apis/api_controller.dart';
import 'package:auria_ai/apis/common_model.dart';
import 'package:auria_ai/screens/SignUp/SignUpModel.dart';
import 'package:auria_ai/utils/all_keys.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/common.dart';
import '../../utils/strings.dart';

class EditProfileVM with ChangeNotifier{

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();



  getUserInfo(){

    // firstName.text = signUpModel.body!.firstName;
    // lastName.text = signUpModel.body!.lastName;
    // email.text = signUpModel.body!.email;
    firstName.text = "John";
    lastName.text = "Deo";
    email.text = "johndeo@yopmail.com";

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
    }else{
      return true;
    }
  }

  Future<void> updateProfile(BuildContext context) async {
    showLoader(context);
    Map<String,String> map = {
      "first_name": firstName.text.toString().trim(),
      "last_name": lastName.text.toString().trim(),
      "email": email.text.toString().trim()
    };

    String res = await methodWithHeader("PUT", AllKeys.editProfile, map, null, context);

    var response = jsonDecode(res);

    CommonModel commonModel = CommonModel.fromJson(response);

    if(commonModel.code == 200){
      showToast(commonModel.message.toString());

      getProfile(context);
    }else{
      showError(commonModel.message.toString());
    }
  }

  Future<void> getProfile(BuildContext context) async {
    SharedPreferences srf = await SharedPreferences.getInstance();
    String res = await getMethodWithQuery("GET", "${AllKeys.getProfile}?user_id=${srf.getString(AllKeys.userID)}", null, context);

    var response = jsonDecode(res);

    signUpModel = SignUpModel.fromJson(response);
    hideLoader(context);
    if(signUpModel.code == 200){
      showToast(signUpModel.message.toString());
      Navigator.pop(context);
    }else{
      showError(signUpModel.message.toString());
    }
  }


}