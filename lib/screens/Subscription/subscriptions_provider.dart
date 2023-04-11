import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class SubscriptionsProvider extends ChangeNotifier {
  // save the stream to cancel it onDone
  late StreamSubscription _streamSubscription;
  Function(PurchaseDetails)? onPurchaseComplete;
  Function(PurchaseDetails)? pRestoreDetails;
  var i = 0;

  static SubscriptionsProvider instance = SubscriptionsProvider();

  SubscriptionsProvider() {
    final Stream<List<PurchaseDetails>> purchaseUpdated =
        InAppPurchase.instance.purchaseStream;

    _streamSubscription = purchaseUpdated.listen((purchaseDetailsList) {
      // Handle the purchased subscriptions

      _purchaseUpdate(purchaseDetailsList);
    }, onDone: () {
      debugPrint('Subscription Done here');
      if (defaultTargetPlatform == TargetPlatform.iOS) {
      }
      _streamSubscription.cancel();
    }, onError: (error) {
      if (defaultTargetPlatform == TargetPlatform.iOS) {

      }
      debugPrint('${error.toString()}');
      // handle the error
    });
  }

  _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    // Purchased Subscriptions
  }

  _purchaseUpdate(List<PurchaseDetails> purchaseDetailsList) {
    // check each item in the provider list
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      // Sometimes the purchase is not completely done yet, in this case, show the pending UI again.
      if (purchaseDetails.status == PurchaseStatus.pending) {
        if (defaultTargetPlatform == TargetPlatform.iOS) {

        }
        debugPrint(
            'Purchase UPdate Pending shows :- ${purchaseDetails.productID}');
        // _showPendingUI();
      } else {
        // The status is NOT pending, lets check for an error
        if (purchaseDetails.status == PurchaseStatus.error) {
          if (defaultTargetPlatform == TargetPlatform.iOS) {

          }
          debugPrint('Purchase error --->${purchaseDetails.error}');
          // This happens if you close the app or dismiss the purchase dialog.
          // _handleError(purchaseDetails.error!);
        } else if (purchaseDetails.status == PurchaseStatus.restored) {
          if (defaultTargetPlatform == TargetPlatform.iOS) {

          }
          if (pRestoreDetails != null) {
            pRestoreDetails!(purchaseDetails);
            if (i == 0) {
              pRestoreDetails!(purchaseDetails);
              i += 1;
            }
          }

          debugPrint('Purchase Restored :- ${purchaseDetails.productID}');
        } else if (purchaseDetails.status == PurchaseStatus.purchased) {
          if (defaultTargetPlatform == TargetPlatform.iOS) {

          }

          debugPrint(
              'Purchase Update Purchased shows :- ${purchaseDetails.productID}');
          debugPrint('Purchased here');
          // Huge SUCCESS! This case handles the happy case whenever the user purchased or restored the purchase
          _verifyPurchaseAndEnablePremium(purchaseDetails);
          if (onPurchaseComplete != null) {
            if (i == 0) {
              onPurchaseComplete!(purchaseDetails);
              i += 1;
            }
          }
        }
        // Whenever the purchase is done, complete it by calling complete.
        if (purchaseDetails.pendingCompletePurchase) {
          if (defaultTargetPlatform == TargetPlatform.iOS) {

          }
          debugPrint(
              'Purchase UPdate Pending Complete shows :- ${purchaseDetails.productID}');
          await InAppPurchase.instance.completePurchase(purchaseDetails);
        }
      }
    });
  }

  _verifyPurchaseAndEnablePremium(PurchaseDetails purchaseDetails) {
    // check if the purchase is valid by calling your server including the receipt data.
    //   bool valid = await _verifyPurchase(purchaseDetails);
    // if (valid) {
    // Purchase is valid, time to enable all subscription features.
    //     _enablePremiumFeatures(purchaseDetails);
    //   } else {

    // The receipt is not valid. Don't enable any subscription features.
    // _handleInvalidPurchase(purchaseDetails);
    //  }
  }

  Future<List<ProductDetails>> fetchSubscriptions() async {
    final bool available = await InAppPurchase.instance.isAvailable();
    if (!available) {
      // The store cannot be reached or accessed.
      // This could also be the case if you run the app on emulator.
      // Please use a physical device for testing.
      debugPrint('Unable to reach to store');
      if (defaultTargetPlatform == TargetPlatform.iOS) {

      }
    }

    const Set<String> _iosSubscriptionIds = <String>{
      'com.jarvis.weekly',
      'com.jarvis.monthly'
    };

    const Set<String> _androidSubscriptionIds = <String>{
      'com_jarvis_weekly',
      'com_jarvis_monthly'
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

  restorePurchases(Function(PurchaseDetails) restoreDetails) async {
    pRestoreDetails = restoreDetails;
    await InAppPurchase.instance.restorePurchases();
    notifyListeners();
  }

  buySubscription(ProductDetails productToBuy, Function(PurchaseDetails) onComplete) {
    debugPrint('Item to purchase-->${productToBuy.id}');
    onPurchaseComplete = onComplete;
    PurchaseParam purchaseParam = PurchaseParam(productDetails: productToBuy);

    InAppPurchase.instance.buyNonConsumable(purchaseParam: purchaseParam);
  }
}
