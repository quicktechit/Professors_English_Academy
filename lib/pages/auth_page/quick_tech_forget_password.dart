import 'package:professors_english_academy/widgets/quick_tech_custom_button.dart';
import 'package:professors_english_academy/widgets/quicktech_custom_text_field.dart';

import '../../consts/consts.dart';
import '../../controller/quick_tech_auth_controller.dart';

class ForgetPasswordScreen extends StatefulWidget {
  final String phone;
  const ForgetPasswordScreen({super.key, required this.phone});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  var isVisible = false;
  final AuthController registerController=Get.find();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: [
          Lottie.asset("assets/icons/forgetPassword.json",height: context.screenHeight/3),
          30.heightBox,
          "Change Password".text.semiBold.lg.make(),
          20.heightBox,
          customTextField(
              controller: registerController.password,
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
          10.heightBox,
          customTextField(
              controller: registerController.confirmPassword,
              hint: "Confirm Password",
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
          20.heightBox,
          customButton(title: "Update", onPressed: (){
registerController.resetPassword(phone: widget.phone.toString());
          }, color: mainColor,txtColor: white)
        ],
      ),
    );
  }
}
