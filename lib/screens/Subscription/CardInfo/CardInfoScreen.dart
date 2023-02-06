import 'package:auria_ai/screens/Subscription/CardInfo/CardInfoVM.dart';
import 'package:flutter/material.dart';

import '../../../utils/color.dart';
import '../../../utils/common.dart';
import '../../../utils/strings.dart';

class CardInfoScreen extends StatefulWidget {
  static const String route = "CardInfoScreenRoute";
  const CardInfoScreen({Key? key}) : super(key: key);

  @override
  State<CardInfoScreen> createState() => _CardInfoScreenState();
}

class _CardInfoScreenState extends State<CardInfoScreen> {

  var vm = CardInfoVM();

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
            child: SingleChildScrollView(
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

            //----------------------------------------------------Card Holder Name-------------------
            Container(
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColor.fieldColor,
                  border: Border.all(color: AppColor.fieldColor),
                  borderRadius: BorderRadius.circular(30)),
              margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: TextFormField(
                cursorColor: Colors.black,
                keyboardType: TextInputType.name,
                style: TextStyle(color: AppColor.fieldTextColor),
                decoration: InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 2, bottom: 0, top: 0, right: 0),
                    hintText: Strings.firstName,
                    hintStyle: TextStyle(color: AppColor.fieldTextColor)),
              ),
            ),
            
            //----------------------------------------------------Card Number-------------------
            Container(
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColor.fieldColor,
                  border: Border.all(color: AppColor.fieldColor),
                  borderRadius: BorderRadius.circular(30)),
              margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: TextFormField(
                cursorColor: Colors.black,
                keyboardType: TextInputType.number,
                style: TextStyle(color: AppColor.fieldTextColor),
                decoration: InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 2, bottom: 0, top: 0, right: 0),
                    hintText: Strings.cardNumber,
                    hintStyle: TextStyle(color: AppColor.fieldTextColor)),
              ),
            ),
            
            //----------------------------------------------------Expiry Month-------------------
            Container(
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColor.fieldColor,
                  border: Border.all(color: AppColor.fieldColor),
                  borderRadius: BorderRadius.circular(30)),
              margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: TextFormField(
                cursorColor: Colors.black,
                keyboardType: TextInputType.number,
                maxLength: 2,
                style: TextStyle(color: AppColor.fieldTextColor),
                decoration: InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 2, bottom: 0, top: 0, right: 0),
                    hintText: Strings.expMonth,
                    hintStyle: TextStyle(color: AppColor.fieldTextColor)),
              ),
            ),
            
            //----------------------------------------------------Expiry Year-------------------
            Container(
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColor.fieldColor,
                  border: Border.all(color: AppColor.fieldColor),
                  borderRadius: BorderRadius.circular(30)),
              margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: TextFormField(
                cursorColor: Colors.black,
                keyboardType: TextInputType.number,
                maxLength: 4,
                style: TextStyle(color: AppColor.fieldTextColor),
                decoration: InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 2, bottom: 0, top: 0, right: 0),
                    hintText: Strings.expYear,
                    hintStyle: TextStyle(color: AppColor.fieldTextColor)),
              ),
            ),
            
            //----------------------------------------------------CVV-------------------
            Container(
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColor.fieldColor,
                  border: Border.all(color: AppColor.fieldColor),
                  borderRadius: BorderRadius.circular(30)),
              margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: TextFormField(
                cursorColor: Colors.black,
                keyboardType: TextInputType.number,
                maxLength: 3,
                style: TextStyle(color: AppColor.fieldTextColor),
                decoration: InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 2, bottom: 0, top: 0, right: 0),
                    hintText: Strings.cvv,
                    hintStyle: TextStyle(color: AppColor.fieldTextColor)),
              ),
            ),
            const SizedBox(height: 40,),

            InkWell(
              onTap: () {
                vm.makePayment(context);
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
                    Common.boldText(Strings.makePayment, 16, AppColor.whiteColor,TextAlign.start),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
