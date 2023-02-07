import 'package:auria_ai/screens/Settings/SettingsVM.dart';
import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/common.dart';
import '../../utils/strings.dart';

class SettingsScreen extends StatefulWidget {
  static const String route = "SettingsScreenRoute";
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  var vm = SettingsVM();

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
          title: Common.mediumText(Strings.settings,20,AppColor.whiteColor,TextAlign.start),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              vm.backClick(context);
            },
          ),
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 90,
                  width: 90,
                  child: Image.asset(
                    'assets/images/image_back.png',
                  ),
                ),
                Common.boldText("JD", 45, AppColor.greenColor,TextAlign.center)
              ],
            ),
            const SizedBox(height: 5,),
            Common.boldText("${vm.firstName()}"" ${vm.lastName()}", 25, AppColor.whiteColor,TextAlign.center),
            const SizedBox(height: 5,),
            Common.commonText(vm.emailID().toString(), 15, AppColor.whiteColor,TextAlign.start),
            const SizedBox(height: 10,),
            SizedBox(
              height: 30,
              width: 80,
              child: ElevatedButton(
                  onPressed: () {
                    vm.editClick(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: AppColor.fieldColor, backgroundColor: AppColor.fieldColor,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(25), // <-- Radius
                    ),
                  ),
                  child:  Text(
                    Strings.edit,
                    style:  TextStyle(
                        fontFamily: 'Poppins-Medium',
                        color: AppColor.textColor,
                        fontSize: 17),
                  )),
            ),
            Flexible(child: subscriptionList())
          ],
        ),

      ),
    );
  }

  Widget subscriptionList() {
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.66,
      margin: const EdgeInsets.only(top: 24),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        border: Border.all(color: AppColor.whiteColor),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40)),
      ),
      padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
      child: SingleChildScrollView(
        child: Column(
          children: [

            //----------------------------------------------------Change Password-------------------
            InkWell(
              onTap: (){
                vm.changePassClick(context);
              },
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    border: Border.all(color: AppColor.whiteColor),
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/mail_icon.png",height: 20,width: 20,),
                        const SizedBox(width: 10,),
                        Common.mediumText(Strings.changePassword, 18, AppColor.fieldTextColor, TextAlign.start)
                      ],
                    ),
                    Icon(Icons.navigate_next,color: AppColor.fieldTextColor,size: 35,)
                  ],
                ),
              ),
            ),
            Divider(color: AppColor.fieldTextColor,),

            //----------------------------------------------------Terms & Conditions-------------------
            InkWell(
              onTap: (){
                vm.termsClick(context);
              },
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    border: Border.all(color: AppColor.whiteColor),
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/mail_icon.png",height: 20,width: 20,),
                        const SizedBox(width: 10,),
                        Common.mediumText(Strings.termCondition, 18, AppColor.fieldTextColor, TextAlign.start)
                      ],
                    ),
                    Icon(Icons.navigate_next,color: AppColor.fieldTextColor,size: 35,)
                  ],
                ),
              ),
            ),
            Divider(color: AppColor.fieldTextColor,),

            //----------------------------------------------------Privacy Policy-------------------
            InkWell(
              onTap: (){
                vm.privacyClick(context);
              },
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    border: Border.all(color: AppColor.whiteColor),
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/mail_icon.png",height: 20,width: 20,),
                        const SizedBox(width: 10,),
                        Common.mediumText(Strings.privacyPolicy, 18, AppColor.fieldTextColor, TextAlign.start)
                      ],
                    ),
                    Icon(Icons.navigate_next,color: AppColor.fieldTextColor,size: 35,)
                  ],
                ),
              ),
            ),
            Divider(color: AppColor.fieldTextColor,),

            //----------------------------------------------------Faqs-------------------
            InkWell(
              onTap: (){
                vm.faqClick(context);
              },
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    border: Border.all(color: AppColor.whiteColor),
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/mail_icon.png",height: 20,width: 20,),
                        const SizedBox(width: 10,),
                        Common.mediumText(Strings.faqs, 18, AppColor.fieldTextColor, TextAlign.start)
                      ],
                    ),
                    Icon(Icons.navigate_next,color: AppColor.fieldTextColor,size: 35,)
                  ],
                ),
              ),
            ),
            Divider(color: AppColor.fieldTextColor,),

            //----------------------------------------------------Upgrade App-------------------
            InkWell(
              onTap: (){
                vm.upgradeClick(context);
              },
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    border: Border.all(color: AppColor.whiteColor),
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/mail_icon.png",height: 20,width: 20,),
                        const SizedBox(width: 10,),
                        Common.mediumText(Strings.upgradeApp, 18, AppColor.fieldTextColor, TextAlign.start)
                      ],
                    ),
                    Icon(Icons.navigate_next,color: AppColor.fieldTextColor,size: 35,)
                  ],
                ),
              ),
            ),
            Divider(color: AppColor.fieldTextColor,),

            //----------------------------------------------------Share App-------------------
            InkWell(
              onTap: (){
                vm.shareClick(context);
              },
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    border: Border.all(color: AppColor.whiteColor),
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/mail_icon.png",height: 20,width: 20,),
                        const SizedBox(width: 10,),
                        Common.mediumText(Strings.shareApp, 18, AppColor.fieldTextColor, TextAlign.start)
                      ],
                    ),
                    Icon(Icons.navigate_next,color: AppColor.fieldTextColor,size: 35,)
                  ],
                ),
              ),
            ),
            Divider(color: AppColor.fieldTextColor,),

          ],
        ),
      ),
    );
  }
}
