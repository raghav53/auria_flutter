import 'dart:convert';

import 'package:auria_ai/apis/api_controller.dart';
import 'package:auria_ai/screens/Home/HomeVM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/all_keys.dart';
import '../../utils/color.dart';
import '../../utils/common.dart';
import '../../utils/strings.dart';
import '../SignUp/SignUpModel.dart';
import 'MainDrawer.dart';

class HomeScreen extends StatefulWidget {

  static const String route = "HomeScreenRoute";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  var vm = HomeVM();




  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
          create: (BuildContext context) {
            HomeVM();
          },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        key: vm.scaffoldKey,
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Common.mediumText(Strings.dashboard,20,AppColor.whiteColor,TextAlign.start),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Image.asset("assets/images/menu_icon.png",width: 27,height: 27,),
            onPressed: () {
              vm.scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),

        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            backgroundImage(context),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Common.commonText("Hi ${vm.firstName()}"" ${vm.lastName()}", 20, AppColor.whiteColor,TextAlign.start),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 20),
                    child: RichText(
                      text: TextSpan(
                        text: Strings.freeTrialEnd,
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: "Outfit-Medium",
                            color: AppColor.whiteColor), /*defining default style is optional */
                        children: <TextSpan>[
                          TextSpan(
                              text: ' 10-02-2023', style: TextStyle(fontSize: 25,
                              fontFamily: "Outfit-Medium",
                              color: AppColor.liteGreen)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.77,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColor.fieldColor,
                              border: Border.all(color: AppColor.fieldColor),
                              borderRadius: BorderRadius.circular(30)),
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                                    controller: vm.search,
                                    style: TextStyle(color: AppColor.fieldTextColor),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        contentPadding: const EdgeInsets.only(left: 2, bottom: 0, top: 0, right: 0),
                                        hintText: Strings.searchHere,
                                        hintStyle: TextStyle(color: AppColor.fieldTextColor)),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Image.asset("assets/images/mike_icon.png",height: 20,width: 20,),
                                  SizedBox(width: 20,),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColor.whiteColor,
                              border: Border.all(color: AppColor.whiteColor),
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5,right: 5),
                            child: Image.asset("assets/images/send_message_icon.png",height: 25,width: 25,),
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                      border: Border.all(color: AppColor.whiteColor),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.55,
                    padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Common.mediumText(Strings.category, 20, AppColor.textColor,TextAlign.start),
                        ),
                        const SizedBox(height: 20,),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.43,
                          child: categoryList(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),

        drawer: MainDrawer(),

      ),
    );
  }

  Widget categoryList() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: vm.listImages.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        String name = '';
        String icon = '';
        name = vm.listTitles[index].toString();
        icon = vm.listImages[index].toString();

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(child: ChoiceChip(
            backgroundColor: AppColor.fieldColor,
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            label: Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      icon,
                      height: 40,
                      width: 40,
                      color: (vm.choise == name) ? Colors.white : AppColor.fieldTextColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        fontFamily: "Outfit-reg",
                        fontSize: 14,
                        color: (vm.choise == name) ? Colors.white : AppColor.fieldTextColor,),
                    )
                  ],
                ),
              ),
            ),
            selected: (vm.choise == name)?true:false,

            selectedColor: AppColor.greenColor,
            onSelected: (bool value){
              setState(() {
                vm.choise = name;
              });
            },),),
        );
      },
    );
  }

}
