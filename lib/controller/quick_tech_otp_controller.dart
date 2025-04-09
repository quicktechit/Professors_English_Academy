import 'dart:async';
import '../consts/consts.dart';


class OtpController extends GetxController {
  // Create a list to store the OTP digits.
  var otp = ['','','','','',''].obs;  var remainingTime = 60.obs; // Time remaining in seconds
  Timer? _timer;

  // Function to update OTP value when user enters a digit.
  void updateOtp(int index, String value) {
    otp[index] = value;
  }

  // Function to verify OTP (dummy function).
  void verifyOtp() {
    String enteredOtp = otp.join();
    print("Entered OTP: $enteredOtp");
    if (enteredOtp == "123456") {
      print("OTP Verified!");
    } else {
      print("Invalid OTP");
    }
  }
  // Function to start the timer
  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        stopTimer(); // Stop the timer when it reaches 0
      }
    });
  }

  // Function to stop the timer
  void stopTimer() {
    _timer?.cancel();
  }

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
}
