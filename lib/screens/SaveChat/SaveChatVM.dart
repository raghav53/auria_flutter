

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../dialogs/deleteSaveChat/DeleteSaveChatDialog.dart';
import '../Home/HomeScreen.dart';


class SaveChatVM with ChangeNotifier{

  void backClick(BuildContext context) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen()), (route) => false);
  }

  void deleteChat(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) =>
      const DeleteSaveChatDialog(),
    );
  }


}