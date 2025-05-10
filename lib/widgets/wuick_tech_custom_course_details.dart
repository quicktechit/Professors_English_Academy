import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/controller/quick_tech_course_details_controller.dart';
import 'package:professors_english_academy/controller/quick_tech_pdf_controller.dart';
import 'package:professors_english_academy/model/course_details_model.dart';
import 'package:professors_english_academy/pages/videoplayer/quick_tech_youtube_video_player.dart';
import 'package:professors_english_academy/widgets/quick_tech_custom_button.dart';
import 'package:professors_english_academy/widgets/quick_tech_custom_contract_us.dart';
import 'package:professors_english_academy/widgets/quick_tech_custom_instructor_details.dart';

import '../controller/quick_tech_practice_controller.dart';
import '../pages/exam page/quick_tech_exam_page.dart';

Widget customCourseDesc(
  BuildContext context,
  String details,
  Instructor? instructor,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Html(data: details),
      15.heightBox,
      "Instructors".text.semiBold.xl2.make(),
      15.heightBox,
      customInstructorDetails(context, instructor?.image,
          instructor?.profession, instructor?.institution, instructor?.name),
      20.heightBox,
    ],
  ).pSymmetric(h: dynamicSize);
}

Widget customRoutine(BuildContext context, pdfLink) {
  PdfController pdfController = Get.put(PdfController());
  return Column(
    children: [
      customButton(
              title: "Download Full Routine ⬇",
              onPressed: () {
                pdfController.downloadToDownloadsFolder(
                    context, pdfLink, "Routine");
              },
              color: mainColor,
              txtColor: white)
          .w(context.screenWidth)
          .pSymmetric(h: dynamicSize),
      30.heightBox,
      customContractUS(context)
    ],
  );
}

Widget customFaq(BuildContext context, List<Faqs>? faq) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Header Section
      "Help & Support"
          .text
          .xl3
          .bold
          .color(Colors.blueGrey)
          .make()
          .centered()
          .pSymmetric(h: 20),
      10.heightBox,
      "Find answers to common questions or get in touch with our team."
          .text
          .gray500
          .center
          .make()
          .pSymmetric(h: 20),

      // FAQ Section
      30.heightBox,
      "Frequently Asked Questions"
          .text
          .xl2
          .semiBold
          .color(Colors.blueGrey)
          .make()
          .pOnly(left: 20),
      20.heightBox,
      ListView.builder(
          itemCount: faq?.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var data = faq?[index];
            return ExpansionTile(
              iconColor: Colors.black,
              title: "${data?.question}".text.lg.semiBold.black.make(),
              tilePadding: EdgeInsets.symmetric(horizontal: 20),
              collapsedBackgroundColor: Vx.gray100,
              backgroundColor: Vx.gray200,
              children: [
                "${data?.answer}".text.gray700.make().p(16),
              ],
            ).pSymmetric(h: 20);
          }),

      // Support Contact Section
      30.heightBox,
      customContractUS(context),
      30.heightBox, // Bottom padding
    ],
  );
}

Widget customReview(BuildContext context, List<Review>? review, avgReview) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      "Average Reading $avgReview".text.semiBold.xl.make(),
      RatingBar.builder(
        initialRating: 5,
        itemSize: 15,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.amber,
          size: 10,
        ),
        onRatingUpdate: (double value) {},
      ),
      10.heightBox,
      ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: review?.length,
        itemBuilder: (context, index) {
          var data = review?[index];
          return Card(
            color: Colors.white,
            elevation: 5,
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      "${data?.student?.name}".text.black.xl.semiBold.make(),
                      Spacer(),
                      Icon(Icons.star, size: 19, color: Colors.amber),
                      8.heightBox,
                      Text(
                        "${data?.rating}".toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  5.heightBox,
                  Text(
                    "${data?.reviewText}",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 5),
                  'Reviewed on: ${DateFormat('d MMMM y h:mm a').format(DateTime.parse(data!.createdAt.toString()).toUtc().toLocal())}'
                      .text
                      .semiBold
                      .sm
                      .gray400
                      .make(),
                ],
              ),
            ),
          );
        },
      ),
    ],
  ).pSymmetric(h: dynamicSize);
}

