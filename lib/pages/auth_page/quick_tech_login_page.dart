import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/pages/home/quick_tech_dashboard.dart';

import '../../widgets/quick_tech_custom_button.dart';
import '../../widgets/quicktech_custom_text_field.dart';

class QuickTechLoginPage extends StatefulWidget {
  const QuickTechLoginPage({super.key});

  @override
  State<QuickTechLoginPage> createState() => _QuickTechLoginPageState();
}

class _QuickTechLoginPageState extends State<QuickTechLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,),
      body: Column(crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/tevlogin.jpg',height: 300,).centered().animate().fadeIn(delay: 100.ms),
          "Login".text.semiBold.xl2.make().animate().fadeIn(delay: 110.ms),
          20.heightBox,
          "Phone Number".text.semiBold.make().animate().fadeIn(delay: 100.ms),
          5.heightBox,
          customTextField(
              hint: "number",
              isSuffix: false,
              isVisible: true,
              icon: Icons.phone).animate().fadeIn(delay: 100.ms),
          15.heightBox,
          "Password".text.semiBold.make().animate().fadeIn(delay: 120.ms),
          5.heightBox,
          customTextField(
              hint: "Password",
              isSuffix: false,
              isVisible: false,
              icon: Icons.key).animate().fadeIn(delay: 120.ms),
          30.heightBox,
          customButton(
              title: "Login",
              onPressed: () {
                Get.to(()=>QuickTechDashboard());
              },
              color: mainColor,
              txtColor: white)
              .w(context.screenWidth).animate().fadeIn(delay: 130.ms)
        ],
      ).pSymmetric(h: dynamicSize),
    );
  }
}
