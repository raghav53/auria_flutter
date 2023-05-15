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

    init();

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
        body: Container(
          margin: const EdgeInsets.only(top: 83.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              saveChatList()
            ],
          ),
        ),
      ),
    );
  }

  Widget saveChatList() {
    return Flexible(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          border: Border.all(color: AppColor.whiteColor),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        ),
        padding: const EdgeInsets.fromLTRB(15, 25, 15, 10),
        child: (vm.isLoading == true)?
        const Center(child: SizedBox(
          height: 50,
            width: 50,
            child: CircularProgressIndicator())):
        (vm.faqModel.body == null)?
        Center(
          child: Common.boldText("No Data", 20, AppColor.black, TextAlign.center),
        ):
        ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: vm.faqModel.body!.length,
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
                              width: MediaQuery.of(context).size.width*0.70,
                              child: Common.commonText(vm.faqModel.body![index].question.toString(), 19,
                                  AppColor.textColor, TextAlign.start),
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
                            vm.faqModel.body![index].answer.toString(),
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
      ),
    );
  }

  Future<void> init() async {
    var data = await vm.getFaq(context);

    setState(() {

    });
  }

}
