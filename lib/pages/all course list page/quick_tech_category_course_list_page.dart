import 'package:professors_english_academy/consts/consts.dart';

import '../../widgets/quick_tech_custom_course_list.dart';
import '../course_details/quick_tech_custom_course_details.dart';

class QuickTechCategoryCourseListPage extends StatefulWidget {
  const QuickTechCategoryCourseListPage({super.key});

  @override
  State<QuickTechCategoryCourseListPage> createState() => _QuickTechCategoryCourseListPageState();
}

class _QuickTechCategoryCourseListPageState extends State<QuickTechCategoryCourseListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Course title".text.semiBold.make(),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context,index){
                  return customCourseListHori(context).onTap((){
                    Get.to(()=>QuickTechCustomCourseDetails());
                  }).animate().fadeIn(delay: (index*150).ms);
                }),
          )
        ],
      ),
    );
  }
}
