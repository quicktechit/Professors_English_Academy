import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:professors_english_academy/consts/consts.dart';

class MyCourseController extends GetxController {
  var rating = 0.0.obs;
  var box = GetStorage();
  var note = TextEditingController();

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

  Future<void> submitReview({required String id}) async {
    final url = Uri.parse(Api.courseReview + id);

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${box.read("token")}',
    };

    final body = json.encode({
      'rating': rating.value,
      'review_text': note.text.trim(),
    });

    try {
      LoaderService.to.showLoader();
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        LoaderService.to.hideLoader();
        Get.back();
        Get.snackbar('Review submitted successfully',"");
        note.clear();
        rating.value=0.0;
      } else {
        LoaderService.to.hideLoader();
        print('Failed to submit review. Status code: ${response.statusCode}');
      }
    } catch (e) {
      LoaderService.to.hideLoader();
      print('Error occurred: $e');
    }
  }
}
