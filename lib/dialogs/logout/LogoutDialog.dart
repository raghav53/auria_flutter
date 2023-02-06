import 'dart:convert';
import 'package:auria_ai/dialogs/logout/LogoutVM.dart';
import 'package:auria_ai/utils/color.dart';
import 'package:flutter/material.dart';

import '../../screens/Login/LoginScreen.dart';
import '../../utils/common.dart';
import '../../utils/strings.dart';


class LogoutConfirmation extends StatefulWidget {


  const LogoutConfirmation({Key? key})
      : super(key: key);

  @override
  State<LogoutConfirmation> createState() => _LogoutConfirmation();
}

class _LogoutConfirmation extends State<LogoutConfirmation> {

  var vm = LogoutVM();
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

              Common.boldText(Strings.logOut, 25, AppColor.textColor, TextAlign.center),

              const SizedBox(height: 10,),

              Common.commonText(Strings.areYouSureYouWantToLogout,15,AppColor.textColor,TextAlign.center),

              const SizedBox(height: 20,),

              Container(
                margin: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 80,
                      child: ElevatedButton(
                          onPressed: () {
                            // vm.logout(context);
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LoginScreen()), (route) => false);
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: AppColor.greenColor, backgroundColor: AppColor.greenColor,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(25), // <-- Radius
                            ),
                          ),
                          child:  Text(
                            Strings.yes,
                            style: const TextStyle(
                                fontFamily: 'Poppins-Medium',
                                color: Colors.white,
                                fontSize: 17),
                          )),
                    ),
                    SizedBox(
                      height: 40,
                      width: 80,
                      child: ElevatedButton(
                          onPressed: () {
                            vm.noClick(context);
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: AppColor.fieldColor, backgroundColor: AppColor.fieldColor,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(25), // <-- Radius
                            ),
                          ),
                          child:  Text(
                            Strings.no,
                            style:  TextStyle(
                                fontFamily: 'Poppins-Medium',
                                color: AppColor.fieldTextColor,
                                fontSize: 17),
                          )),
                    ),
                  ],
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
