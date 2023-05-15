import 'dart:ui';
import 'package:auria_ai/utils/color.dart';
import 'package:auria_ai/utils/common.dart';
import 'package:auria_ai/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import 'ChatVM.dart';

class ReceiverTextView extends StatefulWidget {
  final Function regeratedTapped;
  LocalChatData chatData;
  bool isLast;
  ChatVM vm;
  ReceiverTextView({Key? key, required this.chatData, required this.isLast, required this.vm, required this.regeratedTapped}) : super(key: key);

  @override
  State<ReceiverTextView> createState() => _ReceiverTextViewState();
}

class _ReceiverTextViewState extends State<ReceiverTextView> {

  @override
  Widget build(BuildContext context) {
/*
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
*/
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,top: 20,right: 20.0,bottom: 4),
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: AppColor.greenColor,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  boxShadow: [BoxShadow(
                      color:AppColor.liteDarkGray,
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(0,2)
                  )]
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Common.commonText(
                              widget.chatData.aiMessage.replaceFirst('\n', '', 1), 17,
                              AppColor.whiteColor, TextAlign.start),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            children: [

                              Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: InkWell(
                                    onTap: (){

                                      Share.share("${widget.chatData.aiMessage.replaceFirst('\n', '', 1)}",subject: "Auria Ai");

                                    },
                                    child: Image.asset('assets/images/share_chat.png',width: 25,)),
                              ),
                              // InkWell(child: Padding(
                              //   padding: const EdgeInsets.only(right: 8.0,bottom: 10,top: 5),
                              //   child: Image.asset('assets/images/chat_delete.png',width: 25,),
                              // )),
                              InkWell(
                                  onTap: () async {
                                    await Clipboard.setData(ClipboardData(text: widget.chatData.aiMessage));
                                    if (!mounted){return;}
                                    showToast('Copied');
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0,bottom: 10,top: 5),
                                    child: Image.asset('assets/images/copy_icon.png',width: 25,),
                                  ))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            if (widget.isLast)
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: (){
                      widget.regeratedTapped();
                    },
                    child: Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:Colors.white,
                          boxShadow: [BoxShadow(
                              offset: Offset(1,1),
                              spreadRadius: 1,
                              blurRadius: 2,
                              color:Colors.grey.withOpacity(0.3)
                          )]

                      ),
                      child: Row(

                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0,right: 10),
                            child: Icon(Icons.settings_backup_restore,color: AppColor.greenColor,),
                          ),
                          Text('Regenerate',
                            style: TextStyle(
                                color:  AppColor.liteGrayColor
                            ),),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
