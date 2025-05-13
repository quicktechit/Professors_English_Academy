import 'dart:developer';

import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/pages/category/quick_tech_single_subject_category.dart';

import '../../controller/quick_tech_home_controller.dart';
import '../../controller/quick_tech_subcategory_controller.dart';
import '../../widgets/custom_category_card_design.dart';
import '../../widgets/quick_tech_custom_row_design.dart';
import '../all course list page/quick_tech_category_course_list_page.dart';

class QuickTechCategoryPage extends StatefulWidget {
  const QuickTechCategoryPage({super.key});

  @override
  State<QuickTechCategoryPage> createState() => _QuickTechCategoryPageState();
}

class _QuickTechCategoryPageState extends State<QuickTechCategoryPage> {
  final HomeController homeController = Get.find();
  final SubCategoryController subCategoryController =
  Get.put(SubCategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: "Category".text.semiBold.make(),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await homeController.fetchCategory();
        },
        child: ListView(
          children: [
            ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: dynamicSize),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: homeController.category.value.data!.length >= 4
                  ? 4
                  : homeController.category.value.data?.length,
              itemBuilder: (context, index) {
                var item = homeController.category.value.data?[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.heightBox,
                    customRow(context, "${item?.name}", "See All", () {
                      Get.to(() => QuickTechSingleSubjectCategory(
                            subjectName: "${item?.name}",
                            subcategories: item?.subcategories?.toList() ?? [],
                          ));
                    }).p8(),
                    15.heightBox,
                    // GridView inside Column
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
                      itemCount: item!.subcategories!.length >= 4
                          ? 4
                          : item.subcategories?.length,
                      itemBuilder: (context, gridIndex) {
                        var data = item.subcategories?[gridIndex];
                        return customCard(context, "${data?.image}",
                                "${data?.coursesCount.toString()}")
                            .onTap(() {
                              log("${data?.id.toString()}");
                              subCategoryController
                                  .fetchSubCategory("${data?.id.toString()}")
                                  .then((V) {
                                Get.to(() => QuickTechCategoryCourseListPage(
                                      subjectName: "${data?.name.toString()}",
                                    ));
                              });
                            })
                            .animate()
                            .fadeIn(delay: (gridIndex * 150).ms);
                      },
                    ),
                    10.heightBox,
                  ],
                )
                    .box
                    .padding(EdgeInsets.symmetric(horizontal: 5))
                    .color(Colors.primaries[index * 2 % Colors.primaries.length]
                        .shade100)
                    .margin(EdgeInsets.symmetric(vertical: 10))
                    .rounded
                    .make()
                    .animate()
                    .fadeIn()
                    .move(
                        begin: const Offset(0, 200),
                        end: const Offset(0, 0),
                        delay: 100.ms,
                        duration: 380.ms);
              },
            ),
          ],
        ),
      ),
    );
  }
}
