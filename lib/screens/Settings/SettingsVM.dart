import 'package:auria_ai/screens/EditProfile/EditProfileScreen.dart';
import 'package:auria_ai/screens/Faq/FaqScreen.dart';
import 'package:auria_ai/screens/Home/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../apis/api_controller.dart';
import '../ChangePassword/ChangePasswordScreen.dart';

class SettingsVM with ChangeNotifier{

  String firstAndLast(){
    var firstname = signUpModel.body!.firstName.toString();
    var lastname = signUpModel.body!.lastName.toString();
    return "${firstname[0]}${lastname[0]}";
  }

  String firstName(){
    return signUpModel.body!.firstName.toString();
  }

  String lastName(){
    return signUpModel.body!.lastName.toString();
  }

  String emailID(){
    return signUpModel.body!.email.toString();
  }

  void backClick(BuildContext context) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen()), (route) => false);
  }

  void editClick(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfileScreen(from: "1")));
  }

  void changePassClick(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> ChangePasswordScreen()));
  }

  Future<void> termsClick(BuildContext context) async {
    if (await canLaunch('http://3.227.175.32:5544/apis/terms')) {
    await launch('http://3.227.175.32:5544/apis/terms');
    } else {
    throw 'Could not launch';
    }
  }

  Future<void> privacyClick(BuildContext context) async {
    if (await canLaunch('http://3.227.175.32:5544/apis/privacy')) {
    await launch('http://3.227.175.32:5544/apis/privacy');
    } else {
    throw 'Could not launch';
    }
  }
  
  void faqClick(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> FaqScreen()));
  }

  void upgradeClick(BuildContext context) {}

  void shareClick(BuildContext context) {}

}