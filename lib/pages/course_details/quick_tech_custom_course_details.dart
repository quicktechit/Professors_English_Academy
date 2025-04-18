import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/controller/quick_tech_course_details_controller.dart';

import '../../widgets/wuick_tech_custom_course_details.dart';

class QuickTechCustomCourseDetails extends StatefulWidget {
  const QuickTechCustomCourseDetails({super.key});

  @override
  State<QuickTechCustomCourseDetails> createState() =>
      _QuickTechCustomCourseDetailsState();
}

class _QuickTechCustomCourseDetailsState
    extends State<QuickTechCustomCourseDetails> {
  final CourseDetailsController courseDetailsController =
      Get.put(CourseDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Course Details".text.semiBold.make(),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/banner2.jpg").animate().fadeIn(),
                10.heightBox,
                "Spoken English Junior LIVE Batch"
                    .text
                    .semiBold
                    .xl3
                    .make()
                    .pSymmetric(h: dynamicSize).animate().fadeIn(delay: 80.ms),
                10.heightBox,
                ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    5.widthBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/webinar.png",
                          height: 50,
                        ),
                        5.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            "Class".text.gray600.size(14).make(),
                            5.widthBox,
                            "1000".text.black.semiBold.size(16).make(),
                          ],
                        ),
                      ],
                    )
                        .box
                        .shadowSm
                        .roundedSM
                        .white
                        .width(95)
                        .margin(
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5))
                        .p8
                        .make().animate().fadeIn(delay: 100.ms),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/notebook.png",
                          height: 50,
                        ),
                        5.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            "Note".text.gray600.size(14).make(),
                            5.widthBox,
                            "1000".text.black.semiBold.size(16).make(),
                          ],
                        ),
                      ],
                    )
                        .box
                        .shadowSm
                        .roundedSM
                        .white
                        .width(95)
                        .margin(
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5))
                        .p8
                        .make().animate().fadeIn(delay: 120.ms),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/exam.png",
                          height: 50,
                        ),
                        5.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            "Exam".text.gray600.size(14).make(),
                            5.widthBox,
                            "1000".text.black.semiBold.size(16).make(),
                          ],
                        ),
                      ],
                    )
                        .box
                        .shadowSm
                        .roundedSM
                        .white
                        .width(95)
                        .margin(
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5))
                        .p8
                        .make().animate().fadeIn(delay: 140.ms),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/graduated.png",
                          height: 45,
                        ),
                        3.heightBox,
                        "Student".text.gray600.size(14).make(),
                        "10000".text.black.semiBold.size(16).make(),
                      ],
                    )
                        .box
                        .shadowSm
                        .roundedSM
                        .white
                        .width(95)
                        .margin(
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5))
                        .p4
                        .make().animate().fadeIn(delay: 150.ms),
                    5.widthBox,
                  ],
                ).h(110),
                20.heightBox,
                ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Column(
                      children: [
                        "Description"
                            .text
                            .semiBold
                            .color(
                                courseDetailsController.selectedIndex.value == 0
                                    ? mainColor
                                    : gry)
                            .lg
                            .make(),
                        2.heightBox,
                        if (courseDetailsController.selectedIndex.value == 0)
                          Container(
                            height: 5,
                            width: 50,
                            decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                      ],
                    ).onTap(() {
                      courseDetailsController.selectedIndex.value = 0;
                    }),
                    20.widthBox,
                    Column(
                      children: [
                        "Routine"
                            .text
                            .semiBold
                            .lg
                            .color(
                                courseDetailsController.selectedIndex.value == 1
                                    ? mainColor
                                    : gry)
                            .make(),
                        2.heightBox,
                        if (courseDetailsController.selectedIndex.value == 1)
                          Container(
                            height: 5,
                            width: 50,
                            decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                      ],
                    ).onTap(() {
                      courseDetailsController.selectedIndex.value = 1;
                    }),
                    20.widthBox,
                    Column(
                      children: [
                        "Content"
                            .text
                            .semiBold
                            .lg
                            .color(
                                courseDetailsController.selectedIndex.value == 2
                                    ? mainColor
                                    : gry)
                            .make(),
                        2.heightBox,
                        if (courseDetailsController.selectedIndex.value == 2)
                          Container(
                            height: 5,
                            width: 50,
                            decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                      ],
                    ).onTap(() {
                      courseDetailsController.selectedIndex.value = 2;
                    }),
                    20.widthBox,
                    Column(
                      children: [
                        "Review"
                            .text
                            .semiBold
                            .lg
                            .color(
                                courseDetailsController.selectedIndex.value == 3
                                    ? mainColor
                                    : gry)
                            .make(),
                        2.heightBox,
                        if (courseDetailsController.selectedIndex.value == 3)
                          Container(
                            height: 5,
                            width: 50,
                            decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                      ],
                    ).onTap(() {
                      courseDetailsController.selectedIndex.value = 3;
                    }),
                    20.widthBox,
                    Column(
                      children: [
                        "FAQ"
                            .text
                            .semiBold
                            .color(
                                courseDetailsController.selectedIndex.value == 4
                                    ? mainColor
                                    : gry)
                            .lg
                            .make(),
                        2.heightBox,
                        if (courseDetailsController.selectedIndex.value == 4)
                          Container(
                            height: 5,
                            width: 50,
                            decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                      ],
                    ).onTap(() {
                      courseDetailsController.selectedIndex.value = 4;
                    }),
                  ],
                ).h(30).pSymmetric(h: dynamicSize).animate().fadeIn(delay: 180.ms),
                20.heightBox,
                courseDetailsController.selectedIndex.value == 0
                    ? customCourseDesc(context).animate().fadeIn(delay: 180.ms)
                    : courseDetailsController.selectedIndex.value == 1
                        ? customRoutine(context).animate().fadeIn(delay: 80.ms)
                        : courseDetailsController.selectedIndex.value == 2
                            ? customContent(context).animate().fadeIn(delay: 80.ms)
                            : courseDetailsController.selectedIndex.value == 3
                                ? customReview(context).animate().fadeIn(delay: 80.ms)
                                : courseDetailsController.selectedIndex.value ==
                                        4
                                    ? customFaq(context).animate().fadeIn(delay: 80.ms)
                                    : SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
