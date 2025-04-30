import '../../consts/consts.dart';
import '../../widgets/custom_category_card_design.dart';
import '../all course list page/quick_tech_category_course_list_page.dart';

class QuickTechSingleSubjectCategory extends StatefulWidget {
  const QuickTechSingleSubjectCategory({super.key});

  @override
  State<QuickTechSingleSubjectCategory> createState() => _QuickTechSingleSubjectCategoryState();
}

class _QuickTechSingleSubjectCategoryState extends State<QuickTechSingleSubjectCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
      title: "Subject Name".text.semiBold.make(),
      ),
      body: ListView(
        children: [
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
              return customCard(context,"https://images.pexels.com/photos/206359/pexels-photo-206359.jpeg","20")
                  .onTap((){
                Get.to(() => QuickTechCategoryCourseListPage());
              }).animate().fadeIn(delay: (gridIndex*100).ms);
            },
          ),
        ],
      ),
    );
  }
}
