import 'dart:convert';

import 'package:auria_ai/apis/api_controller.dart';
import 'package:auria_ai/screens/Faq/FaqModel.dart';
import 'package:auria_ai/utils/all_keys.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FaqVM with ChangeNotifier{

  var faqClick = -1;

  var isLoading = true;
  FaqModel faqModel = FaqModel();

  void backClick(BuildContext context) {
    Navigator.pop(context);
  }


  Future<bool> getFaq(BuildContext context) async {

    String res = await getMethodWithQuery("GET", AllKeys.getFaqs, null, context);

    var response = jsonDecode(res);
    faqModel = FaqModel.fromJson(response);
    isLoading = false;
    if(faqModel.code == 200){

    }else{

    }
    return true;
  }




}