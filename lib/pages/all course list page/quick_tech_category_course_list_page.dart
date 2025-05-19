import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/controller/quick_tech_subcategory_controller.dart';

import '../../controller/quick_tech_course_details_controller.dart';
import '../../widgets/quick_tech_custom_course_list.dart';

class QuickTechCategoryCourseListPage extends StatefulWidget {
  final String subjectName;

  const QuickTechCategoryCourseListPage({super.key, required this.subjectName});

  @override
  State<QuickTechCategoryCourseListPage> createState() => _QuickTechCategoryCourseListPageState();
}

class _QuickTechCategoryCourseListPageState extends State<QuickTechCategoryCourseListPage> {
  final SubCategoryController subCategoryController =
      Get.put(SubCategoryController());
  final CourseDetailsController courseDetailsController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.subjectName.text.semiBold.make(),
      ),
      body: Obx(() {
        var dataList = subCategoryController.subCategory.value.data;

        if (dataList == null || dataList.isEmpty) {
          return Lottie.asset("assets/icons/empty.json").centered();
        } else {
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            shrinkWrap: true,
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              var data = dataList[index];

              return customCourseListHistory(
                  context: context,
                  image: "${data.thumbnilImage}",
                  title: '${data.name}',
                  student: '${data.enrolledCount}',
                  exam: '${data.quizCount}',
                  clas: '${data.classCount}',
                  rating: '${data.reviewAvgRating ?? 0} (${data.reviewCount})',
                  price: data.buy=="Free"?"Free":'${data.price}')
                  .onTap(() {
                courseDetailsController.fetchCourseDetails(data.id.toString());
              })
                  .animate()
                  .fadeIn(delay: (index * 150).ms);
            },
          );
        }
      }),
    );
  }

}
