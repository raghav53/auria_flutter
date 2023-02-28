import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/common.dart';
import '../../utils/strings.dart';
import '../Home/HomeScreen.dart';
import 'SignUpVM.dart';

class SignUpScreen extends StatefulWidget {
  static const String route = "SignUpScreenRoute";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  var vm = SignUpVM();



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            vm.backClick(context);
          },
        ),
      ),
      body: InkWell(
        onTap: (){
          hideKeyboard();
        },
        child: Stack(
          children: [
            backgroundImage(context),
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
                    Column(
                      children: [
                        Container(
                          height: 50,
                          margin: EdgeInsets.only(bottom: 20),
                          child: Center(
                            child: Common.boldText(Strings.register, 30, AppColor.whiteColor,TextAlign.start),
                          ),
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
                                        Common.commonText(Strings.createYourNewAccount, 20, AppColor.textColor,TextAlign.start),
                                        const SizedBox(height: 20,),

//_________________________________________First Name____________________________

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
                                                    keyboardType: TextInputType.name,
                                                    controller: vm.firstName,
                                                    style: TextStyle(color: AppColor.fieldTextColor),
                                                    maxLength: 10,
                                                    decoration: InputDecoration(
                                                        counterText: '',
                                                        border: InputBorder.none,
                                                        focusedBorder: InputBorder.none,
                                                        enabledBorder: InputBorder.none,
                                                        errorBorder: InputBorder.none,
                                                        disabledBorder: InputBorder.none,
                                                        contentPadding: const EdgeInsets.only(left: 2, bottom: 0, top: 0, right: 0),
                                                        hintText: Strings.firstName,
                                                        hintStyle: TextStyle(color: AppColor.fieldTextColor)),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset("assets/images/user_icon.png",height: 20,width: 20,),
                                                  SizedBox(width: 20,),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),

//_________________________________________Last Name____________________________

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
                                                    keyboardType: TextInputType.name,
                                                    controller: vm.lastName,
                                                    style: TextStyle(color: AppColor.fieldTextColor),
                                                    maxLength: 10,
                                                    decoration: InputDecoration(
                                                        counterText: '',
                                                        border: InputBorder.none,
                                                        focusedBorder: InputBorder.none,
                                                        enabledBorder: InputBorder.none,
                                                        errorBorder: InputBorder.none,
                                                        disabledBorder: InputBorder.none,
                                                        contentPadding: const EdgeInsets.only(left: 2, bottom: 0, top: 0, right: 0),
                                                        hintText: Strings.lastName,
                                                        hintStyle: TextStyle(color: AppColor.fieldTextColor)),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset("assets/images/user_icon.png",height: 20,width: 20,),
                                                  SizedBox(width: 20,),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),

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
                                                    keyboardType: TextInputType.emailAddress,
                                                    controller: vm.email,
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

//_________________________________________Confirm Password____________________________
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
                                                    obscureText: vm.obscureConfirm,
                                                    controller: vm.confirmPassword,
                                                    style: TextStyle(color: AppColor.fieldTextColor),
                                                    decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                        focusedBorder: InputBorder.none,
                                                        enabledBorder: InputBorder.none,
                                                        errorBorder: InputBorder.none,
                                                        disabledBorder: InputBorder.none,
                                                        contentPadding: const EdgeInsets.only(left: 2, bottom: 0, top: 0, right: 0),
                                                        hintText: Strings.confirmPassword,
                                                        hintStyle: TextStyle(color: AppColor.fieldTextColor)),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  InkWell(
                                                      onTap: (){

                                                        setState(() {
                                                          vm.showHideConfirmClick(context);
                                                        });

                                                      },
                                                      child: Image.asset(vm.showPassConfirm,height: 20,width: 20,)),
                                                  SizedBox(width: 20,),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),

                                        const SizedBox(height: 5,),

                                        InkWell(
                                          onTap: () {
                                            if(vm.validation()){
                                              hideKeyboard();
                                              vm.signUp(context);

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
                                                Common.boldText(Strings.register, 16, AppColor.whiteColor,TextAlign.start),
                                              ],
                                            ),
                                          ),
                                        ),

                                        const SizedBox(height: 20,),
                                        InkWell(
                                          onTap: () {
                                            vm.signInClick(context);
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Common.commonText(Strings.alreadyHaveAnAccount, 15, AppColor.textColor,TextAlign.start),
                                              Common.commonText(Strings.signIn, 15, AppColor.greenColor,TextAlign.start)
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
                        ),
                      ],
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
