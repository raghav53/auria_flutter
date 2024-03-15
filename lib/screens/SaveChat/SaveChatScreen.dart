import 'package:auria_ai/screens/SaveChat/SaveChatVM.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../apis/api_controller.dart';
import '../../utils/color.dart';
import '../../utils/common.dart';
import '../../utils/strings.dart';
import '../Chat/ChatScreen.dart';

class SaveChatScreen extends StatefulWidget {
  static const String route = "SaveChatScreenRoute";
  const SaveChatScreen({Key? key}) : super(key: key);

  @override
  State<SaveChatScreen> createState() => _SaveChatScreenState();
}

class _SaveChatScreenState extends State<SaveChatScreen> {

  var vm = SaveChatVM();
  BannerAd? bannerAd;
  var isLoader = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    bannerAd = BannerAd(size: AdSize.banner,
        adUnitId: "ca-app-pub-4774281274199118/6929879354",
        listener: BannerAdListener(
            onAdLoaded: (ad) {
              setState(() {
                isLoader = false;
              });
              print("Add Loaded");
            },
            onAdFailedToLoad: (ad,error){
              ad.dispose();
            }

        ),
        request: const AdRequest());
    bannerAd!.load();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    init();
  }

  Future<void> init() async {
    var chat = await vm.getSavedChat(context,"");

    if (chat == true) {
      setState(() {

      });
    }
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
          title: Common.mediumText(Strings.savedChat,20,AppColor.whiteColor,TextAlign.start),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              vm.backClick(context);
            },
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                        controller: vm.search,
                        onChanged: (text){
                          if(text == ""){
                            init();
                          }
                        },
                        style: TextStyle(color: AppColor.fieldTextColor),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                            hintText: Strings.searchHere,
                            hintStyle: TextStyle(color: AppColor.fieldTextColor)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 7),
                  InkWell(
                    onTap: () async {

                      if(vm.search.text.trim().toString() == ""){

                      }else{
                        var chat = await vm.getSavedChat(context,vm.search.text.trim().toString());

                        if (chat == true) {
                          setState(() {

                          });
                        }
                      }

                    },
                    child: Container(
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
                    ),
                  )
                ],
              ),
            ),
            Flexible(child: saveChatList())
          ],
        ),
        bottomNavigationBar: (signUpModel.body!.subscription == 0) ? (isLoader == true)?
        const SizedBox(
          height: 0,
        ):
        Container(
          color: AppColor.whiteColor,
          height: 60,
          child: AdWidget(ad: bannerAd!),
        ):
        const SizedBox(
          height: 0,
        ),
      ),
    );

  }

  Widget saveChatList() {
    return  Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        border: Border.all(color: AppColor.whiteColor),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40)),
      ),
      padding: const EdgeInsets.fromLTRB(15, 25, 15, 10),
      child: (vm.isLoading)?const Center(child: SizedBox(height : 50,width : 50,child: CircularProgressIndicator()),) :
      (vm.savedChatModel.body!.length == 0)?Center(child: Common.boldText("No Data", 20, AppColor.black, TextAlign.center)):
      ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: vm.savedChatModel.body!.length,
          itemBuilder: (context,index)
          {
            return InkWell(

              onTap: (){
                List<Map<String, String>> messageList = [];

                for (var i = 0; i < vm.savedChatModel.body![index].jsonData!.length; i++) {
                  Map<String, String> mapRate = <String, String>{};
                  mapRate['isFrom'] = vm.savedChatModel.body![index].jsonData![i].isFrom.toString();
                  mapRate['humanMesasge'] = vm.savedChatModel.body![index].jsonData![i].humanMesasge.toString();
                  mapRate['aiMessage'] = vm.savedChatModel.body![index].jsonData![i].aiMessage.toString();
                  mapRate['category'] = vm.savedChatModel.body![index].jsonData![i].category.toString();
                  mapRate['prompt'] = vm.savedChatModel.body![index].jsonData![i].prompt.toString();
                  mapRate['description'] = vm.savedChatModel.body![index].jsonData![i].description.toString();
                  mapRate['id'] = vm.savedChatModel.body![index].jsonData![i].id.toString();
                  messageList.add(mapRate);
                }

                Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen(
                    prompt:vm.savedChatModel.body![index].jsonData![0].prompt.toString(),
                    description:vm.savedChatModel.body![index].jsonData![0].description.toString(),
                    messageList: messageList)));

              },

              child: Container(
                margin: const EdgeInsets.only(top: 5,bottom: 5),
                decoration: BoxDecoration(
                    color: AppColor.fieldColor,
                    border: Border.all(color: AppColor.fieldColor),
                    borderRadius: const BorderRadius.all(Radius.circular(20))
                ),
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/images/save_chat_user.png",height: 25,width: 25),
                            const SizedBox(width: 10,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.50,
                                child: Common.mediumText(vm.savedChatModel.body![index].title.toString(), 17, AppColor.textColor,TextAlign.start))
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () async {
                                var result = showSaveDialog(context,vm.savedChatModel.body![index].title.toString(),vm.savedChatModel.body![index].id.toString());
                                if(result == true){
                                  var chat = await vm.getSavedChat(context,"");
                                  if (chat == true) {
                                    setState(() {

                                    });
                                  }
                                }
                              },
                                child: Image.asset("assets/images/edit_chat.png",height: 27,width: 27,)),
                            const SizedBox(width: 10,),
                            InkWell(
                              onTap: () async {
                                var result = await vm.deleteChat(context,vm.savedChatModel.body![index].id.toString());
                                if(result == true){
                                  var chat = await vm.getSavedChat(context,"");
                                  if (chat == true) {
                                    setState(() {

                                    });
                                  }
                                }
                              },
                                child: Image.asset("assets/images/delete_chat_icon.png",height: 27,width: 27,)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Common.commonText(vm.dateFormat(vm.savedChatModel.body![index].createdAt.toString()), 16, AppColor.fieldTextColor,TextAlign.start),
                    const SizedBox(height: 10,),
                    Common.commonText(vm.savedChatModel.body![index].jsonData![0].humanMesasge.toString(), 16, AppColor.fieldTextColor,TextAlign.start),
                    const SizedBox(height: 10,),
                    Common.commonText(vm.savedChatModel.body![index].jsonData![1].aiMessage.toString(), 16, AppColor.fieldTextColor,TextAlign.start),
                    const SizedBox(height: 10,),
                  ],
                ),
              ),
            );
          }),
    );
  }

  showSaveDialog(BuildContext context, String title, String id) {

    vm.editTitle.text = title;

    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: MaterialLocalizations
            .of(context)
            .modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext,
            Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 40,),
                      Material(
                        color: Colors.transparent,
                        child: Text('Edit Title', style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            color: AppColor.textColor
                        ),),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, bottom: 10, top: 10),
                          child: SizedBox(
                            width: double.infinity,
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxHeight: 50),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: AppColor.fieldColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: TextField(
                                      controller: vm.editTitle,
                                      maxLines: null,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: AppColor.textColor,
                                          fontWeight: FontWeight.w400),
                                      decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.only(
                                              top: 13, bottom: 5),
                                          hintText: 'Enter a Title...',
                                          hintStyle: TextStyle(
                                              color: Colors.grey.shade400,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                          border: InputBorder.none,
                                          prefix: const SizedBox(
                                            width: 15,
                                          ),
                                          suffixIcon: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Image.asset(
                                                'assets/images/limitatuin_icon.png',
                                                width: 20,
                                                height: 20,
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )),
                      const SizedBox(height: 20,),
                      Container(
                        margin: const EdgeInsets.only(left: 20, right: 20,bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 40,
                              width: 120,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: AppColor.fieldColor,
                                    backgroundColor: AppColor.fieldColor,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(25), // <-- Radius
                                    ),
                                  ),
                                  child: Text(
                                    Strings.no,
                                    style: TextStyle(
                                        fontFamily: 'Poppins-Medium',
                                        color: AppColor.fieldTextColor,
                                        fontSize: 17),
                                  )),
                            ),
                            SizedBox(
                              height: 40,
                              width: 120,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    if(vm.editTitle.text.toString().trim() == ""){
                                      showError("Please enter title");
                                    }else{

                                      Map<String,String> map = {
                                        "chat_id":id,
                                        "title":vm.editTitle.text.toString(),
                                      };
                                      var result = await vm.editTitleApi(context,map);

                                      if(result == true){
                                        Navigator.pop(context);
                                        init();
                                      }
                                    }

                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: AppColor.greenColor,
                                    backgroundColor: AppColor.greenColor,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(25), // <-- Radius
                                    ),
                                  ),
                                  child: Text(
                                    Strings.yes,
                                    style: const TextStyle(
                                        fontFamily: 'Poppins-Medium',
                                        color: Colors.white,
                                        fontSize: 17),
                                  )),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).then((value) {
      FocusManager.instance.primaryFocus?.unfocus();
    });
  }
}
