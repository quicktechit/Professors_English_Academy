import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/pages/all%20course%20list%20page/quick_tech_trending_course.dart';
import 'package:professors_english_academy/pages/category/quick_tech_single_subject_category.dart';
import 'package:professors_english_academy/pages/course_details/quick_tech_custom_course_details.dart';
import 'package:professors_english_academy/widgets/appar/quick_tech_custom_appbar.dart';
import 'package:professors_english_academy/widgets/quick_tech_custom_course_list.dart';
import 'package:professors_english_academy/widgets/quick_tech_custom_row_design.dart';

import '../../controller/quick_tech_dashboard_controller.dart';
import '../../widgets/custom_category_card_design.dart';
import '../Practice/quick_tech_practice_qustion_list_page.dart';
import '../all course list page/quick_tech_category_course_list_page.dart';
import '../practice/quick_tech_single_practice_category.dart';

class QuickTechHomePage extends StatefulWidget {
  const QuickTechHomePage({super.key});

  @override
  State<QuickTechHomePage> createState() => _QuickTechHomePageState();
}

class _QuickTechHomePageState extends State<QuickTechHomePage> {
  final List<String> items = [
    "assets/images/banner3 (1).jpg",
    "assets/images/banner1.jpg",
    "assets/images/banner2.jpg",
  ];
  final List<String> title = [
    "Bangla",
    "English",
    "Math",
  ];
  final DashboardController dashboardController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: customAppbar(context)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            20.heightBox,
            VxSwiper(

              items: items.map((image) {
                return VxBox(
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                )
                    .roundedSM
                    .margin(EdgeInsets.symmetric(horizontal: 5))
                    .clip(Clip.antiAlias) // Optional: small shadow
                    .make().onTap((){
                      Get.to(()=>QuickTechCustomCourseDetails());
                });
              }).toList(),
              height: 180,
              viewportFraction: 1.0,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: 3.seconds,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {

              },
            ).box.roundedSM.clip(Clip.antiAlias).makeCentered().animate().fadeIn(delay: 50.ms),
            20.heightBox,
            customRow(context, "Trending Course", "See All", () {
              Get.to(()=>QuickTechTrendingCourse());
            }).animate().fadeIn(delay: 70.ms),
            10.heightBox,
            ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return customCourseList(context).onTap((){
                    Get.to(()=>QuickTechCustomCourseDetails());
                  }).animate().fadeIn(delay: (index*100).ms);
                }).h(295),
            20.heightBox,
            customRow(context, "Categories", "See All", () {
              dashboardController.currentIndex.value = 1;
            }).animate().fadeIn(delay: 120.ms),
            GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 8),
              physics: NeverScrollableScrollPhysics(),
              // Disable GridView scrolling
              shrinkWrap: true,
              // Fit content
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columns
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 1.0, // Square items
              ),
              itemCount: 4,
              // 4 items per grid
              itemBuilder: (context, gridIndex) {
                return customCard(context,gridIndex).onTap(() {
                  Get.to(() => QuickTechSingleSubjectCategory());
                }).animate().fadeIn(delay: (gridIndex*100).ms);
              },
            )
                .box
                .padding(EdgeInsets.symmetric(horizontal: 5,vertical: 10))
                .purple100
                .margin(EdgeInsets.symmetric(vertical: 10))
                .rounded
                .make(),
            20.heightBox,
            customRow(context, "Practice", "See All", () {
              dashboardController.currentIndex.value = 2;
            }),
            10.heightBox,
            GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 8),
              physics: NeverScrollableScrollPhysics(),
              // Disable GridView scrolling
              shrinkWrap: true,
              // Fit content
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columns
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 1.0, // Square items
              ),
              itemCount: 4,
              // 4 items per grid
              itemBuilder: (context, gridIndex) {
                return customCard(context,gridIndex)
                    .onTap(() {
                  Get.to(() => QuickTechSinglePracticeCategory());
                })
                    .animate()
                    .fadeIn(delay: (gridIndex * 150).ms);
              },
            ) .box
                .padding(EdgeInsets.symmetric(horizontal: 5,vertical: 10))
                .cyan100
                .margin(EdgeInsets.symmetric(vertical: 10))
                .rounded
                .make(),
            10.heightBox,
          ],
        ).pSymmetric(h: dynamicSize),
      ),
    );
  }
}
