import 'dart:convert';
import 'package:professors_english_academy/consts/consts.dart';
import 'package:http/http.dart'as http;
import '../model/pactrice_category_model.dart';

class HomeController extends GetxController{
  var practice=PracticeCategoryModel().obs;

  Future<void> fetchPracticeCategory() async {
    final url = Uri.parse(Api.practiceCategory);
    LoaderService.to.showLoader();
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        LoaderService.to.hideLoader();
        final data = json.decode(response.body);
        practice.value=PracticeCategoryModel.fromJson(data);
        print('Data fetched successfully: ');
      } else {
        LoaderService.to.hideLoader();
        print('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      LoaderService.to.hideLoader();
      print('Error occurred: $e');
    }
  }
}