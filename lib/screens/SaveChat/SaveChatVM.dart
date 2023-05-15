

import 'dart:convert';

import 'package:auria_ai/apis/api_controller.dart';
import 'package:auria_ai/apis/common_model.dart';
import 'package:auria_ai/screens/SaveChat/SavedChatModel.dart';
import 'package:auria_ai/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import '../../dialogs/deleteSaveChat/DeleteSaveChatDialog.dart';
import '../../utils/all_keys.dart';
import '../../utils/color.dart';
import '../../utils/strings.dart';
import '../Home/HomeScreen.dart';


class SaveChatVM with ChangeNotifier{

  TextEditingController search = TextEditingController();
  TextEditingController editTitle = TextEditingController();
  SavedChatModel savedChatModel = SavedChatModel();
  var isLoading = true;

  void backClick(BuildContext context) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen()), (route) => false);
  }

  Future deleteChat(BuildContext context, String id) async {
    var result = await showDialog(barrierDismissible: false, context: context, builder: (BuildContext context) => DeleteSaveChatDialog(id),);
    return result;
  }

  getSavedChat(BuildContext context, String s) async {
    String res = await getMethodWithQuery("GET", "${AllKeys.getSavedChat}?search=$s", null, context);

    var response = jsonDecode(res);

    savedChatModel = SavedChatModel.fromJson(response);

    isLoading = false;

    if(savedChatModel.code == 200){

    }else{

    }

    return true;
  }

  String dateFormat(String eventDate) {
    var createTime = "";
    String formattedDate2 = DateFormat('dd MMM,yyyy - HH:mm').format(DateTime.parse(eventDate));
    print(
        formattedDate2); //formatted date output using intl package =>  2021-03-16
    createTime = formattedDate2.toString();
    return createTime;
  }

  Future<bool> editTitleApi(BuildContext context, Map<String, String> map) async {
    showLoader(context);
    String res = await methodWithHeader("PUT", AllKeys.editSavedChat, map, null, context);

    var response = jsonDecode(res);

    CommonModel commonModel = CommonModel.fromJson(response);

    hideLoader(context);
    if(commonModel.code == 200){
      showToast(commonModel.message.toString());
      return true;
    }else{
      showError(commonModel.message.toString());
      return false;
    }
    
  }


  

}