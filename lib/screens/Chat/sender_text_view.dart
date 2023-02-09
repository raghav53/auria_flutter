import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../../utils/common.dart';
import 'ChatVM.dart';

class SenderTextView extends StatefulWidget {

  LocalChatData chatData;
  SenderTextView({Key? key,required this.chatData,required this.email}) : super(key: key);
  String email = '';
  @override
  State<SenderTextView> createState() => _SenderTextViewState();
}

class _SenderTextViewState extends State<SenderTextView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: const EdgeInsets.only(left: 20.0,top: 20,right: 20.0),
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
        decoration: BoxDecoration(
            color: AppColor.fieldColor,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
            boxShadow: [BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 3,
                offset: Offset(0,2)
            )]
        ),
        child: Common.commonText(widget.chatData.humanMesasge.replaceFirst('\n', '',1), 17, AppColor.fieldTextColor, TextAlign.start),
      ),
    );
  }
}
