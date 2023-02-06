
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../dialogs/paymentSuccess/PaymentSuccessDialog.dart';

class CardInfoVM with ChangeNotifier{


  void backClick(BuildContext context) {
    Navigator.pop(context);
  }


  void makePayment(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) =>
      const PaymentSuccessDialog(),
    );
  }


}