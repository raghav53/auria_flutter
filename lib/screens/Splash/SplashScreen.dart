import 'package:auria_ai/screens/Splash/SplashVM.dart';
import 'package:auria_ai/utils/color.dart';
import 'package:auria_ai/utils/strings.dart';
import 'package:flutter/material.dart';

import '../../utils/common.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  var vm = SplashVM();

  @override
  void initState() {
    super.initState();
    vm.profile(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backgroundImage(context),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Common.boldText(Strings.appName, 45, AppColor.whiteColor,TextAlign.start),
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Image.asset("assets/images/splash_image.png"),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: AppColor.greenColor,
        child: InkWell(
          onTap: (){
            vm.nextPage(context);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 50),
                decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    border: Border.all(
                      color: AppColor.whiteColor,
                    ),
                    borderRadius: const BorderRadius.all(
                        Radius.circular(35))
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 8, 10),
                  child: Image.asset("assets/images/play.png",height: 30,width: 30,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

