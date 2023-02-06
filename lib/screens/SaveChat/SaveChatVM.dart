

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../dialogs/deleteSaveChat/DeleteSaveChatDialog.dart';


class SaveChatVM with ChangeNotifier{

  void backClick(BuildContext context) {
    Navigator.pop(context);
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