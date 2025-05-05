import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart'as http;
import 'package:professors_english_academy/pages/auth_page/quick_tech_complete_register.dart';
import '../consts/consts.dart';


class OtpController extends GetxController {

  final phone=TextEditingController();
var otps;
  var otp = ['','','','','',''].obs;  var remainingTime = 60.obs; // Time remaining in seconds
  Timer? _timer;
  @override
  void onInit() {
    super.onInit();
    startTimer(); // Start the timer when the controller is initialized
  }

  @override
  void onClose() {
    super.onClose();
    stopTimer(); // Stop the timer when the controller is disposed
  }


  void updateOtp(int index, String value) {
    otp[index] = value;
  }

  void verifyOtp() {
    String enteredOtp = otp.join();
    print("Entered OTP: $enteredOtp");
    if (enteredOtp == otps.toString()) {
      Get.to(QuickTechCompleteRegister(phone: phone.text,));
    } else {
     Get.snackbar("Error", "OTP Did not match");
    }
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        stopTimer(); // Stop the timer when it reaches 0
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }



  Future<void> sendOtp() async {

    final baseUrl = Api.otp;
    final uri = Uri.parse(baseUrl).replace(queryParameters: {
      'phone': phone.text,
    });
log(uri.toString());
    try {
      final response = await http.get(uri);
      final data = json.decode(response.body);
       otps = data['otp'];
       log(otps.toString());
      if (response.statusCode == 200) {
        print('Response: ${response.body}');
        Get.snackbar("Otp is", otps.toString(),duration: 30.seconds);
      } else {
        print('Failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }



}
