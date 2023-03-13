
import 'package:auria_ai/utils/common.dart';
import 'package:flutter/material.dart';

import '../../utils/color.dart';

class EmptyChatView extends StatefulWidget {
  final Function(String str) promptTapped;
  String desc;
  EmptyChatView({Key? key, required this.promptTapped, required this.desc}) : super(key: key);

  @override
  State<EmptyChatView> createState() => _EmptyChatViewState();
}

class _EmptyChatViewState extends State<EmptyChatView> {

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SizedBox(height: 20,),
        Image.asset('assets/images/sun_icon.png',width: 20,),
        SizedBox(height: 5,),
        Common.mediumText('Examples', 15, AppColor.textColor, TextAlign.center),
        InkWell(
          onTap: (){
            debugPrint('Prompt Tapped========>');
            widget.promptTapped(widget.desc);
          },
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
            decoration: BoxDecoration(
              color: AppColor.fieldColor,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Common.mediumText(widget.desc, 14, AppColor.fieldTextColor, TextAlign.center),
          ),
        ),
      /*  const SizedBox(height: 20,),
        Image.asset('assets/images/limitatuin_icon.png',width: 20,),
        const SizedBox(height: 5,),
        Common.mediumText('Limitations', 15, AppColor.textColor, TextAlign.center),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
          decoration: BoxDecoration(
              color: AppColor.fieldColor,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Common.mediumText("Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis.", 14, AppColor.fieldTextColor, TextAlign.center),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 4),
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
          decoration: BoxDecoration(
              color: AppColor.fieldColor,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Common.mediumText("Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis.", 14, AppColor.fieldTextColor, TextAlign.center),
        )*/
      ],
    );
  }
}
