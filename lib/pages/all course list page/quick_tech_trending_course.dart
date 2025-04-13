import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/pages/course_details/quick_tech_custom_course_details.dart';

import '../../widgets/quick_tech_custom_course_list.dart';

class QuickTechTrendingCourse extends StatefulWidget {
  const QuickTechTrendingCourse({super.key});

  @override
  State<QuickTechTrendingCourse> createState() => _QuickTechTrendingCourseState();
}

class _QuickTechTrendingCourseState extends State<QuickTechTrendingCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Trending Course".text.semiBold.make(),
        centerTitle: true,

      ),
      body: Column(children: [
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
      ],),
    );
  }
}
