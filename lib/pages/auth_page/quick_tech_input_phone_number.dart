import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/pages/auth_page/quick_tech_otp_page.dart';

import '../../controller/quick_tech_auth_controller.dart';
import '../../controller/quick_tech_otp_controller.dart';
import '../../widgets/quick_tech_custom_button.dart';
import '../../widgets/quicktech_custom_text_field.dart';

class QuickTechInputPhoneNumber extends StatefulWidget {
  const QuickTechInputPhoneNumber({super.key});

  @override
  State<QuickTechInputPhoneNumber> createState() => _QuickTechInputPhoneNumberState();
}

class _QuickTechInputPhoneNumberState extends State<QuickTechInputPhoneNumber> {
  final OtpController otpController=Get.put(OtpController());
  final AuthController registerController=Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/hostlogin.png").animate().fadeIn(delay: 80.ms),
            "Forget Password".text.xl3.make().animate().fadeIn(delay: 80.ms),
            20.heightBox,
            "Phone Number"
                .text
                .semiBold
                .sm
                .make()
                .animate()
                .fadeIn(delay: 80.ms),
            5.heightBox,
            customTextField(controller: otpController.phone,
                keyboard: TextInputType.phone,
                hint: "Phone Number",
                isSuffix: false,
                isVisible: true,
                icon: Icons.phone)
                .animate()
                .fadeIn(delay: 100.ms),
            17.heightBox,
            customButton(
                title: "Go Next",
                onPressed: () {
                  if(otpController.phone.text.isNotEmpty){
                    Get.to(QuickTechOtpPage(number: otpController.phone.text,isRegister: false,));
                    otpController.sendOtp();
                  }else{
                    Get.snackbar("Warning", "Phone number required");
                  }

                },
                color: mainColor,
                txtColor: white)
                .animate()
                .fadeIn(delay: 150.ms)
                .w(context.screenWidth),
            10.heightBox,
          ],
        ).pSymmetric(h: dynamicSize),
      ),
    );
  }
}
