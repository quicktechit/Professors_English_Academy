import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/model/privicyterms_model.dart';
import 'package:professors_english_academy/model/profile_model.dart';
import 'package:professors_english_academy/pages/auth_page/quick_tech_phone_number_input.dart';

class ProfileController extends GetxController {
  var profile = ProfileModel().obs;
  var privacyTerms = PrivacyTermsModel().obs;
  final box = GetStorage();

  Future<void> getProfile() async {
    final url = Uri.parse(Api.getProfile);
    if (box.read("token").toString() != "null") {

      try {
        LoaderService.to.showLoader();

        final response = await http.get(
          url,
          headers: {
            'Authorization': 'Bearer ${box.read("token")}',
            'Content-Type': 'application/json',
          },
        );

        if (response.statusCode == 200) {
          LoaderService.to.hideLoader();
          final data = json.decode(response.body);
          profile.value = ProfileModel.fromJson(data);
          log('Profile Data fetched successfully: $data');
        } else {
          LoaderService.to.hideLoader();
          log('Failed to load Profile data. Status code: ${response.statusCode}');
        }
      } catch (e) {
        LoaderService.to.hideLoader();
        log('Error occurred Profile get : $e');
      }
    } else {
      VxToast.show(Get.context!, msg: "Token Is Empty");
    }
  }

  Future<void> getTermsPrivacy() async {
    final url = Uri.parse(Api.privacyTerms);
      try {
        LoaderService.to.showLoader();

        final response = await http.get(url);

        if (response.statusCode == 200) {
          LoaderService.to.hideLoader();
          final data = json.decode(response.body);
          privacyTerms.value = PrivacyTermsModel.fromJson(data);
          log('Profile Data fetched successfully: $data');
        } else {
          LoaderService.to.hideLoader();
          log('Failed to load Profile data. Status code: ${response.statusCode}');
        }
        privacyTerms.refresh();
      } catch (e) {
        LoaderService.to.hideLoader();
        log('Error occurred Profile get : $e');
      }

  }

  logOut() {
    box.erase();
    Get.offAll(() => QuickTechPhoneNumberInput());
  }
}
