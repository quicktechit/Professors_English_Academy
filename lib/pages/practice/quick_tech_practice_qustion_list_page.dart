import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/pages/exam%20page/quick_tech_exam_page.dart';
import 'package:professors_english_academy/widgets/quick_tech_custom_question_list_design.dart';
class QuickTechPracticeQuestionListPage extends StatefulWidget {
  const QuickTechPracticeQuestionListPage({super.key});

  @override
  State<QuickTechPracticeQuestionListPage> createState() =>
      _QuickTechPracticeQuestionListPageState();
}

class _QuickTechPracticeQuestionListPageState
    extends State<QuickTechPracticeQuestionListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Subject Name".text.semiBold.make(),
      ),
      body: ListView(
        children: [
          ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: dynamicSize),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context ,index){
            return customQuestionList(context).onTap((){
              Get.to(()=>QuickTechExamPage());
            }).animate().fadeIn(delay: (index*100).ms);
          })
        ],
      ),
    );
  }
}
