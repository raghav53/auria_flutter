import 'dart:convert';
import 'package:auria_ai/dialogs/logout/LogoutVM.dart';
import 'package:auria_ai/screens/Home/HomeScreen.dart';
import 'package:auria_ai/utils/color.dart';
import 'package:flutter/material.dart';

import '../../utils/common.dart';
import '../../utils/strings.dart';


class PaymentSuccessDialog extends StatefulWidget {


  const PaymentSuccessDialog({Key? key})
      : super(key: key);

  @override
  State<PaymentSuccessDialog> createState() => _PaymentSuccessDialog();
}

class _PaymentSuccessDialog extends State<PaymentSuccessDialog> {

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width*100,
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white, //Colors.black.withOpacity(0.3),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,// To make the card compact
            children: <Widget>[
              Image.asset("assets/images/payment_sucess_icon.png",height: 75,width: 75,),
              const SizedBox(height: 10,),
              Common.boldText(Strings.confirmation, 25, AppColor.textColor, TextAlign.center),
              const SizedBox(height: 10,),
              Common.commonText(Strings.yourSubscriptionIsNowActive,15,AppColor.textColor,TextAlign.center),
              const SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.only(left: 10,right: 10),
                child: SizedBox(
                  height: 45,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen()), (route) => false);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: AppColor.greenColor, backgroundColor: AppColor.greenColor,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(25), // <-- Radius
                        ),
                      ),
                      child:  Padding(
                        padding: const EdgeInsets.only(right: 25,left: 25),
                        child: Text(
                          Strings.goDashboard,
                          style: const TextStyle(
                              fontFamily: 'Poppins-Medium',
                              color: Colors.white,
                              fontSize: 17),
                        ),
                      )),
                ),
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ],
    );
  }
}
