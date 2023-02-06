
import 'dart:convert';

import 'package:auria_ai/apis/common_model.dart';
import 'package:auria_ai/utils/all_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../apis/api_controller.dart';
import '../../utils/common.dart';
import '../../utils/strings.dart';

class ForgotPasswordVM with ChangeNotifier{

  TextEditingController email = TextEditingController();

  void backClick(BuildContext context) {
    Navigator.pop(context);
  }

  Future<void> forgotPassword(BuildContext context) async {
    showLoader(context);
    Map<String,String> map = {
      "email" : email.text.toString().trim()
    };

    String res = await postMethod("POST", AllKeys.forgotPassword, map, null, context);

    var response = jsonDecode(res);
    CommonModel commonModel = CommonModel.fromJson(response);
    hideLoader(context);
    if(commonModel.code == 200){
      showToast(commonModel.message.toString());
      Navigator.pop(context);
    }else{

      showError(commonModel.message.toString());

    }
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
    else{
      return true;
    }
  }

}