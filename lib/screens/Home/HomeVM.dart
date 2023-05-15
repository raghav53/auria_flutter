import 'dart:convert';
import 'package:auria_ai/screens/Home/CategoryModel.dart';
import 'package:auria_ai/screens/SaveChat/SaveChatScreen.dart';
import 'package:auria_ai/screens/Settings/SettingsScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../apis/api_controller.dart';
import '../../dialogs/logout/LogoutDialog.dart';
import '../../utils/all_keys.dart';
import '../Chat/ChatScreen.dart';
import '../Subscription/SubscriptionScreen.dart';

class HomeVM with ChangeNotifier{

  TextEditingController search = TextEditingController();
  List<String> listImages = ['assets/images/mess_icon.png','assets/images/translate_icon.png','assets/images/search_icon.png','assets/images/history_icon_cat.png','assets/images/command_icon.png','assets/images/sql_icon.png'];
  List<String> listTitles = ['New Chat','Translate','Discover','History','Command','SQL'];
  String choice = '';
  String expDate = '';
  var expTimeStamp = 0;
  var currentDate = DateTime.now().millisecondsSinceEpoch;
  CategoryPojo categoryPojo = CategoryPojo();

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


  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void newChatClick(BuildContext context, String prompt, String description) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen(prompt:prompt,description:description,messageList: [])));
  }

  void saveChatClick(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SaveChatScreen()));
  }

  void subscriptionClick(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SubscriptionScreen()));
  }

  void settingsClick(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SettingsScreen()));
  }

  void logoutClick(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) =>
      const LogoutConfirmation(),
    );
  }


  Future<CategoryPojo> getCategory(BuildContext context) async {

    String res = await getMethodWithQuery("GET", AllKeys.getCategory, null, context);

    var response = jsonDecode(res);

    categoryPojo = CategoryPojo.fromJson(response);
    SharedPreferences srf = await SharedPreferences.getInstance();

    srf.setString(AllKeys.newChatProm, categoryPojo.body![0].prompt.toString());
    srf.setString(AllKeys.newChatDesc, categoryPojo.body![0].description.toString());

    return categoryPojo;
  }


  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to
        .difference(from)
        .inHours / 24).round();
  }
}