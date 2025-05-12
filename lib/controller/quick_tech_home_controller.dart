import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:professors_english_academy/consts/consts.dart';

import 'package:professors_english_academy/model/slider_model.dart';
import 'package:professors_english_academy/model/trending_model.dart';

import '../model/category_model.dart';
import '../model/pactrice_category_model.dart';

class HomeController extends GetxController{
  var practice=PracticeCategoryModel().obs;
  var category=CategoryModel().obs;
  var slider=SliderModel().obs;
  var trending=TrendingModel().obs;

  Future<void> fetchPracticeCategory() async {
    final url = Uri.parse(Api.practiceCategory);
    // LoaderService.to.showLoader();
    // practice.value = PracticeCategoryModel();
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // LoaderService.to.hideLoader();
        final data = json.decode(response.body);
        practice.value=PracticeCategoryModel.fromJson(data);

        print('Data fetched successfully: ');
      } else {
        // LoaderService.to.hideLoader();
        print('Failed to load data. Status code: ${response.statusCode}');
      }
      practice.refresh();
    } catch (e) {
      // LoaderService.to.hideLoader();
      print('Error occurred: $e');
    }
  }

  Future<void> fetchCategory() async {
    final url = Uri.parse(Api.getCategory);
    // category.value = CategoryModel();
    // LoaderService.to.showLoader();
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // LoaderService.to.hideLoader();
        final data = json.decode(response.body);
        category.value=CategoryModel.fromJson(data);

        print('Data fetched successfully: $data');
      } else {
        // LoaderService.to.hideLoader();
        print('Failed to load data. Status code: ${response.statusCode}');
      }
      category.refresh();
    } catch (e) {
      // LoaderService.to.hideLoader();
      print('Error occurred: $e');
    }
  }

  Future<void> getSlider() async {
    final url = Uri.parse(Api.getSlider);
    // LoaderService.to.showLoader();
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // LoaderService.to.hideLoader();
        final data = json.decode(response.body);
        slider.value = SliderModel.fromJson(data);
        print('Data fetched successfully: ');
      } else {
        // LoaderService.to.hideLoader();
        print('Failed to load data. Status code: ${response.statusCode}');
      }
      slider.refresh();
    } catch (e) {
      // LoaderService.to.hideLoader();
      print('Error occurred: $e');
    }
  }

  Future<void> getTrendingCourse() async {
    final url = Uri.parse(Api.trendingCourse);
    // LoaderService.to.showLoader();
    // trending.value=TrendingModel();
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // LoaderService.to.hideLoader();
        final data = json.decode(response.body);
        trending.value = TrendingModel.fromJson(data);
        print('Data fetched successfully: ');
      } else {
        // LoaderService.to.hideLoader();
        print('Failed to load data. Status code: ${response.statusCode}');
      }
      trending.refresh();
    } catch (e) {
      // LoaderService.to.hideLoader();
      print('Error occurred: $e');
    }
  }
}