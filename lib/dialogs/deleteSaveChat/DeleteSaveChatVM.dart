
import 'dart:convert';

import 'package:auria_ai/apis/api_controller.dart';
import 'package:auria_ai/apis/common_model.dart';
import 'package:auria_ai/utils/all_keys.dart';
import 'package:auria_ai/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class DeleteSaveChatVM{

  Future<void> yesClick(BuildContext context, String id) async {
    String res = await getMethodWithQuery("DELETE", "${AllKeys.deleteSavedChat}$id", null, context);

    var response = jsonDecode(res);

    CommonModel commonModel = CommonModel.fromJson(response);

    hideLoader(context);
    if(commonModel.code == 200){
      Navigator.pop(context,true);
      showToast(commonModel.message.toString());
    }else{
      showError(commonModel.message.toString());
    }
  }

  void noClick(BuildContext context) {
    Navigator.pop(context);
  }


}