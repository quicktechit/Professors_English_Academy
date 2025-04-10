import 'dart:async';

import '../consts/consts.dart';

class QuestionController extends GetxController {
  var timeInSeconds = 120.obs;
  String get formattedTime => _formatTime(timeInSeconds.value);

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  // Timer function to countdown every second
  void _startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeInSeconds.value == 0) {
        timer.cancel(); // Stop the timer when it reaches 0
      } else {
        timeInSeconds.value--; // Decrement the time by 1 second
      }
    });
  }

  // Format the time in mm:ss format
  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  var questions = [
    Question(id: 1, options: [' A', 'B', 'C', 'D']),
    Question(id: 2, options: ['A', 'B', 'C', 'D']),
    Question(id: 3, options: ['A', 'B', 'C', 'D']),
    Question(id: 4, options: ['A', 'B', 'C', 'D']),
  ].obs;// Observable list of questions

  // Method to set the selected option
  void setSelectedOption(int questionId, String selectedOption) {
    final question = questions.firstWhere((q) => q.id == questionId);
    question.selectedOption.value = selectedOption;
  }
}

class Question {
  final int id;
  final List<String> options;
  RxString selectedOption; // RxString to make it reactive

  Question({required this.id, required this.options, String? selectedOption})
      : selectedOption = (selectedOption ?? '').obs; // Initialize as RxString

}