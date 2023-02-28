import 'package:auria_ai/screens/SaveChat/SaveChatVM.dart';
import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/common.dart';
import '../../utils/strings.dart';

class SaveChatScreen extends StatefulWidget {
  static const String route = "SaveChatScreenRoute";
  const SaveChatScreen({Key? key}) : super(key: key);

  @override
  State<SaveChatScreen> createState() => _SaveChatScreenState();
}

class _SaveChatScreenState extends State<SaveChatScreen> {


  var vm = SaveChatVM();

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
          title: Common.mediumText(Strings.savedChat,20,AppColor.whiteColor,TextAlign.start),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              vm.backClick(context);
            },
          ),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
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
                              suffixIcon: Icon(
                                Icons.mic_none_rounded,
                                color: AppColor.fieldTextColor,
                                size: 35,
                              ),
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
                        color: AppColor.whiteColor,
                        border: Border.all(color: AppColor.whiteColor),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.only(top: 12, bottom: 10, left: 10, right: 12),
                      child: Image.asset(
                        "assets/images/send_message_icon.png",
                        height: 30,
                        width: 30,
                      ),
                    )
                  ],
                ),
              ),
              Flexible(child: saveChatList())
            ],
          ),
        ),

      ),
    );

  }

  Widget saveChatList() {
    return  Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        border: Border.all(color: AppColor.whiteColor),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40)),
      ),
      padding: const EdgeInsets.fromLTRB(15, 25, 15, 10),
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 10,
          itemBuilder: (context,index)
          {
            return Container(
              margin: const EdgeInsets.only(top: 5,bottom: 5),
              decoration: BoxDecoration(
                  color: AppColor.fieldColor,
                  border: Border.all(color: AppColor.fieldColor),
                  borderRadius: const BorderRadius.all(Radius.circular(20))
              ),
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/images/apple_icon.png",height: 25,width: 25,),
                          const SizedBox(width: 10,),
                          Common.mediumText("Assistant", 17, AppColor.textColor,TextAlign.start)
                        ],
                      ),
                      InkWell(
                        onTap: (){
                          vm.deleteChat(context);
                        },
                          child: Image.asset("assets/images/delete_chat_icon.png",height: 27,width: 27,)),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Common.commonText("12 Jan, 2022-05:42", 16, AppColor.fieldTextColor,TextAlign.start),
                  const SizedBox(height: 10,),
                  Common.commonText("What version og GPT are you?", 16, AppColor.fieldTextColor,TextAlign.start),
                  const SizedBox(height: 10,),
                  Common.commonText("Version 4.5", 16, AppColor.fieldTextColor,TextAlign.start),
                  const SizedBox(height: 10,),
                ],
              ),
            );
          }),
    );
  }
}
