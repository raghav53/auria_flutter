import 'package:auria_ai/screens/Home/HomeVM.dart';
import 'package:auria_ai/utils/all_keys.dart';
import 'package:auria_ai/utils/color.dart';
import 'package:auria_ai/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/strings.dart';

class MainDrawer extends StatelessWidget {

  MainDrawer({Key? key,}) : super(key: key);

  var vm = HomeVM();

  @override
  Widget build(BuildContext context) {

    return Container(

      alignment: Alignment.topLeft,
      width: MediaQuery.of(context).size.width / 1.4,
      height: MediaQuery.of(context).size.height,

      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(155),
        ),
      ),

      child: Stack(
        children: [
          ListView(
            children: <Widget>[
              Container(
                color: AppColor.greenColor,
                padding: EdgeInsets.fromLTRB(20, 20, 10, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 70,
                          width: 70,
                          child: Image.asset(
                            'assets/images/image_back.png',
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          alignment: Alignment.center,
                          child: Common.boldText(vm.firstAndLast(), 40, AppColor.greenColor,TextAlign.center),
                        ),
                      ],
                    ),
                    Common.boldText("${vm.firstName()}"" ${vm.lastName()}", 20, AppColor.whiteColor,TextAlign.start),
                    Common.commonText(vm.emailID().toString(), 15, AppColor.whiteColor,TextAlign.start)
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              _customListTile(
                  context: context,
                  title: Strings.newChat,
                  icon: 'assets/images/new_chat_icon.png',
                  onPressed: () async {

                    SharedPreferences srf = await SharedPreferences.getInstance();

                    vm.newChatClick(context,srf.getString(AllKeys.newChatProm).toString(),srf.getString(AllKeys.newChatDesc).toString());

                  }),
              _customListTile(
                  context: context,
                  title: Strings.savedChat,
                  icon: 'assets/images/save_chat_icon.png',
                  onPressed: () {
                    vm.saveChatClick(context);
                  }),
              _customListTile(
                  context: context,
                  title: Strings.subscription,
                  icon: 'assets/images/user_icon.png',
                  onPressed: () {
                    vm.subscriptionClick(context);
                  }),
              _customListTile(
                  context: context,
                  title: Strings.settings,
                  icon: 'assets/images/setting_icon.png',
                  onPressed: () {
                    vm.settingsClick(context);
                  }),
              _customListTile(
                  context: context,
                  title: Strings.logOut,
                  icon: 'assets/images/logout_icon.png',
                  onPressed: () {
                    vm.logoutClick(context);
                  }),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/drawer_img.png',
                      height: 250,
                      width: 200,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),

    );
  }

  Widget _customListTile({required BuildContext context, required String title,
    String? icon, Widget? leading, required VoidCallback onPressed,
    bool selected = false,}) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
        height: 50,
        child: Row(children: [
          Image.asset(
            icon!,
            height: 15,
            width: 15,
            color: AppColor.fieldTextColor,
          ),
          SizedBox(
            width: 10,
          ),
          Common.commonText(title, 17, AppColor.fieldTextColor,TextAlign.start),
        ]),
      ),
    );
  }

}
