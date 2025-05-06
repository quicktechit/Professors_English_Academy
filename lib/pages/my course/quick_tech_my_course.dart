import 'package:professors_english_academy/consts/consts.dart';

import '../../widgets/quick_tech_custom_mycourse.dart';

class QuickTechMyCourse extends StatefulWidget {
  const QuickTechMyCourse({super.key});

  @override
  State<QuickTechMyCourse> createState() => _QuickTechMyCourseState();
}

class _QuickTechMyCourseState extends State<QuickTechMyCourse> {
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
              padding: EdgeInsets.symmetric(horizontal: dynamicSize-10),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return myCourse(context: context);
              },
            ),
          )
        ],
      ),
    );
  }
}
