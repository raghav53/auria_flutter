import 'dart:convert';
import 'package:auria_ai/screens/SignUp/SignUpModel.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference{
  static var shared = UserPreference();


  Future<void> setLoggedIn(bool isLogged) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('LoggedIN', isLogged);
  }

  Future<bool> isLoggedIn() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool('LoggedIN') ?? false;
  }

  Future<void> setFirstTime(bool isFirst) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('FirstTime', isFirst);
  }

  Future<bool> isFirstTime() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool('FirstTime') ?? true;
  }


  Future<void> setUserData(SignUpModel data) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userData = jsonEncode(data);
    preferences.setString('AuriaUser', userData);
  }

  Future<SignUpModel?> getUserData() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var k = preferences.getString('AuriaUser');
    if (k != null){
      Map<String,dynamic>? jsonDetails = jsonDecode(k);
      debugPrint('My Json Details:==>$jsonDetails');
      return SignUpModel.fromJson(jsonDetails!);
    }else{
      return null;
    }
  }

}