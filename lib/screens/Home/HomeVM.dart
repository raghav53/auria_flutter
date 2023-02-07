
import 'dart:convert';

import 'package:auria_ai/screens/Home/HomeScreen.dart';
import 'package:auria_ai/screens/SaveChat/SaveChatScreen.dart';
import 'package:auria_ai/screens/Settings/SettingsScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apis/api_controller.dart';
import '../../dialogs/logout/LogoutDialog.dart';
import '../../utils/all_keys.dart';
import '../../utils/common.dart';
import '../Chat/ChatScreen.dart';
import '../SignUp/SignUpModel.dart';
import '../Subscription/SubscriptionScreen.dart';

class HomeVM with ChangeNotifier{


  TextEditingController search = TextEditingController();
  List<String> listImages = ['assets/images/mess_icon.png','assets/images/translate_icon.png','assets/images/search_icon.png','assets/images/history_icon_cat.png','assets/images/command_icon.png','assets/images/sql_icon.png'];
  List<String> listTitles = ['New Chat','Translate','Discover','History','Command','SQL'];
  String choise = '';

  String firstName(){
    return signUpModel.body!.firstName.toString();
  }

  String lastName(){
    return signUpModel.body!.lastName.toString();
  }

  String emailID(){
    return signUpModel.body!.email.toString();
  }


  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  void newChatClick(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));

  }

  void saveChatClick(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SaveChatScreen()));
  }

  void subscriptionClick(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SubscriptionScreen()));
  }

  void settingsClick(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsScreen()));
  }

  void logoutClick(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) =>
      const LogoutConfirmation(),
    );
  }


}