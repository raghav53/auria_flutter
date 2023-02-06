import 'package:auria_ai/screens/ChangePassword/ChangePasswordVM.dart';
import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/common.dart';
import '../../utils/strings.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String route = "ChangePasswordScreenRoute";
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  
  var vm = ChangePasswordVM();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Center(child: Text(Strings.changePassword, textAlign: TextAlign.center)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            vm.backClick(context);
          },
        ),
      ),
      body: Stack(
        children: [
          backgroundImage(context),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.60,
            child: Center(
              child: Common.boldText(Strings.appName, 60, AppColor.whiteColor,TextAlign.start),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
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
                                const SizedBox(height: 30,),

//_________________________________________Old Password____________________________
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
                                            obscureText: vm.obscureOld,
                                            controller: vm.oldPassword,
                                            style: TextStyle(color: AppColor.fieldTextColor),
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                contentPadding: const EdgeInsets.only(left: 2, bottom: 0, top: 0, right: 0),
                                                hintText: Strings.oldPassword,
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

//_________________________________________New Password____________________________
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
                                            obscureText: vm.obscureNew,
                                            controller: vm.newPassword,
                                            style: TextStyle(color: AppColor.fieldTextColor),
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                contentPadding: const EdgeInsets.only(left: 2, bottom: 0, top: 0, right: 0),
                                                hintText: Strings.newPassword,
                                                hintStyle: TextStyle(color: AppColor.fieldTextColor)),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                              onTap: (){

                                                setState(() {
                                                  vm.showHideNewClick(context);
                                                });

                                              },
                                              child: Image.asset(vm.showPassNew,height: 20,width: 20,)),
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
                                                hintText: Strings.newPassword,
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
                                      // vm.changePassword(context);
                                      Navigator.pop(context);
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
                                        Common.boldText(Strings.submit, 16, AppColor.whiteColor,TextAlign.start),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30,),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
