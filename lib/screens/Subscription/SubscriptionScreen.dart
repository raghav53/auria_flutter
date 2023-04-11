import 'dart:convert';

import 'package:auria_ai/screens/Subscription/SubscriptionVM.dart';
import 'package:auria_ai/screens/Subscription/subscriptions_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../../utils/color.dart';
import '../../utils/common.dart';
import '../../utils/strings.dart';
import '../Home/HomeScreen.dart';
import 'AppleSubscriptionModel.dart';

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

        body: (vm.productList.length != 0) ?Stack(
          children: [
            Container(
              alignment: Alignment.topRight,
                child: Image.asset("assets/images/girl_img.png",height: 200,width: 170,)),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
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
        ):const Center(
          child: CircularProgressIndicator(),
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

           /* InkWell(
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
            ),*/

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
                        Common.mediumText('${vm.productList[1].price}/week', 17, AppColor.textColor, TextAlign.start)
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
                        Common.mediumText("${vm.productList[0].price}/month", 17, AppColor.textColor, TextAlign.start)
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
                        Common.mediumText("${vm.productList[2].price}/year", 17, AppColor.textColor, TextAlign.start)
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
                if(vm.checkPlan == 0){
                  showError("Please select plan");
                }else{
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>CardInfoScreen()));
                  performPayment(context);
                }
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

  performPayment(BuildContext context) async {
    if (defaultTargetPlatform == TargetPlatform.iOS){

    }

    ProductDetails? productToBuy;
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      if (vm.checkPlan == 0) {
        var index = vm.productList.indexWhere((element) =>
        element.id == vm.iMonthlyId);
        productToBuy = vm.productList.elementAt(index);
      } else {
        var index = vm.productList.indexWhere((element) =>
        element.id == vm.iWeeklyId);
        productToBuy = vm.productList.elementAt(index);
      }
    }else{
      if (vm.checkPlan == 2) {
        var index = vm.productList.indexWhere((element) =>
        element.id == vm.gWeeklyId);
        productToBuy = vm.productList.elementAt(index);
      } else if(vm.checkPlan == 3) {
        var index = vm.productList.indexWhere((element) =>
        element.id == vm.gMonthlyId);
        productToBuy = vm.productList.elementAt(index);
      } else if(vm.checkPlan == 4) {
        var index = vm.productList.indexWhere((element) =>
        element.id == vm.gYearlyId);
        productToBuy = vm.productList.elementAt(index);
      }
    }
    await SubscriptionsProvider.instance.buySubscription(productToBuy!, (PurchaseDetails details) async {
      var anyModel = await vm.subscription({'transaction_id':details.purchaseID ?? '','amount':productToBuy!.rawPrice.toString(),'type':(vm.checkPlan == 0)?'1':'0','json_data':details.verificationData.serverVerificationData}, context);
      if (!mounted){ return;}
      if (anyModel.success == 1){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
      }else{
        showToast(anyModel.message ?? '');
      }
    });
  }

  Future<void> onApplePayResult(paymentResult) async {
    debugPrint('Token==========>${paymentResult['token']}');
    var response = jsonDecode(paymentResult['token']);
    AppleSubscriptionModel model = AppleSubscriptionModel.fromJson(response);
    var anyModel = await vm.subscription({'transaction_id':model.header?.transactionId ?? '','amount':(vm.checkPlan == 0)?
    '17.99':'4.99','type':(vm.checkPlan == 2)?'0':(vm.checkPlan == 3)?'1':"2",'json_data':paymentResult['token']}, context);
    if (!mounted){ return;}
    if (anyModel.success == 1){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
    }else{
      showToast(anyModel.message ?? '');
    }
  }

  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

}
