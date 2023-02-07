import 'package:auria_ai/screens/Chat/ChatModel.dart';
import 'package:auria_ai/screens/Chat/ChatVM.dart';
import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/common.dart';
import '../../utils/strings.dart';

class ChatScreen extends StatefulWidget {
  static const String route = "ChatScreenRoute";

  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var vm = ChatVM();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/background_img.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Common.mediumText(Strings.limitation, 20, AppColor.whiteColor, TextAlign.start),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              vm.backClick(context);
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset(
                "assets/images/download_icon.png",
                height: 17,
                width: 17,
              ),
            )
          ],
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            backgroundImage(context),
            Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                border: Border.all(color: AppColor.whiteColor),
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              ),
              margin: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                itemCount: vm.messages.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 10, bottom: 10),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                    child: Align(
                      alignment: (vm.messages[index].messageType == "receiver" ? Alignment.topLeft : Alignment.topRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (vm.messages[index].messageType == "receiver" ? AppColor.greenColor : AppColor.fieldColor),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          vm.messages[index].messageContent,
                          style: TextStyle(fontSize: 15, color: vm.messages[index].messageType == "receiver" ? AppColor.whiteColor : AppColor.black),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  Flexible(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColor.fieldColor, border: Border.all(color: AppColor.fieldColor), borderRadius: BorderRadius.circular(30)),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: AppColor.fieldTextColor),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                            hintText: Strings.searchHere,
                            hintStyle: TextStyle(color: AppColor.fieldTextColor)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 7),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.greenColor,
                      border: Border.all(color: AppColor.whiteColor),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.only(top: 10, bottom: 8, left: 8, right: 10),
                    child: Image.asset(
                      "assets/images/send_message_icon.png",
                      height: 30,
                      width: 30,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
