import 'dart:async';
import 'dart:convert';

import 'package:auria_ai/apis/common_model.dart';
import 'package:auria_ai/screens/Chat/ChatModel.dart';
import 'package:auria_ai/utils/all_keys.dart';
import 'package:auria_ai/utils/color.dart';
import 'package:auria_ai/utils/common.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../apis/api_controller.dart';
import '../../utils/strings.dart';
import '../../utils/user_preference.dart';
import '../Home/HomeScreen.dart';
import '../SignUp/SignUpModel.dart';

class ChatVM with ChangeNotifier {

  TextEditingController messageController = TextEditingController();

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int isSubscribed = 0;
  int expireDate = 0;
  bool isExpired = false;
  String email = '';
  bool firstLogin = false;
  int wordsLeft = 0;
  int trialDaysLeft = 0;
  var errorMesasge = '';
  var selectedChatType = 0;
  String lastQuestion = '';

  TextEditingController chatController = TextEditingController();
  ScrollController scrollController = ScrollController();
  TextEditingController saveChatTitleController = TextEditingController();

   SpeechToText speechToText = SpeechToText();
   bool speechEnabled = false;
   String lastWords = '';
   bool clickSpeech = false;


  List<LocalChatData> chatArray = [];
  late Timer timer;
  int chatId = 0;

  void backClick(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()), (
        route) => false);
  }

  Future<ChatModel> chatWithAI(Map<String, String> params,
      BuildContext context) async {
    var response = await methodWithHeader("POST", AllKeys.aiChat, params, null, context);
    var res = jsonDecode(response);
    return ChatModel.fromJson(res);
  }


  Future<void> saveChatThread(Map<String, String> map, BuildContext context) async {
    if (chatArray.isNotEmpty) {
      String response = await methodWithHeader("POST", AllKeys.saveChat, map, null, context);

      var res = jsonDecode(response);

      CommonModel commonModel = CommonModel.fromJson(res);

      if(commonModel.code == 200){
        Navigator.pop(context);
        showToast(commonModel.message.toString());
      }else{
        showToast(commonModel.message.toString());
      }

    }
  }
  showSaveDialog(BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: MaterialLocalizations
            .of(context)
            .modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext,
            Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 40,
              height: 310,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                children: [
                  const SizedBox(height: 40,),
                  Material(
                    color: Colors.transparent,
                    child: Text('Save this chat?', style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        color: AppColor.textColor
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        'Title this conversation so that you can save and access it later.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColor.textColor
                        ),),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, right: 25.0, bottom: 10, top: 10),
                      child: SizedBox(
                        width: double.infinity,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 50),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: AppColor.fieldColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 0.0),
                              child: Material(
                                color: Colors.transparent,
                                child: TextField(
                                  controller: saveChatTitleController,
                                  maxLines: null,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: AppColor.textColor,
                                      fontWeight: FontWeight.w400),
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(
                                          top: 13, bottom: 5),
                                      hintText: 'Enter a Title...',
                                      hintStyle: TextStyle(
                                          color: Colors.grey.shade400,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                      border: InputBorder.none,
                                      prefix: const SizedBox(
                                        width: 15,
                                      ),
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            'assets/images/limitatuin_icon.png',
                                            width: 20,
                                            height: 20,
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
                  const SizedBox(height: 20,),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 40,
                          width: 120,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: AppColor.fieldColor,
                                backgroundColor: AppColor.fieldColor,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(25), // <-- Radius
                                ),
                              ),
                              child: Text(
                                Strings.no,
                                style: TextStyle(
                                    fontFamily: 'Poppins-Medium',
                                    color: AppColor.fieldTextColor,
                                    fontSize: 17),
                              )),
                        ),
                        SizedBox(
                          height: 40,
                          width: 120,
                          child: ElevatedButton(
                              onPressed: () {
                                if(chatArray.isEmpty){
                                  showError("Chat box is empty");
                                }else if(saveChatTitleController.text.toString().trim() == ""){
                                  showError("Please enter chat title");
                                }else{

                                  // String json = jsonEncode(chatArray);
                                  List<Map<String, String>> messageList = [];

                                  for (var i = 0; i < chatArray.length; i++) {
                                      Map<String, String> mapRate = <String, String>{};
                                      mapRate['isFrom'] = chatArray[i].isFrom.toString();
                                      mapRate['humanMesasge'] = chatArray[i].humanMesasge.toString();
                                      mapRate['aiMessage'] = chatArray[i].aiMessage.toString();
                                      mapRate['category'] = chatArray[i].category.toString();
                                      mapRate['prompt'] = chatArray[i].prompt.toString();
                                      mapRate['description'] = chatArray[i].description.toString();
                                      mapRate['id'] = chatArray[i].id.toString();
                                      messageList.add(mapRate);
                                  }

                                  String json = jsonEncode(messageList);

                                  Map<String, String> map = {
                                    "title":saveChatTitleController.text.toString().trim(),
                                    "type":"0",
                                    "json_data":json,
                                  };

                                  saveChatThread(map,context);
                                }

                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: AppColor.greenColor,
                                backgroundColor: AppColor.greenColor,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(25), // <-- Radius
                                ),
                              ),
                              child: Text(
                                Strings.yes,
                                style: const TextStyle(
                                    fontFamily: 'Poppins-Medium',
                                    color: Colors.white,
                                    fontSize: 17),
                              )),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).then((value) {
      FocusManager.instance.primaryFocus?.unfocus();
    });
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to
        .difference(from)
        .inHours / 24).round();
  }

//API Implementation

  Future<SignUpModel> getProfile(BuildContext context) async {
    SharedPreferences srf = await SharedPreferences.getInstance();
    String res = await getMethodWithQuery(
        "GET", "${AllKeys.getProfile}?user_id=${srf.getString(AllKeys.userID)}",
        null, context);

    var response = jsonDecode(res);

    signUpModel = SignUpModel.fromJson(response);
    UserPreference.shared.setUserData(signUpModel);
    UserPreference.shared.setLoggedIn(true);

    return signUpModel;
  }

}


class LocalChatData {
  String isFrom = '';
  String humanMesasge = '';
  String aiMessage = '';
  String category = '';
  String prompt = '';
  String description = '';
  int? id = 0;

  LocalChatData({
    required this.isFrom,
    required this.humanMesasge,
    required this.aiMessage,
    required this.category,
    required this.prompt,
    required this.description,
    this.id
  });
}