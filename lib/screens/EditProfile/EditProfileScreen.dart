import 'package:auria_ai/screens/EditProfile/EditProfileVM.dart';
import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/common.dart';
import '../../utils/strings.dart';

class EditProfileScreen extends StatefulWidget {
  static const String route = "EditProfileScreenRoute";
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  var vm = EditProfileVM();

  @override
  void initState() {
    super.initState();
    vm.getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/background_img.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Center(child: Text(Strings.editProfile, textAlign: TextAlign.center)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              vm.backClick(context);
            },
          ),
        ),
        body: InkWell(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.30,
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


                                    const SizedBox(height: 5,),
                                    InkWell(
                                      onTap: () {
                                        if(vm.validation()){
                                          vm.updateProfile(context);
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
        ),
      ),
    );
  }
}
