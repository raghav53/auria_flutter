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

    return Scaffold(
      extendBodyBehindAppBar: true,
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

      body: Stack(
        children: [
          backgroundImage(context),
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.77,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColor.fieldColor,
                              border: Border.all(color: AppColor.fieldColor),
                              borderRadius: BorderRadius.circular(30)),
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.55,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
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
                                        contentPadding: const EdgeInsets.only(left: 2, bottom: 0, top: 0, right: 0),
                                        hintText: Strings.searchHere,
                                        hintStyle: TextStyle(color: AppColor.fieldTextColor)),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Image.asset("assets/images/mike_icon.png",height: 20,width: 20,),
                                  SizedBox(width: 20,),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColor.whiteColor,
                              border: Border.all(color: AppColor.whiteColor),
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5,right: 5),
                            child: Image.asset("assets/images/send_message_icon.png",height: 25,width: 25,),
                          ),
                        )
                      ],
                    ),
                  ),
                  saveChatList()
                ],
              ),
            ),
          ),
        ],
      ),

    );

  }

  Widget saveChatList() {
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.75,
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
