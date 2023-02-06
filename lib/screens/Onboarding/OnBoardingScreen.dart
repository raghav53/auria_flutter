import 'package:auria_ai/screens/Onboarding/OnBoardingPages/ThirdPage.dart';
import 'package:auria_ai/screens/Onboarding/OnBoardingVM.dart';
import 'package:auria_ai/utils/color.dart';
import 'package:auria_ai/utils/common.dart';
import 'package:auria_ai/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'OnBoardingPages/FirstPage.dart';
import 'OnBoardingPages/FourthPage.dart';
import 'OnBoardingPages/SecondPage.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String route = "OnBoardingRoute";
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var vm = OnBoardingVM();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: vm.pageController,
        onPageChanged: (index){
          if(index == 3){
            vm.isLast = true;
          }
        },
        children: const [
          FirstPage(),
          SecondPage(),
          ThirdScreen(),
          FourthPage()
        ],
      ),
      bottomNavigationBar: Container(
        color: AppColor.whiteColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmoothPageIndicator(
              controller: vm.pageController,
              count: 4,
              effect: WormEffect(
                dotHeight: 8,
                dotWidth: 8,
                activeDotColor: AppColor.greenColor,
                type: WormType.thin,
              ),
            ),
            InkWell(
              onTap: () {
               vm.nextPage(context);
              },
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width * 1,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(
                    top: 30, right: 50, left: 50, bottom: 20),
                decoration: BoxDecoration(
                    color: AppColor.greenColor,
                    border: Border.all(color: AppColor.greenColor),
                    borderRadius: BorderRadius.circular(30)),
                child: Common.boldText(Strings.next, 20, AppColor.whiteColor,TextAlign.start),
              ),
            ),
            InkWell(
              onTap: (){
                vm.skipClick(context);
              },
                child: Common.commonText(Strings.skip, 18, AppColor.textColor,TextAlign.start)),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
