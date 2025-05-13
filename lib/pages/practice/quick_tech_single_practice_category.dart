import 'dart:developer';

import 'package:professors_english_academy/model/pactrice_category_model.dart';
import 'package:professors_english_academy/pages/Practice/quick_tech_practice_qustion_list_page.dart';

import '../../consts/consts.dart';
import '../../controller/quick_tech_practice_controller.dart';
import '../../widgets/custom_category_card_design.dart';

class QuickTechSinglePracticeCategory extends StatefulWidget {
 final String subjectName;
 final List <Subcategories> subcategories;
  const QuickTechSinglePracticeCategory({super.key, required this.subjectName, required this.subcategories});

  @override
  State<QuickTechSinglePracticeCategory> createState() => _QuickTechSinglePracticeCategory();
}

class _QuickTechSinglePracticeCategory extends State<QuickTechSinglePracticeCategory> {
  final PracticeController practiceController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
      title: widget.subjectName.text.semiBold.make(),
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
            itemCount: widget.subcategories.length,
            // 4 items per grid
            itemBuilder: (context, gridIndex) {
              var item=widget.subcategories[gridIndex];
              return customCard(context,"${item.image}","${item.quizCount}",)
                  .onTap((){
                    log(item.id.toString());
                practiceController.fetchPracticeSubQuestion(item.id.toString()).then((v) {
                  Get.to(() => QuickTechPracticeQuestionListPage(subjectName: item.name.toString(),));
                });
              }).animate().fadeIn(delay: (gridIndex*100).ms);
            },
          ),
        ],
      ),
    );
  }
}
