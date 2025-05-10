import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:professors_english_academy/controller/quick_tech_profile_controller.dart';
import 'package:professors_english_academy/pages/help%20&%20support/quick_tech_help_&_support_page.dart';
import 'package:professors_english_academy/pages/privacy%20&%20terms/quick_tech_terms_page.dart';
import 'package:professors_english_academy/pages/profile%20page/quick_tech_editProfile_dialog.dart';

import '../../consts/consts.dart';
import '../../controller/quick_tech_my_course_controller.dart';
import '../my dashboard/quick_tech_my_course.dart';
import '../my dashboard/quick_tech_my_quizes.dart';
import '../privacy & terms/quick_tech_privacy_page.dart';

class QuickTechProfileScreen extends StatefulWidget {
  const QuickTechProfileScreen({super.key});

  @override
  State<QuickTechProfileScreen> createState() => _QuickTechProfileScreen();
}

class _QuickTechProfileScreen extends State<QuickTechProfileScreen> {
  final ThemeController themeController = Get.find();
  final MyCourseController myCourseController = Get.put(MyCourseController());
  final ProfileController profileController = Get.find();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      profileController.getProfile();
      profileController.getTermsPrivacy();
      profileController.getMyQuiz();

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: "Profile".text.semiBold.make(),
        actions: [
          Obx(
            () => Icon(
              !themeController.isDarkMode.value
                  ? Icons.nightlight_outlined
                  : Icons.sunny,
              //Icons.sunny,
              color: !themeController.isDarkMode.value
                  ? Colors.black
                  : Colors.white,
              //color: Colors.redAccent,
            ).onTap(() {
              themeController.toggleTheme();
              Get.appUpdate();
            }),
          ),
          10.widthBox,
        ],
      ),
      body: Obx(() {
        var data = profileController.profile.value;
        log("${Api.baseUrl}${data.user?.image}");
        return Column(
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
                        Obx(() => CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.red,
                              child: ClipOval(
                                child: profileController
                                        .profileImageUrl.value.isNotEmpty
                                    ? Image.network(
                                        profileController.profileImageUrl.value,
                                        fit: BoxFit.cover,
                                        height: 95,
                                        width: 95)
                                    : Image.asset("assets/images/man.png"),
                              ),
                            )),
                        Positioned(
                          bottom: 7,
                          right: 2,
                          child: CircleAvatar(
                              radius: 12,
                              child: const Icon(
                                Icons.add,
                                color: mainColor,
                              ).centered().onTap(() {
                                profileController.pickAndUploadImage();
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
                          scale: 20,
                          color: themeController.isDarkMode.value
                              ? Colors.white
                              : Colors.black,
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
                    Divider(
                            thickness: 1.2,
                            height: 1,
                            color: gry.withOpacity(0.4))
                        .animate()
                        .fadeIn(delay: (70).ms),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Name".text.size(14).color(gry).make(),
                        Spacer(),
                        "${data.user?.name}"
                            .text
                            .black
                            .overflow(TextOverflow.ellipsis)
                            .size(13)
                            .make()
                      ],
                    ).animate().fadeIn(delay: (90).ms),
                    10.heightBox,
                    Divider(
                            thickness: 1.2,
                            height: 1,
                            color: gry.withOpacity(0.4))
                        .animate()
                        .fadeIn(delay: (100).ms),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Phone".text.size(14).color(gry).make(),
                        Spacer(),
                        "${data.user?.phone}"
                            .text
                            .black
                            .overflow(TextOverflow.ellipsis)
                            .size(13)
                            .make()
                      ],
                    ).animate().fadeIn(delay: (120).ms),
                    10.heightBox,
                    Divider(
                            thickness: 1.2,
                            height: 1,
                            color: gry.withOpacity(0.4))
                        .animate()
                        .fadeIn(delay: (130).ms),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "School/College/University"
                            .text
                            .size(12)
                            .sm
                            .color(gry)
                            .make(),
                        Spacer(),
                        "${data.user?.institution}"
                            .text
                            .black
                            .overflow(TextOverflow.ellipsis)
                            .size(13)
                            .make()
                      ],
                    ).animate().fadeIn(delay: (140).ms),
                    10.heightBox,
                    Divider(
                            thickness: 1.2,
                            height: 1,
                            color: gry.withOpacity(0.4))
                        .animate()
                        .fadeIn(delay: (150).ms),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "My Quiz's".text.semiBold.color(mainColor).make(),
                        Icon(
                          CupertinoIcons.square_grid_2x2,
                          color: secondColor,
                        )
                      ],
                    )
                        .pSymmetric(h: 5, v: 5)
                        .animate()
                        .fadeIn(delay: (260).ms)
                        .box
                        .make()
                        .onTap(() {
                      Get.to(() =>QuickTechMyQuizes());
                    }),
                    Divider(
                      thickness: 1.2,
                    ).animate().fadeIn(delay: (260).ms),
                    10.heightBox,
                    Divider(
                            thickness: 1.2,
                            height: 1,
                            color: gry.withOpacity(0.4))
                        .animate()
                        .fadeIn(delay: (150).ms),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "My Courses".text.semiBold.color(mainColor).make(),
                        Icon(
                          CupertinoIcons.square_grid_2x2,
                          color: secondColor,
                        )
                      ],
                    )
                        .pSymmetric(h: 5, v: 5)
                        .animate()
                        .fadeIn(delay: (260).ms)
                        .box
                        .make()
                        .onTap(() {
                      Get.to(() => QuickTechMyCourse(
                            enrollCourse: profileController
                                    .profile.value.enrolledCourses ??
                                [],
                          ));
                    }),
                    Divider(
                      thickness: 1.2,
                    ).animate().fadeIn(delay: (260).ms),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Privacy Policy".text.semiBold.color(mainColor).make(),
                        Icon(
                          Icons.privacy_tip_outlined,
                          color: secondColor,
                        )
                      ],
                    )
                        .pSymmetric(h: 5, v: 5)
                        .animate()
                        .fadeIn(delay: (260).ms)
                        .box
                        .make()
                        .onTap(() {
                      Get.to(() => QuickTechPrivacyPage(
                            data: profileController.privacyTerms.value.data![0],
                          ));
                    }),
                    Divider(
                      thickness: 1.2,
                    ).animate().fadeIn(delay: (260).ms),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Terms & Condition"
                            .text
                            .semiBold
                            .color(mainColor)
                            .make(),
                        Icon(
                          CupertinoIcons.exclamationmark_square,
                          color: secondColor,
                        )
                      ],
                    )
                        .pSymmetric(h: 5, v: 5)
                        .animate()
                        .fadeIn(delay: (270).ms)
                        .box
                        .make()
                        .onTap(() {
                      Get.to(() => QuickTechTermsPage(
                          data: profileController.privacyTerms.value.data![1]));
                    }),
                    Divider(
                      thickness: 1.2,
                    ).animate().fadeIn(delay: (270).ms),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Help".text.semiBold.color(mainColor).make(),
                        Icon(
                          Icons.help_center_outlined,
                          color: secondColor,
                        )
                      ],
                    )
                        .pSymmetric(h: 5, v: 5)
                        .animate()
                        .fadeIn(delay: (280).ms)
                        .box
                        .make()
                        .onTap(() {
                      Get.to(() => QuickTechHelpAndSupportPage());
                    }),
                    Divider(
                      thickness: 1.2,
                    ).animate().fadeIn(delay: (280).ms),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Log out".text.semiBold.color(mainColor).make(),
                        Icon(
                          Icons.logout,
                          color: secondColor,
                        )
                      ],
                    )
                        .pSymmetric(h: 5, v: 5)
                        .animate()
                        .fadeIn(delay: (290).ms)
                        .onTap(() {
                      profileController.logOut();
                    }),
                    Divider(
                      thickness: 1.2,
                    ).animate().fadeIn(delay: (290).ms),
                  ],
                ),
              ),
            )
          ],
        ).pSymmetric(h: dynamicSize);
      }),
    );
  }
}
