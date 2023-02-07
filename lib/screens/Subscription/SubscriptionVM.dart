
import 'package:auria_ai/screens/Subscription/CardInfo/CardInfoScreen.dart';
import 'package:auria_ai/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Home/HomeScreen.dart';

class SubscriptionVM with ChangeNotifier{

  var checkPlan = 0;

  void backClick(BuildContext context) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen()), (route) => false);
  }

  void plansClick(int i) {
    checkPlan = i;
  }

  void subscribeClick(BuildContext context) {
    if(checkPlan == 0){
      showError("Please select plan");
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (context)=>CardInfoScreen()));
    }
  }

}