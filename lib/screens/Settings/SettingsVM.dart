import 'package:auria_ai/screens/EditProfile/EditProfileScreen.dart';
import 'package:auria_ai/screens/Faq/FaqScreen.dart';
import 'package:flutter/material.dart';

import '../../apis/api_controller.dart';
import '../ChangePassword/ChangePasswordScreen.dart';

class SettingsVM with ChangeNotifier{

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

  void backClick(BuildContext context) {
    Navigator.pop(context);
  }

  void editClick(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfileScreen()));
  }

  void changePassClick(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> ChangePasswordScreen()));
  }

  void termsClick(BuildContext context) {}

  void privacyClick(BuildContext context) {}
  
  void faqClick(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> FaqScreen()));
  }

  void upgradeClick(BuildContext context) {}

  void shareClick(BuildContext context) {}

}