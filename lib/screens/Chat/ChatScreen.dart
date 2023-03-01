import 'dart:async';

import 'package:auria_ai/screens/Chat/ChatModel.dart';
import 'package:auria_ai/screens/Chat/ChatVM.dart';
import 'package:auria_ai/screens/Chat/receiver_text_view.dart';
import 'package:auria_ai/screens/Chat/sender_text_view.dart';
import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/common.dart';
import '../../utils/strings.dart';
import '../../utils/user_preference.dart';
import 'chat_initial_view.dart';
import 'chat_loader.dart';

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
          title: Common.mediumText(Strings.aiSearch, 20, AppColor.whiteColor, TextAlign.start),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              vm.backClick(context);
            },
          ),
          actions: [
            InkWell(
              onTap: (){
                vm.showSaveDialog(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Image.asset(
                  "assets/images/download_icon.png",
                  height: 17,
                  width: 17,
                ),
              ),
            )
          ],
        ),
        body: Container(
          height: double.infinity,
          padding: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            border: Border.all(color: AppColor.whiteColor),
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: ListView(
                    controller: vm.scrollController,
                    children: (vm.chatArray.isEmpty)
                        ? [
                      EmptyChatView(
                        promptTapped: (String str) {
                          if (!vm.isExpired) {
                            vm.chatController.text = str;
                            // vm.sendMessage();
                          }
                        },
                      )
                    ]
                        : getChatList(vm.chatArray),
                  )),
