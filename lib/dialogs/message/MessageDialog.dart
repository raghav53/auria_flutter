import 'package:auria_ai/dialogs/logout/LogoutVM.dart';
import 'package:auria_ai/screens/Chat/ChatVM.dart';
import 'package:auria_ai/utils/color.dart';
import 'package:flutter/material.dart';
import '../../utils/common.dart';
import '../../utils/strings.dart';


class MessageDailog extends StatefulWidget {

  LocalChatData chatData;

   MessageDailog({Key? key, required this.chatData}) : super(key: key);
  @override
  State<MessageDailog> createState() => _MessageDailog();

}

class _MessageDailog extends State<MessageDailog> {


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
    return Container(
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,// To make the card compact
        children: <Widget>[

          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/copy_icon.png",height: 35,width: 35,),
              const SizedBox(height: 5,),
              Common.commonText("Copy\nmessage", 12, AppColor.black, TextAlign.center)
            ],
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/reuse_message.png",height: 35,width: 35,),
              const SizedBox(height: 5,),
              Common.commonText("Regenerate\nmessage", 12, AppColor.black, TextAlign.center)
            ],
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/share_chat.png",height: 35,width: 35,),
              const SizedBox(height: 5,),
              Common.commonText("Share\nmessage", 12, AppColor.black, TextAlign.center)
            ],
          ),

        ],
      ),

    );
  }

}
