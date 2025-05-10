import 'package:flutter/cupertino.dart';

import '../consts/consts.dart';
import '../model/quiz_result_model.dart';

Widget overallPerformanceSummary(  ResultData data){
  double accuracy = 0.0;
  if (data.totalQuestions != null && data.totalQuestions! > 0) {
    accuracy = (data.rightAnswerCount! / data.totalQuestions!) * 100;
  }
  return Card(
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Total Attempts: ${data.attemptCount}",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text("Total Questions Answered: ${data.totalQuestions}"),
          Text("Correct Answers: ${data.rightAnswerCount}"),
          Text("Wrong Answers: ${data.wrongAnswerCount}"),
          Text("Quiz Accuracy: ${accuracy.toStringAsFixed(2)}%"),
          SizedBox(height: 10),
          LinearProgressIndicator(
            value: (data.totalQuestions != null && data.totalQuestions! > 0)
                ? data.rightAnswerCount! / data.totalQuestions!
                : 0.0,
            backgroundColor: Colors.grey.shade300,
            color: Colors.green,
          ),
        ],
      ),
    ),
  );
}

Widget quizCard(BuildContext context,QuizScores quiz){
  return Card(
    elevation: 4,
    margin: EdgeInsets.symmetric(vertical: 8),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            quiz.quizName ?? "Unknown Quiz",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
              "Correct Answers: ${quiz.rightanswer ?? 0}/${quiz.totalquestion ?? 0}"),
          Text(
              "Score: ${((quiz.rightanswer! / quiz.totalquestion!) * 100).toStringAsFixed(2)}%"),
          TextButton(
            onPressed: () {
              // Show detailed results when clicked
            Get.bottomSheet(quizDetailsBottomSheet(quiz.correctAnswers!),backgroundColor: Colors.white);
            },
            child: Text("View Answer"),
          ),
        ],
      ),
    ),
  );
}

Widget quizDetailsBottomSheet(List<CorrectAnswers> details) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Quiz Answers",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        // Map over the details and create a list of questions and answers
        Expanded(
          child: ListView.builder(
            itemCount: details.length,
            itemBuilder: (context, index) {
              final item = details[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: "${item.question}: ${item.correctOption} (Correct Answer)".text.semiBold.make().p4()
              );
            },
          ),
        ),
        SizedBox(height: 10),
        // Close button at the bottom of the sheet
        Center(
          child: ElevatedButton(
            onPressed: () {
              Get.back(); // Close the bottom sheet
            },
            child: Text("Close"),
          ),
        ),
      ],
    ),
  );
}
