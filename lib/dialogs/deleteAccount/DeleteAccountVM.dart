
import 'dart:convert';

import 'package:auria_ai/apis/api_controller.dart';
import 'package:auria_ai/apis/common_model.dart';
import 'package:auria_ai/utils/all_keys.dart';
import 'package:auria_ai/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/Welcome/WelcomeScreen.dart';

class DeleteAccountVM{

  Future<void> yesClick(BuildContext context) async {

    SharedPreferences srf = await SharedPreferences.getInstance();
    String res = await getMethodWithQuery("DELETE", AllKeys.deleteAccount, null, context);

    var response = jsonDecode(res);

    CommonModel commonModel = CommonModel.fromJson(response);

    hideLoader(context);

    if(commonModel.code == 200){

      srf.clear();
      showToast(commonModel.message.toString());
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> WelcomeScreen()), (route) => false);

    }else{

      showError(commonModel.message.toString());

    }
  }

  void noClick(BuildContext context) {
    Navigator.pop(context);
  }


}