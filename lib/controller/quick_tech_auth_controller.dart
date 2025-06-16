import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/controller/quick_tech_profile_controller.dart';
import 'package:professors_english_academy/pages/auth_page/quick_tech_complete_register.dart';
import 'package:professors_english_academy/pages/auth_page/quick_tech_login_page.dart';
import 'package:professors_english_academy/pages/home/quick_tech_dashboard.dart';

class AuthController extends GetxController {
  var name = TextEditingController();
  var phone = TextEditingController();
  var college = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();
  final box = GetStorage();

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final user = userCredential.user;
      if (user != null) {
        name.text = user.displayName ?? '';
        email.text = user.email ?? '';
        phone.text = user.phoneNumber ?? '';
        await googleLogin();
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
      log(e.toString(), name: "Error");
    }
  }

  Future<void> createUser() async {
    String? errorMessage;

    if (name.text.isEmpty) {
      errorMessage = 'Please enter your name';
    } else if (phone.text.isEmpty) {
      errorMessage = 'Please enter your phone number';
    } else if (college.text.isEmpty) {
      errorMessage = 'Please enter your college name';
    } else if (email.text.isEmpty) {
      errorMessage = 'Please enter your email';
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(email.text)) {
      errorMessage = 'Please enter a valid email address';
    } else if (password.text.isEmpty) {
      errorMessage = 'Please enter a password';
    } else if (password.text.length < 8) {
      errorMessage = 'Password must be at least 8 characters long';
    } else if (confirmPassword.text.isEmpty) {
      errorMessage = 'Please confirm your password';
    } else if (confirmPassword.text != password.text) {
      errorMessage = 'Passwords do not match';
    }
    if (errorMessage != null) {

      Get.snackbar(
        'Validation Error',
        errorMessage,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
      return;
    }
    LoaderService.to.showLoader();
    final url = Uri.parse(Api.register);

    Map<String, String> userData = {
      'name': name.text,
      'phone': phone.text,
      'email': email.text,
      'password': password.text,
      'password_confirmation': confirmPassword.text,
      'institution': college.text
      // 'batch': '2025',
      // 'course': 'Computer Science',
    };

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(userData),
      );
      log(userData.toString());
      if (response.statusCode == 200) {
        LoaderService.to.hideLoader();
        print('User created successfully: ${response.body}');
        Get.snackbar("Success", "Registration Success");
        Get.offAll(QuickTechLoginPage());
      } else if (response.statusCode == 422) {
        LoaderService.to.hideLoader();
        Get.snackbar("Warning", "User Already Exist");
      } else {
        LoaderService.to.hideLoader();
        print('Failed to create user: ${response.statusCode}');
        Get.snackbar("Error", "Error Creating Account");
      }
    } catch (e) {
      LoaderService.to.hideLoader();
      print('Error: $e');
    }
  }

  Future<void> login() async {

     if (phone.text.isEmpty) {
       Get.snackbar(
         'Validation Error',
         "Phone Number Required",
         snackPosition: SnackPosition.TOP,
         backgroundColor: Colors.red,
         colorText: Colors.white,
         duration: Duration(seconds: 3),
       );
    }
      if (password.text.isEmpty) {
        Get.snackbar(
          'Validation Error',
          "Password Required",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );
     }

    final url = Uri.parse(Api.login);
     LoaderService.to.showLoader();
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'phone': phone.text,
        'password': password.text,
      }),
    );

    if (response.statusCode == 200) {
      LoaderService.to.hideLoader();
      var data=jsonDecode(response.body);
      box.write("token", data["token"].toString());
      print('Login successful');
      print('Response: ${response.body}');
      Get.find<ProfileController>().getProfile();

      log(box.read("token"));
      Get.offAll(() => QuickTechDashboard());
    } else {
      LoaderService.to.hideLoader();
      print('Login failed with status: ${response.statusCode}');
      print('Error: ${response.body}');
      Get.snackbar("Error", response.body);
    }
  }

  Future<void> googleLogin() async {
    final url = Uri.parse(Api.googleLogin);

    final headers = {
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      'email': email.text,
    });

    try {
      LoaderService.to.showLoader();
      final request = http.Request('POST', url)
        ..headers.addAll(headers)
        ..body = body;

      final response = await request.send();

      if (response.statusCode == 200) {
        LoaderService.to.hideLoader();
        final responseBody = await response.stream.bytesToString();
        print('Success: $responseBody');
        final Map<String, dynamic> jsonResponse = jsonDecode(responseBody);

        final String? token = jsonResponse['token'];
        box.write("token", token.toString()).then((v) {
          Get.find<ProfileController>().getProfile();

          Get.offAll(() => QuickTechDashboard());
        });
      } else {
        LoaderService.to.hideLoader();
        print('Failed: ${response.reasonPhrase}');

        Get.offAll(() => QuickTechCompleteRegister(
              phone: phone.text,
            ));
      }
    } catch (e) {       LoaderService.to.hideLoader();
      print('Error: $e');
    }
  }

  Future<void> resetPassword({required phone}) async {
    final url = Uri.parse(Api.forgetPassword);
    final headers = {
      'Content-Type': 'application/json',
    };
    log(url.toString());
    final body = jsonEncode({
      'phone': phone,
      'password': password.text,
      'password_confirmation': confirmPassword.text,
    });
    log(body);
    LoaderService.to.showLoader();
    try {
      final response = await http.post(url, headers: headers, body: body);
      LoaderService.to.hideLoader();
      if (response.statusCode == 200) {
        print('Password reset successful: ${response.body}');
        Get.snackbar("Password Change Success", "");
        Get.offAll(()=>QuickTechLoginPage());
      } else {
        Get.snackbar("Something Went Wrong", "");
        print('Failed: ${response.statusCode} - ${response.reasonPhrase}');
        print('Details: ${response.body}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }
}
