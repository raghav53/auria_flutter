import 'dart:convert';

import 'package:auria_ai/apis/api_controller.dart';
import 'package:auria_ai/apis/common_model.dart';
import 'package:auria_ai/utils/all_keys.dart';
import 'package:auria_ai/utils/common.dart';
import 'package:auria_ai/utils/strings.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ChangePasswordVM with ChangeNotifier{

  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool obscureOld = true;
  bool obscureNew = true;
  bool obscureConfirm = true;
  String showPass = "assets/images/eye_open.png";
  String showPassNew = "assets/images/eye_open.png";
  String showPassConfirm = "assets/images/eye_open.png";


  void showHideClick(BuildContext context) {
    if(obscureOld){
      obscureOld = !obscureOld;
      showPass = "assets/images/eye_closs.png";
    }else{
      obscureOld = !obscureOld;
      showPass = "assets/images/eye_open.png";
    }
  }

  void showHideNewClick(BuildContext context) {
    if(obscureNew){
      obscureNew = !obscureNew;
      showPassNew = "assets/images/eye_closs.png";
    }else{
      obscureNew = !obscureNew;
      showPassNew = "assets/images/eye_open.png";
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



  void backClick(BuildContext context) {
    Navigator.pop(context);
  }

  bool validation() {
    if(oldPassword.text.toString().trim() == ""){
      showError(Strings.enterOldPassword);
      return false;
    }else if(newPassword.text.toString().trim() == ""){
      showError(Strings.enterNewPassword);
      return false;
    }else if(confirmPassword.text.toString().trim() == ""){
      showError(Strings.enterConfirmPassword);
      return false;
    }else if(confirmPassword.text.toString().trim() != newPassword.text.toString().trim()){
      showError(Strings.passwordNotMatch);
      return false;
    }else{
      return true;
    }
  }

  Future<void> changePassword(BuildContext context) async {

    Map<String,String> map = {
      "oldPassword": oldPassword.text.toString().trim(),
      "newPassword": newPassword.text.toString().trim(),
    };

    String res = await methodWithHeader("PUT", AllKeys.changePassword, map, null, context);

    var response = jsonDecode(res);

    CommonModel commonModel = CommonModel.fromJson(response);

    if(commonModel.code == 200){
      showToast(commonModel.message.toString());
    }else{
      showError(commonModel.message.toString());
    }


  }

}