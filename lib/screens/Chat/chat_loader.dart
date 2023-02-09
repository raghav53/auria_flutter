import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../utils/color.dart';


class ChatLoader extends StatefulWidget {
  const ChatLoader({Key? key}) : super(key: key);

  @override
  State<ChatLoader> createState() => _ChatLoaderState();
}

class _ChatLoaderState extends State<ChatLoader> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,top: 20,right: 20.0,bottom: 4),
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.fieldColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 3,
                offset: Offset(0,2)
            )]
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset: Offset(0,2)

                      )]
                  ),
                  child: Image.asset('assets/images/apple_icon.png',width: 20,),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Center(
                  child: LoadingAnimationWidget.horizontalRotatingDots(
                    color: AppColor.greenColor,
                    size: 27,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
