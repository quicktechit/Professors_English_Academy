import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/controller/quick_tech_course_details_controller.dart';
import 'package:professors_english_academy/model/profile_model.dart';

import '../../widgets/quick_tech_custom_mycourse.dart';

class QuickTechMyCourse extends StatefulWidget {
  final List<EnrolledCourses> enrollCourse;

  const QuickTechMyCourse({super.key, required this.enrollCourse});

  @override
  State<QuickTechMyCourse> createState() => _QuickTechMyCourseState();
}

class _QuickTechMyCourseState extends State<QuickTechMyCourse> {
  final CourseDetailsController courseDetailsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "My Course".text.semiBold.make(),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: dynamicSize - 10),
              shrinkWrap: true,
              itemCount: widget.enrollCourse.length,
              itemBuilder: (context, index) {
                var data = widget.enrollCourse[index];
                return myCourse(
                  context: context,
                  id: data.id.toString(),
                  title: data.name.toString(),
                  image: data.thumbnilImage.toString(),
                  complete: data.moduleCompletedPercentage.toString(),
                ).onTap(() {
                  courseDetailsController
                      .fetchCourseDetails(data.id.toString());
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
