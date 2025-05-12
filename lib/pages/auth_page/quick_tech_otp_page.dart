
import '../../consts/consts.dart';
import '../../controller/quick_tech_otp_controller.dart';
import '../../widgets/quick_tech_custom_button.dart';

class QuickTechOtpPage extends StatefulWidget {
  final String number;

  const QuickTechOtpPage({
    super.key,
    required this.number,
  });

  @override
  State<QuickTechOtpPage> createState() => _QuickTechOtpPageState();
}

class _QuickTechOtpPageState extends State<QuickTechOtpPage> {
  final OtpController otpController = Get.put(OtpController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: dynamicSize),
        height: context.screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.white,
              Colors.blue.shade50,
              Colors.purple.shade100,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Obx(() {
            int minutes = otpController.remainingTime.value ~/ 60;
            int seconds = otpController.remainingTime.value % 60;
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // OTP Input Fields
                  Image.asset(
                    "assets/images/otp.png",
                  ).animate().fade(delay: 80.ms),
                  20.heightBox,
                  "Submit Your Otp To Verify The Phone Number"
                      .tr
                      .text
                      .align(TextAlign.center)
                      .semiBold
                      .xl
                      .make()
                      .animate()
                      .fade(delay: 120.ms),
                  10.heightBox,
                  'We Will Send A 6 Digit Verification Code To Your Phone Number'
                      .tr
                      .text
                      .align(TextAlign.center)
                      .semiBold
                      .sm
                      .black
                      .make()
                      .animate()
                      .fade(delay: 160.ms),
                  widget.number.text.semiBold.black.make(),
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(6, (index) {
                      return SizedBox(
                        width: 50,
                        child: TextField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              otpController.updateOtp(
                                  index, value); // Update OTP value
                              if (index < 5) {
                                FocusScope.of(context).nextFocus();
                              }
                            } else if (value.isEmpty) {
                              otpController.updateOtp(
                                  index, ''); // Clear the OTP value
                            }
                          },
                          maxLength: 1,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: "*",
                            counterText: '',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                              borderSide: const BorderSide(
                                  color: Colors
                                      .black), // Border color when not focused
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                                borderSide:
                                    const BorderSide(color: mainColor, width: 2)),
                            isDense: true,
                          ),
                        ),
                      ).animate().fade(delay: (index * 80).ms);
                    }),
                  ),
                  20.heightBox,
              
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      'Time remaining: '.text.make(),
                      "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}"
                          .text
                          .color(mainColor)
                          .semiBold
                          .make()
                    ],
                  ).animate().fade(delay: 200.ms),
              
                  30.heightBox,
                  customButton(
                          onPressed: () {
                            otpController.verifyOtp();
                          },
                          title: 'Submit OTP',
                          color: mainColor,
                          txtColor: white).animate().fade(delay: 210.ms)
                      .w(context.screenWidth),
                  10.heightBox,
                  if (otpController.remainingTime.value == 00)
                    customButton(
                            onPressed: () {
                              otpController.verifyOtp();
                            },
                            title: 'Resend OTP',
                            color: white,
                            txtColor: secondColor)
                        .box
                        .border(color: mainColor).rounded.clip(Clip.antiAlias)
                        .width(context.screenWidth)
                        .make().animate().fadeIn()
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
