import 'dart:ui';
import 'package:auria_ai/utils/color.dart';
import 'package:auria_ai/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ChatVM.dart';

class ReceiverTextView extends StatefulWidget {
  LocalChatData chatData;

  ReceiverTextView({Key? key, required this.chatData}) : super(key: key);

  @override
  State<ReceiverTextView> createState() => _ReceiverTextViewState();
}

class _ReceiverTextViewState extends State<ReceiverTextView> {

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.only(
            left: 10.0, top: 20, right: 20.0, bottom: 4),
        decoration: BoxDecoration(
            color: AppColor.greenColor,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            boxShadow: [BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 3,
                offset: Offset(0, 2)
            )
            ]
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Common.commonText(
            widget.chatData.aiMessage.replaceFirst('\n', '', 1), 17,
            AppColor.whiteColor, TextAlign.start),
      ),
    );
  }
}
