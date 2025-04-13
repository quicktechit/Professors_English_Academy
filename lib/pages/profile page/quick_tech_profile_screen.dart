import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:professors_english_academy/pages/help%20&%20support/quick_tech_help_&_support_page.dart';
import 'package:professors_english_academy/pages/privacy%20&%20terms/quick_tech_terms_page.dart';
import 'package:professors_english_academy/pages/profile%20page/quick_tech_editProfile_dialog.dart';

import '../../consts/consts.dart';
import '../privacy & terms/quick_tech_privacy_page.dart';

class QuickTechProfileScreen extends StatefulWidget {
  const QuickTechProfileScreen({super.key});

  @override
  State<QuickTechProfileScreen> createState() => _QuickTechProfileScreen();
}

class _QuickTechProfileScreen extends State<QuickTechProfileScreen> {
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: "Profile".text.semiBold.make(),
        actions: [
          Obx(
          ()=> Icon(
              !themeController.isDarkMode.value ? Icons.nightlight_outlined : Icons.sunny,
              //Icons.sunny,
              color:  !themeController.isDarkMode.value ? Colors.black : Colors.white,
              //color: Colors.redAccent,
            ).onTap(() {
              themeController.toggleTheme();
              Get.appUpdate();
            }),
          ),
          10.widthBox,
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  20.heightBox,
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.red,
                        child: ClipOval(
                            child: Image.asset("assets/images/man.png")),
                      ),
                      Positioned(
                        bottom: 7,
                        right: 2,
                        child: CircleAvatar(
                            radius: 12,
                            child: const Icon(
                              Icons.add,
                              color: mainColor,
                            ).centered().onTap(() {
                              log("message");
                            })),
                      )
                    ],
                  ).animate().fadeIn(delay: 50.ms),
                  10.heightBox,
                  Row(
                    children: [
                      "Personal Info".text.semiBold.size(15).make(),
                      const Spacer(),
                      Image.asset(
                        "assets/images/personEdit.png",
                        scale: 20,color: themeController.isDarkMode.value?Colors.white:Colors.black,
                      ).onTap(() {
                        showDialog(
                            context: context,
                            builder: (context) =>
                                editDialog(context: context));
                      }),
                      15.widthBox
                    ],
                  ).animate().fadeIn(delay: 50.ms),
                  10.heightBox,
                  ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => Divider(
                            height: 1,
                            color: gry.withOpacity(0.4),
                            thickness: 1.2,
                          ).animate().fadeIn(delay: (index * 50).ms),
                      itemCount: profileList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          dense: true,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              profileList[index]
                                  .text
                                  .size(14)
                                  .color(gry)
                                  .make(),
                              information[index]
                                  .text
                                  .black
                                  .overflow(TextOverflow.ellipsis)
                                  .size(13)
                                  .make()
                                  .w(100),
                            ],
                          ),
                        ).animate().fadeIn(delay: (index * 50).ms);
                      }),
                  Divider(
                          thickness: 1.2,
                          height: 1,
                          color: gry.withOpacity(0.4))
                      .animate()
                      .fadeIn(delay: (250).ms),
                  20.heightBox,
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "Privacy Policy".text.semiBold.color(mainColor).make(),
                      Icon(Icons.privacy_tip_outlined,color: secondColor,)
                    ],
                  ).pSymmetric(h: 15,v: 5).animate()
                      .fadeIn(delay: (260).ms).box.make().onTap((){
                        Get.to(()=>QuickTechPrivacyPage());
                        
                  }),
                  Divider(  thickness: 1.2,).animate()
                      .fadeIn(delay: (260).ms),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "Terms & Condition".text.semiBold.color(mainColor).make(),
                      Icon(CupertinoIcons.exclamationmark_square,color: secondColor,)
                    ],
                  ).pSymmetric(h: 15,v: 5).animate()
                      .fadeIn(delay: (270).ms).box.make().onTap((){
                        Get.to(()=>QuickTechTermsPage());
                  }),

                  Divider(  thickness: 1.2,).animate()
                      .fadeIn(delay: (270).ms),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "Help".text.semiBold.color(mainColor).make(),
                      Icon(Icons.help_center_outlined,color: secondColor,)
                    ],
                  ).pSymmetric(h: 15,v: 5).animate()
                      .fadeIn(delay: (280).ms).box.make().onTap((){
                        Get.to(()=>QuickTechHelpAndSupportPage());
                  }),
                  Divider(  thickness: 1.2,).animate()
                      .fadeIn(delay: (280).ms),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "Log out".text.semiBold.color(mainColor).make(),
                      Icon(Icons.logout,color: secondColor,)
                    ],
                  ).pSymmetric(h: 15,v: 5).animate()
                      .fadeIn(delay: (290).ms),
                  Divider(  thickness: 1.2,).animate()
                      .fadeIn(delay: (290).ms),
                ],
              ),
            ),
          )
        ],
      ).pSymmetric(h: dynamicSize),
    );
  }
}
