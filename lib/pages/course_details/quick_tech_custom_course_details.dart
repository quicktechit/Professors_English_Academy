import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/controller/quick_tech_course_details_controller.dart';
import 'package:professors_english_academy/controller/quick_tech_profile_controller.dart';
import 'package:professors_english_academy/widgets/quick_tech_custom_button.dart';

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
  final ProfileController profileController = Get.find();
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
            () {
              var data=courseDetailsController.courseDetails.value.data?[0];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network("${Api.imageUrl}${data?.thumbnilImage}").animate().fadeIn(),
                  10.heightBox,
                  "${data?.name}"
                      .text
                      .semiBold
                      .xl3
                      .make()
                      .pSymmetric(h: dynamicSize).animate().fadeIn(delay: 80.ms),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            "${data?.classCount}"
                                .text
                                .black
                                .semiBold
                                .size(16)
                                .make(),
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
                            "assets/images/exam.png",
                            height: 50,
                          ),
                          5.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              "Exam".text.gray600.size(14).make(),
                              5.widthBox,
                            "${data?.quizCount}"
                                .text
                                .black
                                .semiBold
                                .size(16)
                                .make(),
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
                        "${data?.enrolledCount}"
                            .text
                            .black
                            .semiBold
                            .size(16)
                            .make(),
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
                10.heightBox,
                data?.alreadyEnrolled == true
                    ? "Enrolled".text.xl2.semiBold.makeCentered()
                    : data?.buy!="Free"?
                customButton(
                    title: "Enroll Now",
                                onPressed: () {
                                  courseDetailsController.enrollInCourse(
                                      totalAmount: "${data?.price.toString()}",
                                      coursePrice: "${data?.price.toString()}",
                                      discountAmount:
                                          "${data?.discountPrice.toString()}",
                                      courseId: data!.id!,
                                      paymentMethod: 'credit_card');
                                },
                                txtColor: white,
                                color: mainColor)
                            .w(context.screenWidth - 50)
                            .h(40)
                            .centered()
                        : "Free".text.xl2.semiBold.makeCentered(),
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
                      ? customCourseDesc(context,"${data?.details}",data?.instructor).animate().fadeIn(delay: 180.ms)
                      : courseDetailsController.selectedIndex.value == 1
                      ? customRoutine(context,"${data?.detailsFile}").animate().fadeIn(delay: 80.ms)
                      : courseDetailsController.selectedIndex.value == 2
                            ? customContent(
                                    context,
                                    data?.syllabuslist,
                                    data?.modules,
                                    "${data?.buy}",
                                    "${data?.price.toString()}",
                                    "${data?.price.toString()}",
                                    "${data?.discountPrice.toString()}",
                                    data!.id!,
                                    data.alreadyEnrolled!)
                                .animate()
                                .fadeIn(delay: 80.ms)
                            : courseDetailsController.selectedIndex.value == 3
                                ? customReview(context, data?.review,
                                        data?.reviewAvgRating)
                                    .animate()
                                    .fadeIn(delay: 80.ms)
                                : courseDetailsController.selectedIndex.value ==
                      4
                                    ? customFaq(context, data?.faqs)
                                        .animate()
                                        .fadeIn(delay: 80.ms)
                                    : SizedBox()
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
