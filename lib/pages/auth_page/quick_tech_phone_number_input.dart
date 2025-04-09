import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/pages/auth_page/quick_tech_login_page.dart';
import 'package:professors_english_academy/pages/auth_page/quick_tech_otp_page.dart';
import 'package:professors_english_academy/widgets/quick_tech_custom_button.dart';
import 'package:professors_english_academy/widgets/quicktech_custom_text_field.dart';

class QuickTechPhoneNumberInput extends StatefulWidget {
  const QuickTechPhoneNumberInput({super.key});

  @override
  State<QuickTechPhoneNumberInput> createState() =>
      _QuickTechPhoneNumberInputState();
}

class _QuickTechPhoneNumberInputState extends State<QuickTechPhoneNumberInput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/hostlogin.png").animate().fadeIn(delay: 80.ms),
              "Account Setup".text.xl3.make().animate().fadeIn(delay: 80.ms),
              20.heightBox,
              "Phone Number"
                  .text
                  .semiBold
                  .sm
                  .make()
                  .animate()
                  .fadeIn(delay: 80.ms),
              5.heightBox,
              customTextField(
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
                        Get.to(QuickTechOtpPage(number: "01641634899"));
                      },
                      color: mainColor,
                      txtColor: white)
                  .animate()
                  .fadeIn(delay: 150.ms)
                  .w(context.screenWidth),
              10.heightBox,
              customButtonWithIcon(
                      title: 'Start With Google',
                      txtColor: Colors.white,
                      onPressed: () {
                        Get.to(()=>QuickTechLoginPage());
                      },
                      backgroundColor: secondColor,
                      icons: "assets/images/google.png")
                  .w(context.screenWidth)
                  .animate()
                  .fadeIn(delay: 200.ms)
            ],
          ).pSymmetric(h: dynamicSize),
        ),
      ),
    );
  }
}
