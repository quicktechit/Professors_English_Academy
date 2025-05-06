import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/model/course_details_model.dart';
import 'package:professors_english_academy/pages/course_details/quick_tech_custom_course_details.dart';

class CourseDetailsController extends GetxController{
  var courseDetails = CourseDetailsModel().obs;
  var selectedIndex=0.obs;

  Future<void> fetchCourseDetails(String courseId) async {
    final url = Uri.parse(Api.courseDetails + courseId);
    log(url.toString());
    LoaderService.to.showLoader();
    final request = http.Request('GET', url);
    final response = await request.send();
    courseDetails.value = CourseDetailsModel();
    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final data = jsonDecode(responseBody);
      courseDetails.value = CourseDetailsModel.fromJson(data);
      LoaderService.to.hideLoader();
      Get.to(() => QuickTechCustomCourseDetails());

      print('Course details: $data');
    } else {
      LoaderService.to.hideLoader();

      print(
          'Request failed with status: ${response.statusCode}, reason: ${response.reasonPhrase}');
    }
    courseDetails.refresh();
  }
}