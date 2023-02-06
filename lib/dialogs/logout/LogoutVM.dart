
import 'dart:convert';

import 'package:auria_ai/apis/api_controller.dart';
import 'package:auria_ai/apis/common_model.dart';
import 'package:auria_ai/screens/Login/LoginScreen.dart';
import 'package:auria_ai/utils/all_keys.dart';
import 'package:auria_ai/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutVM{



  Future<void> logout(BuildContext context) async {

    SharedPreferences srf = await SharedPreferences.getInstance();

    String response = await methodWithHeader("PUT", AllKeys.logout, null, null, context);
    var res = jsonDecode(response);
    CommonModel commonModel = CommonModel.fromJson(res);

    if(commonModel.code == 200){
      srf.clear();
      showToast(commonModel.message.toString());
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LoginScreen()), (route) => false);

    }else{
      showError(commonModel.message.toString());
    }



  }

  void noClick(BuildContext context) {
    Navigator.pop(context);
  }

}