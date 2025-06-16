import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/controller/quick_tech_auth_controller.dart';
import 'package:professors_english_academy/pages/auth_page/quick_tech_forget_password.dart';
import 'package:professors_english_academy/pages/auth_page/quick_tech_input_phone_number.dart';

import '../../widgets/quick_tech_custom_button.dart';
import '../../widgets/quicktech_custom_text_field.dart';

class QuickTechLoginPage extends StatefulWidget {
  const QuickTechLoginPage({super.key});

  @override
  State<QuickTechLoginPage> createState() => _QuickTechLoginPageState();
}

class _QuickTechLoginPageState extends State<QuickTechLoginPage> {
  var isVisible = false;
  final AuthController registerController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/tevlogin.jpg',height: 300,).centered().animate().fadeIn(delay: 100.ms),
            "Login".text.semiBold.xl2.make().animate().fadeIn(delay: 110.ms),
            20.heightBox,
            "Phone Number".text.semiBold.make().animate().fadeIn(delay: 100.ms),
            5.heightBox,
            customTextField(
              controller: registerController.phone,
                keyboard: TextInputType.number,
                hint: "Number",
                isSuffix: false,
                isVisible: true,
                icon: Icons.phone).animate().fadeIn(delay: 100.ms),
            15.heightBox,
            "Password".text.semiBold.make().animate().fadeIn(delay: 120.ms),
            5.heightBox,
            customTextField(controller: registerController.password,
                hint: "Password",
                    isSuffix: true,
                    suIcon: isVisible == false
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    suppixtap: () {
                      setState(() {});
                      isVisible = !isVisible;
                    },
                    isVisible: isVisible,
                icon: Icons.key).animate().fadeIn(delay: 120.ms),
            30.heightBox,
            customButton(
                title: "Login",
                onPressed: () {
                  registerController.login();
                },
                color: mainColor,
                txtColor: white)
                .w(context.screenWidth).animate().fadeIn(delay: 130.ms),
            10.heightBox,
            customButton(
                title: "Forget Password",
                onPressed: () {
                 Get.to(()=>QuickTechInputPhoneNumber());
                },
                color: secondColor,
                txtColor: white)
                .w(context.screenWidth).animate().fadeIn(delay: 130.ms)
          ],
        ).pSymmetric(h: dynamicSize),
      ),
    );
  }
}
