import 'package:professors_english_academy/controller/quick_tech_profile_controller.dart';

import '../../consts/consts.dart';
import '../../model/quiz_result_model.dart';
import '../../widgets/quick_tech_custom_my_quiz.dart';

class QuickTechMyQuizes extends StatelessWidget {
  final ProfileController controller = Get.find();

  QuickTechMyQuizes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Results Overview"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.quizResultModel.value.status == "success" &&
              controller.quizResultModel.value.data != null) {
            final data = controller.quizResultModel.value.data!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Overall Performance Summary
                overallPerformanceSummary(data),
                10.heightBox,
                Divider(

                ),
                10.heightBox,

                Expanded(
                  child: ListView.builder(
                    itemCount: data.quizScores!.length,
                    itemBuilder: (context, index) {
                      final quiz = data.quizScores![index];
                      return quizCard(context, quiz);
                    },
                  ),
                ),
              ],
            );
          } else {
            return Center(child: Text('Error: No data available.'));
          }
        }),
      ),
    );
  }
}





