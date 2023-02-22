import 'package:auria_ai/screens/Home/HomeVM.dart';
import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../../utils/common.dart';
import '../../utils/strings.dart';
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
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/background_img.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        key: vm.scaffoldKey,
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Common.mediumText(Strings.dashboard, 20, AppColor.whiteColor, TextAlign.start),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Image.asset(
              "assets/images/menu_icon.png",
              width: 27,
              height: 27,
            ),
            onPressed: () {
              vm.scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Common.commonText("Hi ${vm.firstName()}" " ${vm.lastName()}", 20, AppColor.whiteColor, TextAlign.start),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                text: TextSpan(
                  text: Strings.freeTrialEnd,
                  style: TextStyle(fontSize: 23, fontFamily: "Outfit-Medium", color: AppColor.whiteColor),
                  /*defining default style is optional */
                  children: <TextSpan>[
                    TextSpan(text: ' 10-02-2023', style: TextStyle(color: AppColor.liteGreen)),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Flexible(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColor.fieldColor, border: Border.all(color: AppColor.fieldColor), borderRadius: BorderRadius.circular(30)),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: AppColor.fieldTextColor),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            suffixIcon: Icon(
                              Icons.mic_none_rounded,
                              color: AppColor.fieldTextColor,
                              size: 35,
                            ),
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                            hintText: Strings.searchHere,
                            hintStyle: TextStyle(color: AppColor.fieldTextColor)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 7),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                      border: Border.all(color: AppColor.whiteColor),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.only(top: 12, bottom: 10, left: 10, right: 12),
                    child: Image.asset(
                      "assets/images/send_message_icon.png",
                      height: 30,
                      width: 30,
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  border: Border.all(color: AppColor.whiteColor),
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                ),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Common.mediumText(Strings.category, 20, AppColor.textColor, TextAlign.start),
                    const SizedBox(
                      height: 20,
                    ),
                    Flexible(child: categoryList()),
                  ],
                ),
              ),
            )
          ],
        ),
        drawer: MainDrawer(),
      ),
    );
  }

  Widget categoryList() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 15, mainAxisSpacing: 15),
      itemCount: vm.listImages.length,
      itemBuilder: (BuildContext context, int index) {
        return ChoiceChip(
          backgroundColor: AppColor.fieldColor,
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          label: Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    vm.listImages[index].toString(),
                    height: 40,
                    width: 40,
                    color: AppColor.fieldTextColor,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    vm.listTitles[index].toString(),
                    style: TextStyle(
                      fontFamily: "Outfit-reg",
                      fontSize: 14,
                      color:  AppColor.fieldTextColor,
                    ),
                  )
                ],
              ),
            ),
          ),
          selected: (vm.choise == vm.listTitles[index].toString()) ? true : false,
          selectedColor: AppColor.fieldColor,
          onSelected: (bool value) {
            vm.newChatClick(context);
          },
        );
      },
    );
  }

}
