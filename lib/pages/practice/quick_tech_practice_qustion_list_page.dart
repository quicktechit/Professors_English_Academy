import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/pages/exam%20page/quick_tech_exam_page.dart';
import 'package:professors_english_academy/widgets/quick_tech_custom_question_list_design.dart';

import '../../controller/quick_tech_practice_controller.dart';

class QuickTechPracticeQuestionListPage extends StatefulWidget {
  final String subjectName;
  const QuickTechPracticeQuestionListPage({super.key, required this.subjectName});

  @override
  State<QuickTechPracticeQuestionListPage> createState() =>
      _QuickTechPracticeQuestionListPageState();
}

class _QuickTechPracticeQuestionListPageState
    extends State<QuickTechPracticeQuestionListPage> {
  final PracticeController practiceController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.subjectName.text.semiBold.make(),
      ),
      body: ListView(
        children: [
          10.heightBox,
          Obx(
              ()=>practiceController.question.value.data==null?
                  "NO Question Found".text.semiBold.lg
              .makeCentered():
              ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: dynamicSize),
                shrinkWrap: true,
                itemCount: practiceController.question.value.data?.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context ,index){
                  var item = practiceController.question.value.data?[index];
                  if(item?.id==null){
                    return "Empty File".text.semiBold.make();
                  }
                  return customQuestionList(context, item?.name, item?.timer,
                          item?.questions?.length.toString())
                      .onTap(() {
                        practiceController.singleExam.value=item!;
                        Get.to(()=>QuickTechExamPage(pdfs: item.pdf.toString(),));
              }).animate().fadeIn(delay: (index*100).ms);
                }),
          ),
          10.heightBox,
        ],
      ),
    );
  }
}
