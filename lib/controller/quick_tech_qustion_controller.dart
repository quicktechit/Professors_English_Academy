import 'dart:async';

import 'package:professors_english_academy/controller/quick_tech_practice_controller.dart';

import '../consts/consts.dart';

class ExamController extends GetxController {
  var timeInSeconds =0.obs;
  String get formattedTime => _formatTime(timeInSeconds.value);
  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }
  final PracticeController practiceController=Get.find();
  void _startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeInSeconds.value == 0) {
        timer.cancel();
      } else {
        timeInSeconds.value--;
      }
    });
  }
  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }


}

