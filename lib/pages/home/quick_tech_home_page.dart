import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/controller/quick_tech_home_controller.dart';
import 'package:professors_english_academy/controller/quick_tech_profile_controller.dart';
import 'package:professors_english_academy/pages/all%20course%20list%20page/quick_tech_trending_course.dart';
import 'package:professors_english_academy/pages/category/quick_tech_single_subject_category.dart';
import 'package:professors_english_academy/pages/course_details/quick_tech_custom_course_details.dart';
import 'package:professors_english_academy/widgets/appar/quick_tech_custom_appbar.dart';
import 'package:professors_english_academy/widgets/quick_tech_custom_course_list.dart';
import 'package:professors_english_academy/widgets/quick_tech_custom_row_design.dart';

import '../../controller/quick_tech_dashboard_controller.dart';
import '../../controller/quick_tech_practice_controller.dart';
import '../../widgets/custom_category_card_design.dart';
import '../practice/quick_tech_single_practice_category.dart';

class QuickTechHomePage extends StatefulWidget {
  const QuickTechHomePage({super.key});

  @override
  State<QuickTechHomePage> createState() => _QuickTechHomePageState();
}

class _QuickTechHomePageState extends State<QuickTechHomePage> {
  final HomeController homeController = Get.find();
  final PracticeController practiceController = Get.put(PracticeController());

  final ProfileController profileController = Get.find();
  final List<String> items = [
    "assets/images/banner1.jpg",
    "assets/images/banner2.jpg",
  ];
  final List<String> title = [
    "Bangla",
    "English",
    "Math",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      profileController.getProfile();
    });
  }

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
            Obx(() {
              var data = homeController.slider.value;

              return data.data!.isNotEmpty
                  ? VxSwiper(
                      items: data.data!.map((image) {
                        return VxBox(
                          child: Image.network(
                            Api.imageUrl + image.photoName.toString(),
                            fit: BoxFit.cover,
                          ),
                        )
                            .roundedSM
                            .margin(EdgeInsets.symmetric(horizontal: 5))
                            .clip(Clip.antiAlias) // Optional: small shadow
                            .make()
                            .onTap(() {
                          Get.to(() => QuickTechCustomCourseDetails());
                        });
                      }).toList(),
                      height: 180,
                      viewportFraction: 1.0,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: 3.seconds,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index) {},
                    )
                      .box
                      .roundedSM
                      .clip(Clip.antiAlias)
                      .makeCentered()
                      .animate()
                      .fadeIn(delay: 50.ms)
                  : "NO SliderImage Found".text.semiBold.makeCentered();
            }),
            20.heightBox,
            customRow(context, "Trending Course", "See All", () {
              Get.to(()=>QuickTechTrendingCourse());
            }).animate().fadeIn(delay: 70.ms),
            10.heightBox,
            Obx(
                ()=> ListView.builder(
                  shrinkWrap: true,
                  itemCount: homeController.trending.value.data!.length >= 4
                      ? 4
                      : homeController.trending.value.data?.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var data = homeController.trending.value.data?[index];
                    return customCourseList(
                            context: context,
                            image: "${data?.thumbnilImage}",
                            title: '${data?.name}',
                            student: '',
                            exam: '',
                            clas: '',
                            rating: '${data?.reviewAvgRating??0} (${data?.reviewCount})',
                            price: '')
                        .onTap(() {
                          Get.to(()=>QuickTechCustomCourseDetails());
                    }).animate().fadeIn(delay: (index*100).ms);
                  }).h(295),
            ),
            20.heightBox,
            customRow(context, "Categories", "See All", () {
              dashboardController.currentIndex.value = 1;
            }).animate().fadeIn(delay: 120.ms),
            Obx(
                ()=> GridView.builder(
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
                itemCount: homeController.category.value.data!.length >= 4
                    ? 4
                    : homeController.category.value.data?.length,
                // 4 items per grid
                itemBuilder: (context, gridIndex) {
                  var item = homeController.category.value.data?[gridIndex];
                  return customCard(context, "${item?.image}",
                          "${item?.subcategories?.length}")
                      .onTap(() {
                        Get.to(() => QuickTechSingleSubjectCategory(
                              subjectName: "${item?.name}",
                              subcategories: item?.subcategories?.toList() ?? [],
                            ));
                      })
                      .animate()
                      .fadeIn(delay: (gridIndex * 100).ms);
                },
              )
                  .box
                  .padding(EdgeInsets.symmetric(horizontal: 5,vertical: 10))
                  .purple100
                  .margin(EdgeInsets.symmetric(vertical: 10))
                  .rounded
                  .make(),
            ),
            20.heightBox,
            customRow(context, "Practice", "See All", () {
              dashboardController.currentIndex.value = 2;
            }),
            10.heightBox,
            Obx(
                ()=> GridView.builder(
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
                itemCount: homeController.practice.value.data!.length >= 4
                    ? 4
                    : homeController.practice.value.data?.length,
                // 4 items per grid
                itemBuilder: (context, gridIndex) {
                  var item = homeController.practice.value.data?[gridIndex];
                  return customCard(context, "${item?.image}",
                          "${item?.subcategories?.length}")
                      .onTap(() {
                        Get.to(() => QuickTechSinglePracticeCategory(
                              subjectName: "${item?.name}",
                              subcategories: item?.subcategories?.toList() ?? [],
                            ));
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
            ),
            10.heightBox,
          ],
        ).pSymmetric(h: dynamicSize),
      ),
    );
  }
}
