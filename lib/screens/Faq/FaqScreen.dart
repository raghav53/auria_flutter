import 'package:auria_ai/screens/Faq/FaqVM.dart';
import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/common.dart';
import '../../utils/strings.dart';

class FaqScreen extends StatefulWidget {
  static const String route = "FaqScreenRoute";
  const FaqScreen({Key? key}) : super(key: key);

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  var vm = FaqVM();


  @override
  void initState() {
    super.initState();

    vm.getFaq(context);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Common.mediumText(
            Strings.faqs, 20, AppColor.whiteColor, TextAlign.start),
        backgroundColor: Colors.transparent,
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
          Container(
            margin: const EdgeInsets.only(top: 83.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                saveChatList()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget saveChatList() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.85,
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        border: Border.all(color: AppColor.whiteColor),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      padding: const EdgeInsets.fromLTRB(15, 25, 15, 10),
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(top: 5, bottom: 5),
              decoration: BoxDecoration(
                  color: AppColor.fieldColor,
                  border: Border.all(color: AppColor.fieldColor),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if(vm.faqClick == index){
                      vm.faqClick = -1;
                    }else{
                      vm.faqClick = index;
                    }

                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5,bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Common.commonText("Why do we use it?", 19,
                                AppColor.textColor, TextAlign.start),
                            width: MediaQuery.of(context).size.width*0.70,
                          ),
                          Container(
                            child: vm.faqClick == index
                                ? Image.asset(
                                    "assets/images/arrow_up.png",
                                    height: 15,
                                    width: 15,
                                    color: AppColor.fieldTextColor,
                                  )
                                : Image.asset(
                                    "assets/images/arrow_down.png",
                                    height: 15,
                                    width: 15,
                                    color: AppColor.fieldTextColor,
                                  ),
                          ),
                        ],
                      ),
                    ),
                    (vm.faqClick == index)? const SizedBox(height: 10,): const SizedBox(),
                    Container(
                      child: vm.faqClick == index
                          ? Common.mediumText(
                              "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
                              17,
                              AppColor.fieldTextColor,
                              TextAlign.start)
                          : SizedBox(),
                    ),
                    (vm.faqClick == index)? const SizedBox(height: 10,): const SizedBox(),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
