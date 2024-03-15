import 'dart:convert';
import 'dart:io';

import 'package:auria_ai/apis/api_controller.dart';
import 'package:auria_ai/apis/common_model.dart';
import 'package:auria_ai/screens/Subscription/SubscriptionVM.dart';
import 'package:auria_ai/screens/Subscription/subscriptions_provider.dart';
import 'package:auria_ai/utils/all_keys.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../../utils/color.dart';
import '../../utils/common.dart';
import '../../utils/strings.dart';
import '../Home/HomeScreen.dart';

class SubscriptionScreen extends StatefulWidget {

  static const String route = "SubscriptionScreenRoute";
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();

}

class _SubscriptionScreenState extends State<SubscriptionScreen> {

  var vm = SubscriptionVM();

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  fetchProducts() async{
    var products = await SubscriptionVM.instance.fetchSubscriptions();
    vm.productList = products;
    setState(() {

    });
  }

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
          title: Common.mediumText(Strings.subscription,20,AppColor.whiteColor,TextAlign.start),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              vm.backClick(context);
            },
          ),
        ),

        body: (vm.productList.length != 0)
            ?Stack(
          children: [
            Container(
              alignment: Alignment.topRight,
                child: Image.asset("assets/images/girl_img.png",height: 200,width: 170,)),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 20),
                  child: Common.boldText(Strings.unlockUnlimitedAccess, 25, AppColor.whiteColor,TextAlign.start),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Common.commonText(Strings.toYourAiAssistant, 20, AppColor.whiteColor,TextAlign.start),
                ),
                Flexible(child: subscriptionList()),
              ],
            ),
          ],
        )
            : const Center(
          child: CircularProgressIndicator(),
        ),

        bottomNavigationBar:  Container(
          alignment: Alignment.bottomCenter,
          height: 130,
          color: AppColor.whiteColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
              Common.boldText((Platform.isIOS)?"Secured with iTunes, Cancel anytime":"Secured with Google, Cancel anytime", 13, AppColor.black, TextAlign.center),
              const SizedBox(height: 10,),
              InkWell(
                onTap: () {

                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>CardInfoScreen()));
                    performPayment(context);

                },
                child: Container(
                  height: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColor.greenColor,
                      border: Border.all(color: AppColor.greenColor),
                      borderRadius: BorderRadius.circular(30)),
                  margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Common.boldText((vm.checkPlan == 1)?"Continue with free trial":(vm.checkPlan == 2)?"Continue with weekly":(vm.checkPlan == 3)?"Continue with monthly":"Continue with yearly", 16, AppColor.whiteColor,TextAlign.start),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }

  Widget subscriptionList() {
    return  Container(
      margin: const EdgeInsets.only(top: 24),
      height: double.infinity,
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
                        if(vm.checkPlan == 1)Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.circle,color: AppColor.black,size: 12,),
                                const SizedBox(width: 10,),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*0.60,
                                    child: Common.mediumText("Free 3 day trial, limited to 4,000 characters.", 17, AppColor.textColor, TextAlign.start)),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                Icon(Icons.circle,color: AppColor.black,size: 12,),
                                const SizedBox(width: 10,),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width*0.60,
                                    child: Common.mediumText("Limited access to chat categories.", 17, AppColor.textColor, TextAlign.start)),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                Icon(Icons.circle,color: AppColor.black,size: 12,),
                                const SizedBox(width: 10,),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width*0.60,
                                    child: Common.mediumText("Contains ads. ", 17, AppColor.textColor, TextAlign.start)),
                              ],
                            ),
                             const SizedBox(height: 5,),
                            Row(
                              children: [
                                Icon(Icons.circle,color: AppColor.black,size: 12,),
                                const SizedBox(width: 10,),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width*0.60,
                                    child: Common.mediumText("Fast image processing.", 17, AppColor.textColor, TextAlign.start)),
                              ],
                            ),
                             const SizedBox(height: 5,),
                            Row(
                              children: [
                                Icon(Icons.circle,color: AppColor.black,size: 12,),
                                const SizedBox(width: 10,),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width*0.60,
                                    child: Common.mediumText("Must be converted to a paid subscription to continue use.", 17, AppColor.textColor, TextAlign.start)),
                              ],
                            ),
                          ],
                        )
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
                width: double.infinity,
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
                        Common.mediumText('${vm.productList[1].price}/week', 17, AppColor.textColor, TextAlign.start),
                        const SizedBox(height: 5,),
                        if(vm.checkPlan == 2)Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.circle,color: AppColor.black,size: 12,),
                                const SizedBox(width: 10,),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width*0.60,
                                    child: Common.mediumText("Unlimited access to all chat categories for a week.", 17, AppColor.textColor, TextAlign.start)),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                Icon(Icons.circle,color: AppColor.black,size: 12,),
                                const SizedBox(width: 10,),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width*0.60,
                                    child: Common.mediumText("Weekly recurring fee. ", 17, AppColor.textColor, TextAlign.start)),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                Icon(Icons.circle,color: AppColor.black,size: 12,),
                                const SizedBox(width: 10,),
                                Common.mediumText("Ads-free experience", 17, AppColor.textColor, TextAlign.start),
                              ],
                            ),
                             const SizedBox(height: 5,),
                            Row(
                              children: [
                                Icon(Icons.circle,color: AppColor.black,size: 12,),
                                const SizedBox(width: 10,),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width*0.60,
                                    child: Common.mediumText("Fast image processing.", 17, AppColor.textColor, TextAlign.start)),
                              ],
                            ),
                          ],
                        )
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
                        Common.mediumText("${vm.productList[0].price}/month", 17, AppColor.textColor, TextAlign.start),
                        const SizedBox(height: 5,),
                        if(vm.checkPlan == 3)Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.circle,color: AppColor.black,size: 12,),
                                const SizedBox(width: 10,),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width*0.60,
                                    child: Common.mediumText("Unlimited access to all chat categories for a month.", 17, AppColor.textColor, TextAlign.start)),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                Icon(Icons.circle,color: AppColor.black,size: 12,),
                                const SizedBox(width: 10,),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width*0.60,
                                    child: Common.mediumText("Monthly recurring fee.", 17, AppColor.textColor, TextAlign.start)),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                Icon(Icons.circle,color: AppColor.black,size: 12,),
                                const SizedBox(width: 10,),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width*0.60,
                                    child: Common.mediumText("Ads-free experience", 17, AppColor.textColor, TextAlign.start)),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                Icon(Icons.circle,color: AppColor.black,size: 12,),
                                const SizedBox(width: 10,),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width*0.60,
                                    child: Common.mediumText("Fast image processing", 17, AppColor.textColor, TextAlign.start)),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                Icon(Icons.circle,color: AppColor.black,size: 12,),
                                const SizedBox(width: 10,),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width*0.60,
                                    child: Common.mediumText("Save \$10 compared to weekly subscription.", 17, AppColor.textColor, TextAlign.start)),
                              ],
                            ),
                          ],
                        )
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
                        Common.mediumText("${vm.productList[2].price}/year", 17, AppColor.textColor, TextAlign.start),
                        const SizedBox(height: 5,),
                        if(vm.checkPlan == 4)Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.circle,color: AppColor.black,size: 12,),
                                const SizedBox(width: 10,),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width*0.60,
                                    child: Common.mediumText("Unlimited access to all chat categories for a year.", 17, AppColor.textColor, TextAlign.start)),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                Icon(Icons.circle,color: AppColor.black,size: 12,),
                                const SizedBox(width: 10,),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width*0.60,
                                    child: Common.mediumText("Yearly recurring fee.", 17, AppColor.textColor, TextAlign.start)),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                Icon(Icons.circle,color: AppColor.black,size: 12,),
                                const SizedBox(width: 10,),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width*0.60,
                                    child: Common.mediumText("Ads-free experience", 17, AppColor.textColor, TextAlign.start)),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                Icon(Icons.circle,color: AppColor.black,size: 12,),
                                const SizedBox(width: 10,),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width*0.60,
                                    child: Common.mediumText("Fast image processing", 17, AppColor.textColor, TextAlign.start)),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                Icon(Icons.circle,color: AppColor.black,size: 12,),
                                const SizedBox(width: 10,),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width*0.60,
                                    child: Common.mediumText("Save \$261 compared to monthly subscription.", 17, AppColor.textColor, TextAlign.start)),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Image.asset((vm.checkPlan == 4)?"assets/images/check_radio.png":"assets/images/uncheck_radio.png",height: 20,width: 20,)
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40,),

          ],
        ),
      ),
    );
  }

  performPayment(BuildContext context) async {
    if (defaultTargetPlatform == TargetPlatform.iOS){

    }
    ProductDetails? productToBuy;

    if (defaultTargetPlatform == TargetPlatform.iOS) {
      if (vm.checkPlan == 2) {
        var index = vm.productList.indexWhere((element) => element.id == vm.iWeeklyId);
        productToBuy = vm.productList.elementAt(index);
      } else if(vm.checkPlan == 3) {
        var index = vm.productList.indexWhere((element) =>
        element.id == vm.iMonthlyId);
        productToBuy = vm.productList.elementAt(index);
      } else if(vm.checkPlan == 4) {
        var index = vm.productList.indexWhere((element) =>
        element.id == vm.iYearlyId);
        productToBuy = vm.productList.elementAt(index);
      }
    }
    else{
      if (vm.checkPlan == 2) {
        var index = vm.productList.indexWhere((element) =>
        element.id == vm.gWeeklyId);
        productToBuy = vm.productList.elementAt(index);
      }
      else if(vm.checkPlan == 3) {
        var index = vm.productList.indexWhere((element) =>
        element.id == vm.gMonthlyId);
        productToBuy = vm.productList.elementAt(index);
      }
      else if(vm.checkPlan == 4) {
        var index = vm.productList.indexWhere((element) =>
        element.id == vm.gYearlyId);
        productToBuy = vm.productList.elementAt(index);
      }
    }

    await SubscriptionsProvider.instance.buySubscription(productToBuy!, (PurchaseDetails details) async {

      // var anyModel = await vm.subscription({'transaction_id':details.purchaseID ?? '','amount':productToBuy!.rawPrice.toString(),'type':(vm.checkPlan == 2)?'0':(vm.checkPlan == 3)?'1':"2",'json_data':details.verificationData.serverVerificationData}, context);

    });

  }

}
