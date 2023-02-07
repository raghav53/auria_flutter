import 'package:auria_ai/screens/Login/LoginVM.dart';
import 'package:auria_ai/screens/Welcome/WelcomeScreenVM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/color.dart';
import '../../utils/common.dart';
import '../../utils/strings.dart';

class LoginScreen extends StatefulWidget {

  static const String route = "LoginScreenRoute";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {

  var vm = LoginVM();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: InkWell(
        onTap: (){
          hideKeyboard();
        },
        child: Stack(
          children: [
            backgroundImage(context),
            Container(
                height: 50,
                margin: EdgeInsets.only(top: 100),
                child: Center(
                  child: Common.boldText(Strings.welcomeBack, 30, AppColor.whiteColor,TextAlign.start),
                ),
              ),

            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      color: AppColor.whiteColor,
                    ),
                    Card(
                      elevation: 5,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only( topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                      ),
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColor.whiteColor,
                              border: Border.all(color: AppColor.whiteColor),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40)),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 30, 5, 0),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Common.commonText(Strings.signInYourAccount, 20, AppColor.textColor,TextAlign.start),
                                    const SizedBox(height: 20,),

//_________________________________________Email____________________________

                                    Container(
                                      height: 50,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: AppColor.fieldColor,
                                          border: Border.all(color: AppColor.fieldColor),
                                          borderRadius: BorderRadius.circular(30)),
                                      margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width*0.55,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 20),
                                              child: TextFormField(
                                                cursorColor: Colors.black,
                                                controller: vm.email,
                                                keyboardType: TextInputType.emailAddress,
                                                style: TextStyle(color: AppColor.fieldTextColor),
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    focusedBorder: InputBorder.none,
                                                    enabledBorder: InputBorder.none,
                                                    errorBorder: InputBorder.none,
                                                    disabledBorder: InputBorder.none,
                                                    contentPadding: const EdgeInsets.only(left: 2, bottom: 0, top: 0, right: 0),
                                                    hintText: Strings.email,
                                                    hintStyle: TextStyle(color: AppColor.fieldTextColor)),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Image.asset("assets/images/mail_icon.png",height: 20,width: 20,),
                                              SizedBox(width: 20,),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

//_________________________________________Password____________________________

                                    Container(
                                      height: 50,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: AppColor.fieldColor,
                                          border: Border.all(color: AppColor.fieldColor),
                                          borderRadius: BorderRadius.circular(30)),
                                      margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width*0.55,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 20),
                                              child: TextFormField(
                                                cursorColor: Colors.black,
                                                keyboardType: TextInputType.text,
                                                controller: vm.password,
                                                obscureText: vm.obscureText,
                                                style: TextStyle(color: AppColor.fieldTextColor),
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    focusedBorder: InputBorder.none,
                                                    enabledBorder: InputBorder.none,
                                                    errorBorder: InputBorder.none,
                                                    disabledBorder: InputBorder.none,
                                                    contentPadding: const EdgeInsets.only(left: 2, bottom: 0, top: 0, right: 0),
                                                    hintText: Strings.password,
                                                    hintStyle: TextStyle(color: AppColor.fieldTextColor)),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              InkWell(
                                                  onTap: (){
                                                    setState(() {
                                                      vm.showHideClick(context);
                                                    });
                                                  },
                                                  child: Image.asset(vm.showPass,height: 20,width: 20,)),
                                              SizedBox(width: 20,),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 5,),
                                    InkWell(
                                      onTap: (){
                                        vm.clickForgotPassword(context);
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(right: 35),
                                        alignment: Alignment.topRight,
                                        child: Common.boldText(Strings.forgotPassword, 15, AppColor.textColor,TextAlign.start),
                                      ),
                                    ),
                                    const SizedBox(height: 5,),
                                    InkWell(
                                      onTap: () {

                                        if(vm.validation()){
                                          hideKeyboard();
                                          vm.signIn(context);
                                        }

                                      },
                                      child: Container(
                                        height: 45,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: AppColor.greenColor,
                                            border: Border.all(color: AppColor.greenColor),
                                            borderRadius: BorderRadius.circular(30)),
                                        margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Common.boldText(Strings.signIn, 16, AppColor.whiteColor,TextAlign.start),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5,),
                                    Center(
                                      child: Common.commonText("OR", 16, AppColor.black,TextAlign.start),
                                    ),
                                    const SizedBox(height: 5,),
                                    InkWell(
                                      onTap: () {
                                        vm.clickApple(context);
                                      },
                                      child: Container(
                                        height: 45,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: AppColor.fieldColor,
                                            border: Border.all(color: AppColor.fieldColor),
                                            borderRadius: BorderRadius.circular(30)),
                                        margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset("assets/images/apple_icon.png",height: 25,width: 25,),
                                            const SizedBox(width: 15,),
                                            Common.boldText(Strings.signInWitheApple, 16, AppColor.fieldTextColor,TextAlign.start),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        vm.clickGmail(context);
                                      },
                                      child: Container(
                                        height: 45,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: AppColor.fieldColor,
                                            border: Border.all(color: AppColor.fieldColor),
                                            borderRadius: BorderRadius.circular(30)),
                                        margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset("assets/images/google_icon.png",height: 25,width: 25,),
                                            const SizedBox(width: 15,),
                                            Common.boldText(Strings.signInWitheGoogle, 16, AppColor.fieldTextColor,TextAlign.start),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20,),
                                    InkWell(
                                      onTap: () {
                                        vm.signUpClick(context);
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Common.commonText(Strings.dontHaveAnAccount, 15, AppColor.textColor,TextAlign.start),
                                          Common.commonText(Strings.signUp, 15, AppColor.greenColor,TextAlign.start)
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 30,),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

  }
}

