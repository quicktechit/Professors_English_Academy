import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/model/privicyterms_model.dart';
import 'package:professors_english_academy/model/profile_model.dart';
import 'package:professors_english_academy/pages/auth_page/quick_tech_phone_number_input.dart';

import '../model/quiz_result_model.dart';

class ProfileController extends GetxController {
  var profile = ProfileModel().obs;
  var privacyTerms = PrivacyTermsModel().obs;
  final box = GetStorage();
  final ImagePicker _picker = ImagePicker();
  var profileImageUrl = ''.obs;
  var quizResultModel = QuizResultModel().obs;
  var isLoading = true.obs;
  var name = TextEditingController();
  var email = TextEditingController();
  var institution = TextEditingController();
  var phone = TextEditingController();

  Future<void> getProfile() async {
    final url = Uri.parse(Api.getProfile);
    if (box.read("token").toString() != "null") {
      // LoaderService.to.showLoader();
      try {


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
          phone.text = profile.value.user!.phone ?? "";
          name.text = profile.value.user!.name ?? "";
          email.text = profile.value.user!.email ?? '';
          institution.text = profile.value.user!.institution ?? '';
          profileImageUrl.value=profile.value.user?.image;
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

  Future<void> getMyQuiz() async {
    try {
      LoaderService.to.showLoader();

      final headers = {
        'Authorization': 'Bearer ${box.read("token")}',
      };

      final response = await http.get(
        Uri.parse(Api.myQuiz),
        headers: headers,
      );
      if (response.statusCode == 200) {
        LoaderService.to.hideLoader();
        quizResultModel.value =
            QuizResultModel.fromJson(json.decode(response.body));
      } else {
        LoaderService.to.hideLoader();
        throw Exception('Failed to load quiz data');
      }
    } catch (e) {
      LoaderService.to.hideLoader();
      print('Error: $e');
    } finally {
      isLoading.value = false;
      LoaderService.to.hideLoader();
    }
  }

  Future<void> updateProfile() async {
    final uri = Uri.parse(Api.profileUpdate);

    var request = http.MultipartRequest('POST', uri)
      ..fields.addAll({
        'name': name.text,
        // 'phone': phone.text,
        // 'email': email.text,
        'institution': institution.text,
      })
      ..headers.addAll({
        'Authorization': 'Bearer ${box.read("token")}',
        'Accept': 'application/json',
      });

    try {
      final response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        Get.snackbar("Success", "Profile Update Success");
        print('Success: $responseBody');
        await getProfile();
      } else {
        print('Error ${response.statusCode}: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Exception occurred: $e');
    }
  }

  Future<void> pickAndUploadImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File image = File(pickedFile.path);
      await updateProfileImage(imageFile: image);
    } else {
      Get.snackbar("Cancelled", "No image selected");
    }
  }

  Future<void> updateProfileImage({required File imageFile}) async {
    final uri = Uri.parse(Api.profileUpdate);

    var request = http.MultipartRequest('POST', uri)
      ..headers.addAll({
        'Authorization': 'Bearer ${box.read("token")}',
      })
      ..files.add(await http.MultipartFile.fromPath('image', imageFile.path));

    try {
      final response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        Get.snackbar("Success", "Profile Image Updated");
        print('Image Upload Response: $responseBody');
        // Update image URL if needed
        // profileImageUrl.value = newImageUrlFromResponse;
        await getProfile();
      } else {
        Get.snackbar("Error", "Image upload failed: ${response.statusCode}");
        log("${response.statusCode}");

      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
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

  logOut() async {
    box.erase();
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => QuickTechPhoneNumberInput());
  }
}
