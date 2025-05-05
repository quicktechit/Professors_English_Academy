import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/pages/course_details/quick_tech_custom_course_details.dart';

import '../../controller/quick_tech_home_controller.dart';
import '../../widgets/quick_tech_custom_course_list.dart';

class QuickTechTrendingCourse extends StatefulWidget {
  const QuickTechTrendingCourse({super.key});

  @override
  State<QuickTechTrendingCourse> createState() => _QuickTechTrendingCourseState();
}

class _QuickTechTrendingCourseState extends State<QuickTechTrendingCourse> {
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Trending Course".text.semiBold.make(),
        centerTitle: true,

      ),
      body: Obx(
          ()=> Column(children: [
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10),
              shrinkWrap: true,
                  itemCount: homeController.trending.value.data?.length,
                  itemBuilder: (context, index) {
                    var data = homeController.trending.value.data?[index];
                    return customCourseListHistory(
                            context: context,
                            image: '${data?.thumbnilImage}',
                            title: '${data?.name}',
                            student: '',
                            exam: '',
                            clas: '',
                            rating:
                                '${data?.reviewAvgRating ?? 0} (${data?.reviewCount})',
                            price: '${data?.price}')
                        .onTap(() {
                          Get.to(() => QuickTechCustomCourseDetails());
                        }).animate().fadeIn(delay: (index*150).ms);
            }),
          )
        ],),
      ),
    );
  }
}
