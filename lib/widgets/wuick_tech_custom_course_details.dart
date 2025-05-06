import 'package:flutter_html/flutter_html.dart';
import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/controller/quick_tech_pdf_controller.dart';
import 'package:professors_english_academy/model/course_details_model.dart';
import 'package:professors_english_academy/widgets/quick_tech_custom_button.dart';
import 'package:professors_english_academy/widgets/quick_tech_custom_contract_us.dart';
import 'package:professors_english_academy/widgets/quick_tech_custom_instructor_details.dart';
import 'package:intl/intl.dart';
Widget customCourseDesc(
    BuildContext context, String details, Instructor? instructor) {
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
                pdfController.downloadToDownloadsFolder(context, pdfLink);
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

Widget customFaq(BuildContext context) {
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
      ExpansionTile(
        iconColor: Colors.black,
        title: "How do I book a tour?".text.lg.semiBold.black.make(),
        tilePadding: EdgeInsets.symmetric(horizontal: 20),
        collapsedBackgroundColor: Vx.gray100,
        backgroundColor: Vx.gray200,
        children: [
          "You can book a tour by selecting a category from the home page, choosing your desired tour, and following the booking steps."
              .text
              .gray700
              .make()
              .p(16),
        ],
      ).pSymmetric(h: 20),
      ExpansionTile(
        iconColor: Colors.black,
        title: "What is the cancellation policy?".text.lg.semiBold.black.make(),
        tilePadding: EdgeInsets.symmetric(horizontal: 20),
        collapsedBackgroundColor: Vx.gray100,
        backgroundColor: Vx.gray200,
        children: [
          "Cancellations can be made up to 48 hours before the tour starts for a full refund. Please check tour details for specific policies."
              .text
              .gray700
              .make()
              .p(16),
        ],
      ).pSymmetric(h: 20),
      ExpansionTile(
        iconColor: Colors.black,
        title: "How do I contact the tour guide?".text.lg.semiBold.black.make(),
        tilePadding: EdgeInsets.symmetric(horizontal: 20),
        collapsedBackgroundColor: Vx.gray100,
        backgroundColor: Vx.gray200,
        children: [
          "Once your booking is confirmed, you'll receive the guide's contact details via email or in the app."
              .text
              .gray700
              .make()
              .p(16),
        ],
      ).pSymmetric(h: 20),
      ExpansionTile(
        iconColor: Colors.black,
        title: "What if I have a technical issue?".text.lg.black.semiBold.make(),
        tilePadding: EdgeInsets.symmetric(horizontal: 20),
        collapsedBackgroundColor: Vx.gray100,
        backgroundColor: Vx.gray200,
        children: [
          "Please reach out to our support team below, and we'll assist you promptly."
              .text
              .gray700
              .make()
              .p(16),
        ],
      ).pSymmetric(h: 20),
      // Support Contact Section
      30.heightBox,
      customContractUS(context),
      30.heightBox, // Bottom padding
    ],
  );
}

Widget customReview(BuildContext context,List<Review>? review,avgReview) {

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
          var data=review?[index];
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
                      "${ data?.student?.name}".text.black.xl.semiBold.make(),
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

Widget customContent(BuildContext context) {
  final List<Map<String, String>> items = [
    {
      'title': 'Item 1',
      'image': 'https://via.placeholder.com/50', // Replace with your image URL
    },
    {
      'title': 'Item 2',
      'image': 'https://via.placeholder.com/50',
    },
    {
      'title': 'Item 3',
      'image': 'https://via.placeholder.com/50',
    },
  ];
  final Map<String, List<Map<String, dynamic>>> subjects = {
    'Bangla': [
      {
        'category': 'Bangla 1st Paper',
        'items': [
          {
            'title': 'Bangla 1st Paper - Part 1',
            'image': 'https://via.placeholder.com/50',
          },
          {
            'title': 'Bangla 1st Paper - Part 2',
            'image': 'https://via.placeholder.com/50',
          },
        ],
      },
      {
        'category': 'Bangla 2nd Paper',
        'items': [
          {
            'title': 'Bangla 2nd Paper - Part 1',
            'image': 'https://via.placeholder.com/50',
          },
          {
            'title': 'Bangla 2nd Paper - Part 2',
            'image': 'https://via.placeholder.com/50',
          },
        ],
      },
    ],
    'English': [
      {
        'category': 'English 1st Paper',
        'items': [
          {
            'title': 'English 1st Paper - Grammar',
            'image': 'https://via.placeholder.com/50',
          },
          {
            'title': 'English 1st Paper - Composition',
            'image': 'https://via.placeholder.com/50',
          },
        ],
      },
      {
        'category': 'English 2nd Paper',
        'items': [
          {
            'title': 'English 2nd Paper - Literature',
            'image': 'https://via.placeholder.com/50',
          },
          {
            'title': 'English 2nd Paper - Writing Skills',
            'image': 'https://via.placeholder.com/50',
          },
        ],
      },
    ],
  };
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
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    // Image
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.network(
                        items[index]['image']!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.error,
                            color: Colors.black,
                          );
                        },
                      ),
                    ),
                    16.widthBox, // Space between image and title
                    // Title
                    Expanded(
                        child:
                            items[index]['title']!.text.semiBold.black.make()),
                  ],
                );
              },
            ),
          ],
        ).box.roundedSM.white.shadowSm.clip(Clip.antiAlias).make(),
        10.heightBox,
        Column(
          children: subjects.entries.map((subject) {
            return ExpansionTile(
              childrenPadding: EdgeInsets.symmetric(horizontal: 10),
              title:subject.key.text.semiBold.black.make(),
              subtitle: 'Tap to see papers'.text.semiBold.black.make(),
              children: subject.value.map((category) {
                return ExpansionTile(
                  childrenPadding: EdgeInsets.symmetric(horizontal: 10),
                  title: '${category['category']}'.text.semiBold.black.make(),
                  subtitle:'Tap to see sections'.text.semiBold.black.make(),
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: (category['items'] as List).length,
                      itemBuilder: (context, index) {
                        final item = category['items'][index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              // Image
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.network(
                                  item['image'],
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(Icons.error,color: Colors.black,);
                                  },
                                ),
                              ),
                              SizedBox(width: 16),
                              // Title
                              Expanded(
                                child: "${item['title']}".text.semiBold.black.make(),
                              ),
                            ],
                          ),
                        );
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
