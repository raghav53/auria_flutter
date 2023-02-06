import 'package:auria_ai/screens/Subscription/SubscriptionVM.dart';
import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/common.dart';
import '../../utils/strings.dart';

class SubscriptionScreen extends StatefulWidget {
  static const String route = "SubscriptionScreenRoute";
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {

  var vm = SubscriptionVM();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Common.mediumText(Strings.subscription,20,AppColor.whiteColor,TextAlign.start),
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
          Container(
            margin: const EdgeInsets.only(top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 20),
                  child: Common.boldText(Strings.unlockUnlimitedAccess, 30, AppColor.whiteColor,TextAlign.start),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Common.commonText(Strings.toYourAiAssistant, 20, AppColor.whiteColor,TextAlign.start),
                ),
                subscriptionList()
              ],
            ),
          ),
        ],
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
      padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: (){
                setState(() {
                  vm.plansClick(1);
                });

              },
              child: Container(
                margin: const EdgeInsets.only(top: 10,bottom: 5),
                decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    border: Border.all(color: AppColor.fieldColor),
                    borderRadius: const BorderRadius.all(Radius.circular(20))
                ),
                padding: const EdgeInsets.fromLTRB(15, 10, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Common.commonText(Strings.trial, 17, AppColor.fieldTextColor, TextAlign.start),
                        const SizedBox(height: 5,),
                        Common.mediumText("Free Trial with ads", 17, AppColor.textColor, TextAlign.start)
                      ],
                    ),
                    Image.asset((vm.checkPlan == 1)?"assets/images/check_radio.png":"assets/images/uncheck_radio.png",height: 20,width: 20,)
                  ],
                ),
              ),
            ),

            InkWell(
              onTap: (){
                setState(() {
                  vm.plansClick(2);
                });

              },
              child: Container(
                margin: const EdgeInsets.only(top: 10,bottom: 5),
                decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    border: Border.all(color: AppColor.fieldColor),
                    borderRadius: const BorderRadius.all(Radius.circular(20))
                ),
                padding: const EdgeInsets.fromLTRB(15, 10, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Common.commonText(Strings.weekly, 17, AppColor.fieldTextColor, TextAlign.start),
                        const SizedBox(height: 5,),
                        Common.mediumText('\$5.90/week', 17, AppColor.textColor, TextAlign.start)
                      ],
                    ),
                    Image.asset((vm.checkPlan == 2)?"assets/images/check_radio.png":"assets/images/uncheck_radio.png",height: 20,width: 20,)
                  ],
                ),
              ),
            ),

            InkWell(
              onTap: (){
                setState(() {
                  vm.plansClick(3);
                });

              },
              child: Container(
                margin: const EdgeInsets.only(top: 10,bottom: 5),
                decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    border: Border.all(color: AppColor.fieldColor),
                    borderRadius: const BorderRadius.all(Radius.circular(20))
                ),
                padding: const EdgeInsets.fromLTRB(15, 10, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Common.commonText(Strings.monthly, 17, AppColor.fieldTextColor, TextAlign.start),
                        const SizedBox(height: 5,),
                        Common.mediumText("\$10.10/month", 17, AppColor.textColor, TextAlign.start)
                      ],
                    ),
                    Image.asset((vm.checkPlan == 3)?"assets/images/check_radio.png":"assets/images/uncheck_radio.png",height: 20,width: 20,)
                  ],
                ),
              ),
            ) ,

            InkWell(
              onTap: (){
                setState(() {
                  vm.plansClick(4);
                });
              },
              child: Container(
                margin: const EdgeInsets.only(top: 10,bottom: 5),
                decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    border: Border.all(color: AppColor.fieldColor),
                    borderRadius: const BorderRadius.all(Radius.circular(20))
                ),
                padding: const EdgeInsets.fromLTRB(15, 10, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Common.commonText(Strings.yearly, 17, AppColor.fieldTextColor, TextAlign.start),
                        const SizedBox(height: 5,),
                        Common.mediumText("\$100/year", 17, AppColor.textColor, TextAlign.start)
                      ],
                    ),
                    Image.asset((vm.checkPlan == 4)?"assets/images/check_radio.png":"assets/images/uncheck_radio.png",height: 20,width: 20,)
                  ],
                ),
              ),
            ),

            SizedBox(height: 40,),
            InkWell(
              onTap: () {
                vm.subscribeClick(context);
              },
              child: Container(
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColor.greenColor,
                    border: Border.all(color: AppColor.greenColor),
                    borderRadius: BorderRadius.circular(30)),
                margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Common.boldText(Strings.subscribe, 16, AppColor.whiteColor,TextAlign.start),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
