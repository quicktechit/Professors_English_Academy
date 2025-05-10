import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/model/course_details_model.dart';
import 'package:professors_english_academy/pages/course_details/quick_tech_custom_course_details.dart';
import 'package:professors_english_academy/pages/home/quick_tech_dashboard.dart';

class CourseDetailsController extends GetxController{
  var courseDetails = CourseDetailsModel().obs;
  var selectedIndex=0.obs;
  var box = GetStorage();

  Future<void> fetchCourseDetails(String courseId) async {
    final url = Uri.parse(Api.courseDetails + courseId);
    log(url.toString());

    LoaderService.to.showLoader();

    final request = http.Request('GET', url);

    // Add Bearer token here
    var token = box.read("token").toString();
    request.headers['Authorization'] = 'Bearer $token';
    request.headers['Content-Type'] = 'application/json';

    final response = await request.send();

    courseDetails.value = CourseDetailsModel();

    if (response.statusCode == 200) {
      LoaderService.to.hideLoader();
      final responseBody = await response.stream.bytesToString();
      final data = jsonDecode(responseBody);
      courseDetails.value = CourseDetailsModel.fromJson(data);
      Get.to(() => QuickTechCustomCourseDetails());

      print('Course details: $data');
    } else {
      LoaderService.to.hideLoader();

      print(
          'Request failed with status: ${response.statusCode}, reason: ${response.reasonPhrase}');
    }
    LoaderService.to.hideLoader();
    courseDetails.refresh();
  }


  Future<void> enrollInCourse({
    required String totalAmount,
    required String coursePrice,
    required String discountAmount,
    required int courseId,
    required String paymentMethod,
    String note = 'demo',
  }) async {
    var url = Uri.parse(Api.courseEnroll);

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${box.read("token")}',
    };

    var body = json.encode({
      "total_amount": int.parse(totalAmount),
      "course_price": int.parse(coursePrice),
      "discount_amount": int.parse(discountAmount),
      "course_id": courseId,
      "payment_method": paymentMethod,
      "note": note,
    });

    var request = http.Request('POST', url)
      ..headers.addAll(headers)
      ..body = body;

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200|| response.statusCode==201) {
        String responseBody = await response.stream.bytesToString();
        print('Success: $responseBody');
        Get.snackbar("Success", "Enroll Success");
        Get.to(() => QuickTechDashboard());
      }else if(response.statusCode == 409){
        Get.snackbar("Warning", "Already Enroll In this Course");
      }
      else {
        String errorResponse = await response.stream.bytesToString();
        print('Failed: ${response.statusCode} - ${response.reasonPhrase}');
        print('Error response: $errorResponse');
      }
    } catch (e) {
      print('Error during request: $e');
    }
  }



}