Widget customContent(
    BuildContext context,
    List<String>? syllabus,
    List<Modules>? modules,
    String status,
    String totalAmount,
    String coursePrice,
    String discountAmount,
    int courseId,
    bool alreadyEnrolled) {
  PdfController pdfController = Get.put(PdfController());
  final PracticeController practiceController = Get.put(PracticeController());
  final CourseDetailsController courseDetailsController = Get.find();
  return Column(
    children: [
      ExpansionTile(
        iconColor: Colors.black,
        title: "Syllabus".text.semiBold.black.make(),
        children: [
          ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 15),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: syllabus?.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  // Image
                  SizedBox(
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.download,
                        color: Colors.black,
                      )),
                  16.widthBox, // Space between image and title
                  // Title
                  Expanded(
                      child:
                          "Syllabus ${index + 1}".text.semiBold.black.make()),
                ],
              ).box.make().onTap(() {
                pdfController.downloadToDownloadsFolder(
                    context, "${syllabus?[index]}", 'Syllabus');
              });
            },
          ),
        ],
      ).box.roundedSM.white.shadowSm.clip(Clip.antiAlias).make(),
      10.heightBox,
      Column(
        children: modules!.map((subject) {
          var moduleData = subject;
          return ExpansionTile(
            childrenPadding: EdgeInsets.symmetric(horizontal: 10),
            title: subject.name!.text.semiBold.black.make(),
            subtitle: 'Tap to see papers'.text.semiBold.black.make(),
            children: subject.lessons!.map((lessons) {
              return ExpansionTile(
                childrenPadding: EdgeInsets.symmetric(horizontal: 10),
                title: '${lessons.name}'.text.semiBold.black.make(),
                subtitle: 'Tap to see sections'.text.semiBold.black.make(),
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: lessons.videos?.length,
                    itemBuilder: (context, index) {
                      if (lessons.videos!.isEmpty) {
                        return "No lessons Found".text.semiBold.make();
                      } else {
                        final item = lessons.videos?[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              // Image
                              SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Icon(
                                    Icons.video_camera_back_outlined,
                                    color: Colors.black,
                                  )),
                              SizedBox(width: 16),
                              // Title
                              Expanded(
                                child:
                                    "${item?.name}".text.semiBold.black.make(),
                              ),
                            ],
                          ).onTap(() {
                            if (status != "Free" && !alreadyEnrolled) {
                              Get.snackbar("Sorry", "Please Enroll First");
                              return;
                            }

                            if (!alreadyEnrolled) {
                              courseDetailsController.enrollInCourse(
                                totalAmount: totalAmount,
                                coursePrice: coursePrice,
                                discountAmount: discountAmount,
                                courseId: courseId,
                                paymentMethod: 'credit_card',
                              );
                            }

                            if (moduleData.completed==true) {
                              if (item?.link != null && item?.link != "null") {
                                Get.to(() => QuickTechYoutubeVideoPlayer(url: item?.link));
                              } else {
                                Get.snackbar("Error", "Link is Null");
                              }
                            } else {
                              Get.snackbar("Warning", "Complete the previous Module First");
                            }
                          })

                        ).color(status == "Free"
                            ? Colors.transparent
                            : alreadyEnrolled == true
                                ? Colors.transparent
                                : Vx.red300);
                      }
                    },
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: lessons.quizzes?.length,
                    itemBuilder: (context, index) {
                      if (lessons.quizzes!.isEmpty) {
                        return "No lessons Found".text.semiBold.make();
                      } else {
                        final item = lessons.quizzes?[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              // Image
                              SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Icon(
                                    Icons.quiz_outlined,
                                    color: Colors.black,
                                  )),
                              SizedBox(width: 16),
                              // Title
                              Expanded(
                                child:
                                    "${item?.name}".text.semiBold.black.make(),
                              ),
                            ],
                          ).box.make().onTap(() {
                            if (status == "Free" || alreadyEnrolled == true) {
                              if (alreadyEnrolled != true) {
                                courseDetailsController.enrollInCourse(
                                    totalAmount: totalAmount,
                                    coursePrice: coursePrice,
                                    discountAmount: discountAmount,
                                    courseId: courseId,
                                    paymentMethod: 'credit_card');
                              }
                              practiceController.singleExam.value = item!;
                              Get.to(() => QuickTechExamPage(
                                    pdfs: item.pdf.toString(),
                                  ));
                            } else {
                              Get.snackbar("Sorry", "Please Enroll First");
                            }
                          }),
                        ).color(status == "Free"
                            ? Colors.transparent
                            : alreadyEnrolled == true
                                ? Colors.transparent
                                : Vx.red300);
                      }
                    },
                  ),
                ],
              );
            }).toList(),
          );
        }).toList(),
      ).box.roundedSM.white.shadowSm.clip(Clip.antiAlias).make(),
      20.heightBox,
    ],
  ).pSymmetric(h: dynamicSize);
}
