import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/pages/category/quick_tech_single_subject_category.dart';

import '../../widgets/custom_category_card_design.dart';
import '../../widgets/quick_tech_custom_row_design.dart';
import '../all course list page/quick_tech_category_course_list_page.dart';

class QuickTechCategoryPage extends StatefulWidget {
  const QuickTechCategoryPage({super.key});

  @override
  State<QuickTechCategoryPage> createState() => _QuickTechCategoryPageState();
}

class _QuickTechCategoryPageState extends State<QuickTechCategoryPage> {
  final List<String> title = [
    "Bangla",
    "English",
    "Math",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: "Category".text.semiBold.make(),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: dynamicSize),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.heightBox,
                  customRow(context, title[index], "See All", () {
                    Get.to(() => QuickTechSingleSubjectCategory());
                  }).p8(),
                  15.heightBox,
                  // GridView inside Column
                  GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    physics: NeverScrollableScrollPhysics(), // Disable GridView scrolling
                    shrinkWrap: true, // Fit content
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 columns
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 1.0, // Square items
                    ),
                    itemCount: 4, // 4 items per grid
                    itemBuilder: (context, gridIndex) {
                      return customCard(context,"https://images.pexels.com/photos/206359/pexels-photo-206359.jpeg","20").onTap((){
                        Get.to(() => QuickTechCategoryCourseListPage());
                      }).animate().fadeIn(delay: (gridIndex*150).ms);
                    },
                  ),
                  10.heightBox,
                ],
              )
                  .box
                  .padding(EdgeInsets.symmetric(horizontal: 5)).color(Colors.primaries[index*2 % Colors.primaries.length]
                  .shade100).margin(EdgeInsets.symmetric(vertical: 10)).rounded
                  .make().animate().fadeIn().move(
                  begin: const Offset(0, 200),
                  end: const Offset(0, 0),
                  delay: 100.ms,
                  duration: 380.ms);
            },
          ),
        ],
      ),
    );
  }
}
