import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart'as http;
import 'package:professors_english_academy/model/subcategory_model.dart';
import '../consts/consts.dart';

class SubCategoryController extends GetxController{
  var subCategory=SubCategoryModel().obs;
  Future<void> fetchSubCategory(String id) async {
    final url = Uri.parse("${Api.subcategory}$id");
    log(url.toString());
    LoaderService.to.showLoader();
    subCategory.value=SubCategoryModel();
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        LoaderService.to.hideLoader();
        final data = json.decode(response.body);
        subCategory.value = SubCategoryModel.fromJson(data);

        log('Data fetched successfully: ');
      } else {
        LoaderService.to.hideLoader();
        log('Failed to load data. Status code: ${response.statusCode}');
      }
      subCategory.refresh();
    } catch (e) {
      LoaderService.to.hideLoader();
      log('Error occurred: $e');
    }finally {
      LoaderService.to.hideLoader(); // <- Always hide
    }
  }
}