//FOR TRIAL USERS
              if (vm.isSubscribed == 0 && vm.firstLogin && vm.errorMesasge == '')
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
                  child: InkWell(
                    onTap: () {
                      setState(() {

                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          color:
                          AppColor.greenColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.red, width: 1)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(11),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            blurRadius: 2,
                                            spreadRadius: 2,
                                            offset: Offset(0, 1))
                                      ]),
                                  child: Image.asset(
                                    'assets/images/apple_icon.png',
                                    width: 12,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(6)),
                                      child: const Padding(
                                        padding: EdgeInsets.only(bottom: 0.0),
                                        child: Center(
                                          child: Text(
                                            '!',
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.red),
                                    children: [
                                      TextSpan(
                                        text:
                                        'Welcome to Auria! I\'m looking forward to helping you. You are on a 3 day free trial. You have 5000 words remaining! You can ',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12),
                                      ),
                                      TextSpan(
                                          text: 'UPGRADE ',
                                          style: TextStyle(
                                              decoration: TextDecoration.underline,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.red,
                                              fontSize: 12)),
                                      TextSpan(
                                        text: 'to fully utilize Auria.',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12),
                                      )
                                    ]),

                              )),
                          SizedBox(
                            width: 5,
                          ),
                          // Text('Please UPGRADE',style:
                          // TextStyle(
                          //     color: Colors.red,
                          //     fontWeight: FontWeight.w400,
                          //     fontSize: 12,
                          //     decoration: TextDecoration.underline
                          // ),)
                        ],
                      ),
                    ),
                  ),
                ),

              if (vm.isSubscribed == 0 && vm.errorMesasge == '' && !vm.isExpired && !vm.firstLogin &&
                  vm.wordsLeft != 0)
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
                  child: InkWell(
                    onTap: () {
                      setState(() {

                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          color:
                          AppColor.textRed.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.red, width: 1)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(11),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            blurRadius: 2,
                                            spreadRadius: 2,
                                            offset: Offset(0, 1))
                                      ]),
                                  child: Image.asset(
                                    'assets/images/apple_icon.png',
                                    width: 12,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(6)),
                                      child: const Padding(
                                        padding: EdgeInsets.only(bottom: 0.0),
                                        child: Center(
                                          child: Text(
                                            '!',
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          //You have 2 days remaining on the trial.You have 500 words remaining! You can upgrade to fully utilize Jarvis.
                          Flexible(
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.red),
                                    children: [
                                      TextSpan(
                                        text:
                                        'You have ${vm.trialDaysLeft} days remaining on the trial.You have ${vm.wordsLeft} words remaining! You can ',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12),
                                      ),
                                      TextSpan(
                                          text: 'UPGRADE ',
                                          style: TextStyle(
                                              decoration: TextDecoration.underline,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.red,
                                              fontSize: 12)),
                                      TextSpan(
                                        text: 'to fully utilize Auria.',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12),
                                      )
                                    ]),

                              )),
                          SizedBox(
                            width: 5,
                          ),
                          // Text('Please UPGRADE',style:
                          // TextStyle(
                          //     color: Colors.red,
                          //     fontWeight: FontWeight.w400,
                          //     fontSize: 12,
                          //     decoration: TextDecoration.underline
                          // ),)
                        ],
                      ),
                    ),
                  ),
                ),

              if (vm.isSubscribed == 0 &&
                  vm.errorMesasge == '' &&
                  !vm.isExpired &&
                  !vm.firstLogin &&
                  vm.wordsLeft == 0)
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
                  child: InkWell(
                    onTap: () {
                      setState(() {

                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          color:
                          AppColor.textRed.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.red, width: 1)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(11),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            blurRadius: 2,
                                            spreadRadius: 2,
                                            offset: Offset(0, 1))
                                      ]),
                                  child: Image.asset(
                                    'assets/images/apple_icon.png',
                                    width: 12,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(6)),
                                      child: const Padding(
                                        padding: EdgeInsets.only(bottom: 0.0),
                                        child: Center(
                                          child: Text(
                                            '!',
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.red),
                                    children: [
                                      TextSpan(
                                        text:
                                        'You have maxed out your daily limit on the trial. Please wait 24 hours to continue using Auria. You can ',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12),
                                      ),
                                      TextSpan(
                                          text: 'UPGRADE ',
                                          style: TextStyle(
                                              decoration: TextDecoration.underline,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.red,
                                              fontSize: 12)),
                                      TextSpan(
                                        text: 'to fully utilize Auria.',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12),
                                      )
                                    ]),

                              )),
                          SizedBox(
                            width: 5,
                          ),
                          // Text('Please UPGRADE',style:
                          // TextStyle(
                          //     color: Colors.red,
                          //     fontWeight: FontWeight.w400,
                          //     fontSize: 12,
                          //     decoration: TextDecoration.underline
                          // ),)
                        ],
                      ),
                    ),
                  ),
                ),

              if (vm.isSubscribed == 0 && vm.errorMesasge != '' && !vm.isExpired)
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context)=>PlansScreen(isFromLogin: false)));
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          color:
                          AppColor.redColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.red, width: 1)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(11),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            blurRadius: 2,
                                            spreadRadius: 2,
                                            offset: Offset(0, 1))
                                      ]),
                                  child: Image.asset(
                                    'assets/images/apple_icon.png',
                                    width: 12,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(6)),
                                      child: const Padding(
                                        padding: EdgeInsets.only(bottom: 0.0),
                                        child: Center(
                                          child: Text(
                                            '!',
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Text(
                              vm.errorMesasge,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              if (vm.isSubscribed == 0 && vm.isExpired)
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
                  child: InkWell(
                    onTap: () {
                      setState(() {

                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          color:
                          AppColor.redColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.red, width: 1)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(11),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            blurRadius: 2,
                                            spreadRadius: 2,
                                            offset: Offset(0, 1))
                                      ]),
                                  child: Image.asset(
                                    'assets/images/apple_icon.png',
                                    width: 12,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(6)),
                                      child: const Padding(
                                        padding: EdgeInsets.only(bottom: 0.0),
                                        child: Center(
                                          child: Text(
                                            '!',
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.red),
                                    children: [

                                      TextSpan(
                                        text:
                                        'Your 3 day trial has ended. You can ',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12),
                                      ),
                                      TextSpan(
                                          text: 'UPGRADE ',
                                          style: TextStyle(
                                              decoration: TextDecoration.underline,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.red,
                                              fontSize: 12)),
                                      TextSpan(
                                        text: 'to fully utilize Auria.',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12),
                                      )
                                    ]),

                              )),
                          SizedBox(
                            width: 5,
                          ),
                          // Text('Please UPGRADE',style:
                          // TextStyle(
                          //     color: Colors.red,
                          //     fontWeight: FontWeight.w400,
                          //     fontSize: 12,
                          //     decoration: TextDecoration.underline
                          // ),)
                        ],
                      ),
                    ),
                  ),
                ),

              //FOR PAID USERS

              if (vm.isSubscribed == 1 && vm.wordsLeft <= 2000 && vm.errorMesasge == '' && vm.wordsLeft != 0)
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context)=>PlansScreen(isFromLogin: false))).then((value) {
                        //   getUserData();
                        // });
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          color:
                          AppColor.redColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.red, width: 1)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(11),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            blurRadius: 2,
                                            spreadRadius: 2,
                                            offset: Offset(0, 1))
                                      ]),
                                  child: Image.asset(
                                    'assets/images/apple_icon.png',
                                    width: 12,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(6)),
                                      child: const Padding(
                                        padding: EdgeInsets.only(bottom: 0.0),
                                        child: Center(
                                          child: Text(
                                            '!',
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.red),
                                    children: [
                                      TextSpan(
                                        text:
                                        'You almost hit your daily limit! You have ${vm.wordsLeft} words left!',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12),
                                      ),

                                    ]),

                              )),
                          SizedBox(
                            width: 5,
                          ),
                          // Text('Please UPGRADE',style:
                          // TextStyle(
                          //     color: Colors.red,
                          //     fontWeight: FontWeight.w400,
                          //     fontSize: 12,
                          //     decoration: TextDecoration.underline
                          // ),)
                        ],
                      ),
                    ),
                  ),
                ),

              if (vm.isSubscribed == 1 && vm.wordsLeft == 0 && vm.errorMesasge == '')
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context)=>PlansScreen(isFromLogin: false))).then((value) {
                        //   getUserData();
                        // });
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          color:
                          AppColor.redColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.red, width: 1)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(11),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            blurRadius: 2,
                                            spreadRadius: 2,
                                            offset: Offset(0, 1))
                                      ]),
                                  child: Image.asset(
                                    'assets/images/apple_icon.png',
                                    width: 12,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(6)),
                                      child: const Padding(
                                        padding: EdgeInsets.only(bottom: 0.0),
                                        child: Center(
                                          child: Text(
                                            '!',
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Text(
                              'You have maxed out your daily limit! Please wait 24 hours to continue using Auria.',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          // Text('Please UPGRADE',style:
                          // TextStyle(
                          //     color: Colors.red,
                          //     fontWeight: FontWeight.w400,
                          //     fontSize: 12,
                          //     decoration: TextDecoration.underline
                          // ),)
                        ],
                      ),
                    ),
                  ),
                ),

              if (vm.isSubscribed == 1 && vm.errorMesasge != '')
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context)=>PlansScreen(isFromLogin: false)));
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          color:
                          AppColor.redColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.red, width: 1)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(11),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            blurRadius: 2,
                                            spreadRadius: 2,
                                            offset: Offset(0, 1))
                                      ]),
                                  child: Image.asset(
                                    'assets/images/apple_icon.png',
                                    width: 12,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(6)),
                                      child: const Padding(
                                        padding: EdgeInsets.only(bottom: 0.0),
                                        child: Center(
                                          child: Text(
                                            '!',
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Text(
                              vm.errorMesasge,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              if ((vm.isSubscribed == 1) || (vm.isSubscribed == 0 && !vm.isExpired))
                Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, bottom: 0, top: 10),
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Flexible(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxHeight: 200),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: AppColor.fieldColor,
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 3,
                                          color: Colors.grey.withOpacity(0.3),
                                          offset: Offset(0, 2))
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: TextField(
                                    controller: vm.chatController,
                                    maxLines: null,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: AppColor.fieldTextColor,
                                        fontWeight: FontWeight.w400),
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(top: 15, bottom: 5),
                                        hintText: 'Type here',
                                        hintStyle: TextStyle(
                                            color: Colors.grey.shade400,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                        border: InputBorder.none,
                                        prefix: SizedBox(
                                          width: 15,
                                        ),
                                        suffixIcon: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: InkWell(
                                              onTap: () {
                                                // sendMessage();
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Image.asset(
                                                  'assets/images/mike_icon.png',
                                                  height: 20,
                                                  width: 20,
                                                ),
                                              )),
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: InkWell(
                              onTap: (){
                                  sendMessage();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColor.greenColor,
                                  border: Border.all(color: AppColor.whiteColor),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.only(top: 12, bottom: 10, left: 10, right: 12),
                                child: Image.asset(
                                  "assets/images/send_message_icon.png",
                                  color: AppColor.whiteColor,
                                  height: 26,
                                  width: 26,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),

              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getChatList(List<LocalChatData> messages) {
    List<Widget> mArray = [];
    for (var item in messages) {
      if (item.isFrom == 'human') {
        mArray.add(SenderTextView(
          chatData: item,
          email: vm.email,
        ));
      }
      else if (item.isFrom == 'loader'){
        mArray.add(ChatLoader());
      }
      else {
        mArray.add(ReceiverTextView(
          chatData: item,
        ));
      }
    }
    return mArray;
  }


  Future<void> sendMessage() async {
    if (vm.chatController.text.trim().isNotEmpty) {
      FocusManager.instance.primaryFocus?.unfocus();
      String message = '';
      LocalChatData data = LocalChatData(
          isFrom: 'human',
          humanMesasge: vm.chatController.text,
          aiMessage: '',
          category: 'chat',
          id: vm.chatId);

      vm.chatArray.add(data);
      message = vm.chatController.text;
      vm.chatController.text = '';


      LocalChatData loaderData = LocalChatData(
          isFrom: 'loader',
          humanMesasge: message,
          aiMessage: '',
          category: 'chat',
          id: vm.chatId);
      vm.chatArray.add(loaderData);
      await playSendTone();
      setState(() {
        vm.timer = Timer(const Duration(milliseconds: 200), () {
          setState(() {
            vm.scrollController.animateTo(
                vm.scrollController.position.maxScrollExtent,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOut);
            vm.timer.cancel();
          });
        });
      });

      var model = await vm.chatWithAI({
        'chat': 'Human:$message\\n\\Auria:',
        'category': 'chat',
        'is_save': '0'
      }, context);
      if (!mounted) {
        return;
      }
      vm.chatArray.removeLast();
      if (model.success == 1) {
        await playReceiveTone();
        debugPrint('Here i got');
        LocalChatData aiData = LocalChatData(
            isFrom: 'ai',
            humanMesasge: message,
            aiMessage: model.body?.choices?.first.text ?? '',
            category: 'chat',
            id: vm.chatId);
        vm.chatId += 1;
        vm.chatArray.add(aiData);
        setState(() {
          vm.timer = Timer(const Duration(milliseconds: 200), () {
            setState(() {
              vm.scrollController.animateTo(
                  vm.scrollController.position.maxScrollExtent,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeOut);
              vm.timer.cancel();
            });
          });
        });
      } else {
        if ((model.message ?? '').toLowerCase() == 'You have reached your daily word limit'.toLowerCase()){
          vm.errorMesasge = '';
        }else{
          vm.errorMesasge = model.message ?? '';
        }

        setState(() {});

        // Utility.shared.showToast('Error', model.message ?? '', context);
      }
      getUserData();

    }

  }


  Future<void> getUserData() async {
    var isFirstTime = await UserPreference.shared.isFirstTime();
    vm.firstLogin = isFirstTime;
    setState(() {});
    if (isFirstTime) {
      UserPreference.shared.setFirstTime(false);
    }

    var userData = await UserPreference.shared.getUserData();
    vm.isSubscribed = userData?.body?.subscription ?? 0;
    vm.expireDate = userData?.body?.expireDate ?? 0;
    vm.email = userData?.body?.email ?? '';
    vm.wordsLeft = userData?.body?.todayWords ?? 0;
    var eDate = DateTime.fromMillisecondsSinceEpoch(vm.expireDate * 1000);
    vm.trialDaysLeft = vm.daysBetween(DateTime.now(), eDate);

    if ((DateTime.now().compareTo(eDate) >= 0)) {
      vm.isExpired = true;
    } else {
      vm.isExpired = false;
    }

    setState(() {});
    debugPrint('WAITING FOR GET PROFILE');
    var result = await vm.getProfile(context);
    debugPrint('Get PRofile API RESPONSe ------------->${result.message}');
    UserPreference.shared.setUserData(result);
    vm.isSubscribed = result?.body?.subscription ?? 0;
    vm.expireDate = result?.body?.expireDate ?? 0;
    vm.email = result?.body?.email ?? '';
    vm.wordsLeft = result?.body?.todayWords ?? 0;
    var nDate = DateTime.fromMillisecondsSinceEpoch(vm.expireDate * 1000);
    vm.trialDaysLeft = vm.daysBetween(DateTime.now(), eDate);
    if ((DateTime.now().compareTo(nDate) >= 0)) {
      vm.isExpired = true;
    } else {
      vm.isExpired = false;
    }
    setState(() {});

   /* if (vm.isExpired) {
      await SubscriptionsProvider.instance
          .restorePurchases((PurchaseDetails details) async {
        var anyModel = await APIManager.shared.subscription({
          'transaction_id': details.purchaseID ?? '',
          'amount': ((details.productID == 'com.jarvis.monthly') ||
              (details.productID == 'com_jarvis_monthly'))
              ? '17.99'
              : '4.99',
          'type': ((details.productID == 'com.jarvis.monthly') ||
              (details.productID == 'com_jarvis_monthly'))
              ? '1'
              : '0',
          'json_data': details.verificationData.serverVerificationData
        }, context);
        if (!mounted) {
          return;
        }
        if (anyModel.success == 1) {
          getUserData();
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashboardScreen()));
        } else {
          print('${anyModel.message}');
          //Utility.shared.showToast(AppConstants.appName, anyModel.message ?? '', context);
        }
      });
    }*/
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }
}
