import 'package:professors_english_academy/pages/Practice/quick_tech_practice_qustion_list_page.dart';

import '../../consts/consts.dart';
import '../../widgets/custom_category_card_design.dart';
import '../all course list page/quick_tech_category_course_list_page.dart';

class QuickTechSinglePracticeCategory extends StatefulWidget {
  const QuickTechSinglePracticeCategory({super.key});

  @override
  State<QuickTechSinglePracticeCategory> createState() => _QuickTechSinglePracticeCategory();
}

class _QuickTechSinglePracticeCategory extends State<QuickTechSinglePracticeCategory> {
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
              return customCard(context,gridIndex)
                  .onTap((){
                Get.to(() => QuickTechPracticeQuestionListPage());
              }).animate().fadeIn(delay: (gridIndex*100).ms);
            },
          ),
        ],
      ),
    );
  }
}
