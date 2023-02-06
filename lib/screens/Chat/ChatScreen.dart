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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Common.mediumText(
            Strings.limitation, 20, AppColor.whiteColor, TextAlign.start),
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
            child: Image.asset("assets/images/download_icon.png",height: 17,width: 17,),
          )
        ],
      ),
      body: Stack(
        children: [
          backgroundImage(context),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 100,),
                Container(
                  height: MediaQuery.of(context).size.height*0.78,
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    border: Border.all(color: AppColor.whiteColor),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                  ),
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Expanded(
                      child: ListView.builder(
                        itemCount: vm.messages.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(top: 10,bottom: 10),
                        itemBuilder: (context, index){
                          return Container(
                            padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                            child: Align(
                              alignment: (vm.messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: (vm.messages[index].messageType  == "receiver"?AppColor.greenColor:AppColor.fieldColor),
                                ),
                                padding: EdgeInsets.all(16),
                                child: Text(vm.messages[index].messageContent, style: TextStyle(fontSize: 15,color: vm.messages[index].messageType  == "receiver"?AppColor.whiteColor:AppColor.black),),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child:  Container(
              color: AppColor.whiteColor,
              child: Padding(
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
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.text,
                            controller: vm.messageController,
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
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColor.greenColor,
                          border: Border.all(color: AppColor.greenColor),
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5,right: 5),
                        child: Image.asset("assets/images/send_message_icon.png",height: 25,width: 25,color: AppColor.whiteColor,),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
