
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


  String firstName(){
    // return signUpModel.body!.firstName.toString();
    return "john";
  }

  String lastName(){
    return "Deo";
    // return signUpModel.body!.lastName.toString();
  }

  String emailID(){
    return "johndeo@yopmail.com";
    // return signUpModel.body!.email.toString();
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

  Future<void> getProfile(BuildContext context) async {
    SharedPreferences srf = await SharedPreferences.getInstance();
    String res = await getMethodWithQuery("GET", "${AllKeys.getProfile}?user_id=${srf.getString(AllKeys.userID)}", null, context);

    var response = jsonDecode(res);

    signUpModel = SignUpModel.fromJson(response);
    if(signUpModel.code == 200){
      showToast(signUpModel.message.toString());
      notifyListeners();
    }else{
      showError(signUpModel.message.toString());
      notifyListeners();
    }


  }

}