
import 'package:auria_ai/screens/Chat/ChatModel.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ChatVM with ChangeNotifier{

  TextEditingController messageController = TextEditingController();

  List<ChatModel> messages = [
    ChatModel(messageContent: "Hello, Will", messageType: "receiver"),
    ChatModel(messageContent: "How have you been?", messageType: "receiver"),
    ChatModel(messageContent: "Hey Kriss, I am doing fine dude. wbu?", messageType: "sender"),
    ChatModel(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatModel(messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];

  void backClick(BuildContext context) {
    Navigator.pop(context);
  }

}