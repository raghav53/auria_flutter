import 'dart:convert';

import 'package:auria_ai/apis/api_controller.dart';
import 'package:auria_ai/utils/all_keys.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class FaqVM with ChangeNotifier{

  var faqClick = -1;


  void backClick(BuildContext context) {
    Navigator.pop(context);
  }


  Future<void> getFaq(BuildContext context) async {

    String res = await getMethodWithQuery("GET", AllKeys.getFaqs, null, context);

    var response = jsonDecode(res);


  }


}