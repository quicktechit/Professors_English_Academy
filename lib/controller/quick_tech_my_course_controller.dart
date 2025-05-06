import 'package:professors_english_academy/consts/consts.dart';
class MyCourseController extends GetxController{
  var rating = 0.0.obs;

  void updateRating(double value) {
    rating.value = value;
  }

  void submitRating() {
    if (rating.value == 0.0) {
      Get.snackbar('Error', 'Please select a rating before submitting.');
    } else {
      Get.snackbar('Thank You', 'You rated ${rating.value} star(s)!');
      // Here you can add API submission or save to a database
    }
  }
}