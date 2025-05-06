import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:professors_english_academy/consts/consts.dart';
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

        Get.offAll(
            () => QuickTechCompleteRegister(phone: user.phoneNumber ?? ''));
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
      print('Login successful');
      print('Response: ${response.body}');
      var data=jsonDecode(response.body);
      box.write("token", data["token"].toString());
      log(box.read("token"));
      Get.offAll(() => QuickTechDashboard());
    } else {
      LoaderService.to.hideLoader();
      print('Login failed with status: ${response.statusCode}');
      print('Error: ${response.body}');
      Get.snackbar("Error", response.body);
    }
  }
}
