import 'package:professors_english_academy/consts/consts.dart';

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
            shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context,index){
            return customCourseListHori(context);
          }),
        )
      ],),
    );
  }
}
