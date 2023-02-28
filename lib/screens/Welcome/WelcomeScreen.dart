import 'dart:io';

import 'package:auria_ai/screens/Welcome/WelcomeScreenVM.dart';
import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/common.dart';
import '../../utils/strings.dart';

class WelcomeScreen extends StatefulWidget {
  static const String route = "WelcomeScreenRoute";
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  var vm = WelcomeScreenVM();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backgroundImage(context),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.60,
            child: Center(
              child: Image.asset(
                "assets/images/welcome_icon.png",
                width: 250,
                height: 250,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.40,
                  margin: const EdgeInsets.only(top: 121),
                  color: AppColor.whiteColor,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      elevation: 5,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only( topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                      ),
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.whiteColor,
                            border: Border.all(color: AppColor.whiteColor),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40)),
                        ),

                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 20,),
                                Common.boldText(Strings.welcomeTO, 32, AppColor.textColor,TextAlign.start),
                                Common.boldText(Strings.appName, 55, AppColor.greenColor,TextAlign.start),
                                const SizedBox(height: 20,),
                                InkWell(
                                  onTap: () {
                                    vm.clickEmail(context);
                                  },
                                  child: Container(
                                    height: 45,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: AppColor.fieldColor,
                                        border: Border.all(color: AppColor.fieldColor),
                                        borderRadius: BorderRadius.circular(30)),
                                    margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset("assets/images/email_icon.png",height: 25,width: 25,),
                                        const SizedBox(width: 15,),
                                        Common.boldText(Strings.signUpWitheEmail, 16, AppColor.fieldTextColor,TextAlign.start),
                                      ],
                                    ),
                                  ),
                                ),

                                (Platform.isIOS)?InkWell(
                                  onTap: () {
                                    vm.clickApple(context);
                                  },
                                  child: Container(
                                    height: 45,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: AppColor.fieldColor,
                                        border: Border.all(color: AppColor.fieldColor),
                                        borderRadius: BorderRadius.circular(30)),
                                    margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset("assets/images/apple_icon.png",height: 25,width: 25,),
                                        const SizedBox(width: 15,),
                                        Common.boldText(Strings.signUpWitheApple, 16, AppColor.fieldTextColor,TextAlign.start),
                                      ],
                                    ),
                                  ),
                                ):const SizedBox(),

                                (Platform.isAndroid)?InkWell(
                                  onTap: () {
                                    vm.googleSignup(context);
                                  },
                                  child: Container(
                                    height: 45,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: AppColor.fieldColor,
                                        border: Border.all(color: AppColor.fieldColor),
                                        borderRadius: BorderRadius.circular(30)),
                                    margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset("assets/images/google_icon.png",height: 25,width: 25,),
                                        const SizedBox(width: 15,),
                                        Common.boldText(Strings.signUpWitheGoogle, 16, AppColor.fieldTextColor,TextAlign.start),
                                      ],
                                    ),
                                  ),
                                ): SizedBox(),

                                const SizedBox(height: 20,),
                                InkWell(
                                  onTap: () {
                                    vm.clickSignIn(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Common.commonText(Strings.alreadyHaveAnAccount, 15, AppColor.textColor,TextAlign.start),
                                      Common.commonText(Strings.signIn, 15, AppColor.greenColor,TextAlign.start)
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
