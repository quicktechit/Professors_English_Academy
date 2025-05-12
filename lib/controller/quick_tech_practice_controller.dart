import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/model/practice_question_model.dart';
import 'package:professors_english_academy/pages/reasult%20page/quick_tech_result_screen.dart';

import '../model/quick_tech_reasult_model.dart';

class PracticeController extends GetxController {
  var question = PracticeQuestionModel().obs;
  var singleExam = QuestionData().obs;
  var selectedAnswers = <int, Rx<Map<String, dynamic>>>{}.obs;
  var box=GetStorage();
  Rxn<ResultModel> lastResult = Rxn<ResultModel>();

  @override
  void onInit() {
    selectedAnswers.value = <int, Rx<Map<String, dynamic>>>{};
    super.onInit();
  }

  Future<void> fetchPracticeSubQuestion(String id) async {
    final url = Uri.parse("${Api.practiceSubcategory}$id");
    LoaderService.to.showLoader();
    log(url.toString());
    question.value=PracticeQuestionModel();
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        LoaderService.to.hideLoader();
        final data = json.decode(response.body);
        question.value = PracticeQuestionModel.fromJson(data);

        log('Data fetched successfully: $data');
      } else {
        LoaderService.to.hideLoader();
        log('Failed to load data. Status code: ${response.statusCode}');
      }
      question.refresh();
    } catch (e) {
      LoaderService.to.hideLoader();
      log('Error occurred: $e');
    }
  }

  void updateAnswer(int questionId, String optionText, int optionId) {
    if (!selectedAnswers.containsKey(questionId)) {
      selectedAnswers[questionId] = Rx<Map<String, dynamic>>({});
    }
    selectedAnswers[questionId]!.value = {
      'option': optionText,
      'option_id': optionId,
    };
    selectedAnswers.refresh();
    log('Updated answer for Q$questionId: $optionText (ID: $optionId)');
  }

  void clearAnswers() {
    selectedAnswers.clear();
  }

  Map<String, dynamic> getAnswersForSubmission() {
    final answers = selectedAnswers.entries.map((entry) {
      return {
        'question_id': entry.key,
        'selected_option_id': entry.value.value['option_id'] ?? 0,
      };
    }).toList();
    return {'answers': answers};
  }

  Future<bool> submitAnswers(String id) async {
    final url = Uri.parse("${Api.submitAnswer}$id");
    LoaderService.to.showLoader();
log(url.toString(),name: 'Url');
    try {
      final body = jsonEncode(getAnswersForSubmission());
      log('Submitting answers: $body');

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${box.read("token")}',
        },
        body: body,
      );
      log(box.read("token"));
      log(response.statusCode.toString());
      LoaderService.to.hideLoader();
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        lastResult.value = ResultModel.fromJson(data);
        log('ResultModel: ${lastResult.value?.toJson()}');
        Get.to(()=>QuickTechResultScreen());
        Get.snackbar('Success', 'Answers submitted successfully');
        clearAnswers();
        return true;
      } else {
        Get.snackbar(
            'Error', 'Failed to submit answers: ${response.statusCode}');
        log('Error response: ${response.body}');
        return false;
      }
    } catch (e) {
      LoaderService.to.hideLoader();
      Get.snackbar('Error', 'An error occurred: $e');
      log('Submission error: $e');
      return false;
    }
  }

  bool canSubmit() {
    final questions =
        question.value.data?.expand((exam) => exam.questions ?? []).toList() ??
            [];
    return questions.every((q) => selectedAnswers.containsKey(q.id));
  }
}
