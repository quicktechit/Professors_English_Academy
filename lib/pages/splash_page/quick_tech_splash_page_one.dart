import 'dart:async';

import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/pages/splash_page/quick_tech_splash_page_2nd.dart';

class QuickTechSplashPageOne extends StatefulWidget {
  const QuickTechSplashPageOne({super.key});

  @override
  State<QuickTechSplashPageOne> createState() => _QuickTechSplashPageOneState();
}

class _QuickTechSplashPageOneState extends State<QuickTechSplashPageOne> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() {
    Timer(const Duration(seconds: 3), () {
      Get.offAll(()=>const QuickTechSplashPage2nd(),transition: Transition.fadeIn,duration: 500.ms);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/logo.png",width: 240,).centered()
        ],
      ),
    );
  }
}
