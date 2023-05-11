
import 'dart:convert';

import 'package:auria_ai/utils/all_keys.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../../apis/api_controller.dart';
import '../Home/HomeScreen.dart';
import 'AnyModel.dart';

class SubscriptionVM with ChangeNotifier{

  var checkPlan = 1;

  List<ProductDetails> productList = [];
  final gWeeklyId = 'auria_new_weekly';
  final gMonthlyId = 'auria_new_monthly';
  final gYearlyId = 'auria_new_yearly';

  final iWeeklyId = 'auria_ai_weekly_sub';
  final iMonthlyId = 'auria_ai_monthly_sub';
  final iYearlyId = 'auria_ai_yearly_sub';


  static SubscriptionVM instance = SubscriptionVM();

  void backClick(BuildContext context) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen()), (route) => false);
  }

  void plansClick(int i) {
    checkPlan = i;
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
      'auria_ai_weekly_sub','auria_ai_monthly_sub','auria_ai_yearly_sub'
    };

    const Set<String> _androidSubscriptionIds = <String>{
      'auria_new_weekly','auria_new_monthly','auria_new_yearly'
    };

    final ProductDetailsResponse response = await InAppPurchase.instance.queryProductDetails((defaultTargetPlatform == TargetPlatform.iOS)
        ? {'auria_ai_weekly_sub','auria_ai_monthly_sub','auria_ai_yearly_sub'}
        : _androidSubscriptionIds,);

    debugPrint('${_iosSubscriptionIds.first}');
    if (response.notFoundIDs.isNotEmpty) {
      debugPrint('No Products Found');
      if (defaultTargetPlatform == TargetPlatform.iOS) {

      }
      // IDs that does not exist on the underlying store.
    }

    // all existing product are inside the productDetails.
    List<ProductDetails> products = response.productDetails;
    debugPrint('${products.first}');
    // Store the subscription and notify all listeners
    notifyListeners();
    return products;
  }

  //Subscription
  Future<AnyModel> subscription(Map<String,String> params,BuildContext context) async {
    var response = await postMethod("POST", AllKeys.subscription, params, null, context);
    var res = jsonDecode(response);
    return AnyModel.fromJson(res);
  }



}