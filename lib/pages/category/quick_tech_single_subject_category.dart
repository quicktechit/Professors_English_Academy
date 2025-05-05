import 'dart:developer';

import '../../consts/consts.dart';
import '../../controller/quick_tech_subcategory_controller.dart';
import '../../model/category_model.dart';
import '../../widgets/custom_category_card_design.dart';
import '../all course list page/quick_tech_category_course_list_page.dart';

class QuickTechSingleSubjectCategory extends StatefulWidget {
  final String subjectName;
  final List<Subcategories> subcategories;

  const QuickTechSingleSubjectCategory(
      {super.key, required this.subjectName, required this.subcategories});

  @override
  State<QuickTechSingleSubjectCategory> createState() => _QuickTechSingleSubjectCategoryState();
}

class _QuickTechSingleSubjectCategoryState extends State<QuickTechSingleSubjectCategory> {
  final SubCategoryController subCategoryController =
      Get.put(SubCategoryController());
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
              var item = widget.subcategories[gridIndex];
              return customCard(context, "${item.image}", "${item.coursesCount}")
                  .onTap((){
                    log(item.id.toString());
                    subCategoryController
                        .fetchSubCategory(item.id.toString())
                        .then((V) {
                      Get.to(() => QuickTechCategoryCourseListPage(
                            subjectName: item.name.toString(),
                          ));
                    });
                  }).animate().fadeIn(delay: (gridIndex*100).ms);
            },
          ),
        ],
      ),
    );
  }
}
