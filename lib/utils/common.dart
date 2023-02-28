import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:just_audio/just_audio.dart';
import 'color.dart';


Pattern pattern =
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?)*$";


class Common{

  static Widget commonText(String s, double size, Color color, TextAlign align) {
    return Text(s, textAlign: align,
      style: TextStyle(
          fontSize: size,
          fontFamily: "Outfit-reg",
          color: color),
    );
  }

  static Widget boldText(String s, double size,Color color, TextAlign align) {
    return Text(s, textAlign: align,
      style: TextStyle(
          fontSize: size,
          fontFamily: "Outfit-bold",
          color: color),
    );
  }

  static Widget mediumText(String s, double size,Color color,TextAlign align) {
    return Text(s, textAlign: align,
      style: TextStyle(
          fontSize: size,
          fontFamily: "Outfit-Medium",
          color: color),
    );
  }


  static Widget noInternet(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/no_internet.png",height: 150,width: 150,),
              const SizedBox(height: 20,),
              Common.boldText("No Internet!", 25, AppColor.redColor,TextAlign.start),
            ],
          ),
        ),
      ),
    );
  }

}

Widget backgroundImage(BuildContext context){
 return Image.asset("assets/images/background_img.png",width: MediaQuery.of(context).size.width*1,fit: BoxFit.cover,);
}

void showToast(String msg) {
  Fluttertoast.showToast(
      msg: msg, // message
      backgroundColor: AppColor.greenColor,
      toastLength: Toast.LENGTH_SHORT, // length
      gravity: ToastGravity.BOTTOM, // location
      timeInSecForIosWeb: 3 // duration
  );
}

void showError(String msg) {
  Fluttertoast.showToast(
      msg: msg, // message
      backgroundColor: AppColor.textRed,
      toastLength: Toast.LENGTH_SHORT, // length
      gravity: ToastGravity.BOTTOM, // location
      timeInSecForIosWeb: 3 // duration
  );
}

void showLoader(BuildContext context){
  // EasyLoading.show(status: "Please wait...");
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return SimpleDialog(
        backgroundColor: Colors.transparent,//here set the color to transparent
        elevation: 0,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 10),
              const Text("", textAlign: TextAlign.center),
            ],
          ),
        ],
      );
    },
  );
}

void hideLoader(BuildContext context){
  Navigator.of(context).pop();
}

void hideKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

playSendTone() async {
  AudioPlayer player = AudioPlayer();
  await player.setAsset('assets/sounds/sendTone.mp3');
  player.play();
}

playReceiveTone() async {
  AudioPlayer player = AudioPlayer();
  await player.setAsset('assets/sounds/receiveTone.mp3');
  player.play();
}