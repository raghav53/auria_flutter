
import 'package:auria_ai/screens/Subscription/CardInfo/CardInfoScreen.dart';
import 'package:auria_ai/utils/common.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../Home/HomeScreen.dart';

class SubscriptionVM with ChangeNotifier{

  var checkPlan = 0;

  List<ProductDetails> productList = [];
  final List<String> iosProductIds = ['com.jarvis.weekly','com.jarvis.monthly','com.jarvis.yearly'];
  final List<String> googleProductIds = ['com_jarvis_weekly','com_jarvis_monthly','com_jarvis_yearly'];


  static SubscriptionVM instance = SubscriptionVM();

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


  Future<List<ProductDetails>> fetchSubscriptions() async {
    final bool available = await InAppPurchase.instance.isAvailable();
    if (!available)
    {

      debugPrint('Unable to reach to store');
      if (defaultTargetPlatform == TargetPlatform.iOS) {

      }
    }

    const Set<String> _iosSubscriptionIds = <String>{
      'com.jarvis.weekly','com.jarvis.monthly','com.jarvis.yearly'
    };

    const Set<String> _androidSubscriptionIds = <String>{
      'com_jarvis_weekly','com_jarvis_monthly','com_jarvis_yearly'
    };

    final ProductDetailsResponse response = await InAppPurchase.instance
        .queryProductDetails((defaultTargetPlatform == TargetPlatform.iOS)
        ? _iosSubscriptionIds
        : _androidSubscriptionIds);

    if (response.notFoundIDs.isNotEmpty) {
      debugPrint('No Products Found');
      if (defaultTargetPlatform == TargetPlatform.iOS) {

      }
      // IDs that does not exist on the underlying store.
    }

    // all existing product are inside the productDetails.
    List<ProductDetails> products = response.productDetails;

    // Store the subscription and notify all listeners
    notifyListeners();
    return products;
  }

}