import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/pages/all%20course%20list%20page/quick_tech_trending_course.dart';
import 'package:professors_english_academy/widgets/appar/quick_tech_custom_appbar.dart';
import 'package:professors_english_academy/widgets/quick_tech_custom_course_list.dart';
import 'package:professors_english_academy/widgets/quick_tech_custom_row_design.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    .make();
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
            ).box.roundedSM.clip(Clip.antiAlias).makeCentered(),
            20.heightBox,
            customRow(context, "Trending Course", "See All", () {
              Get.to(()=>QuickTechTrendingCourse());
            }),
            10.heightBox,
            ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return customCourseList(context);
                }).h(295)
          ],
        ).pSymmetric(h: dynamicSize),
      ),
    );
  }
}
