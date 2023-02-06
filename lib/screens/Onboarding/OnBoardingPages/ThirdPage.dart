import 'package:auria_ai/utils/color.dart';
import 'package:auria_ai/utils/common.dart';
import 'package:auria_ai/utils/strings.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backgroundImage(context),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.60,
            child: Center(
              child: Image.asset(
                "assets/images/third_page.png",
                width: 140,
                height: 140,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.12,
                  color: AppColor.whiteColor,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      elevation: 5,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only( topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                      ),
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.whiteColor,
                            border: Border.all(color: AppColor.whiteColor),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 20,),
                                Common.boldText(Strings.discover, 32, AppColor.textColor,TextAlign.start),
                                SizedBox(height: 20,),
                                Common.commonText(Strings.firstPageDec, 15, AppColor.textColor,TextAlign.center),
                                SizedBox(height: 20,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
