import 'dart:async';
import 'dart:developer';

import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/pages/home/quick_tech_dashboard.dart';
import 'package:professors_english_academy/pages/splash_page/quick_tech_splash_page_2nd.dart';

import '../../controller/quick_tech_home_controller.dart';

class QuickTechSplashPageOne extends StatefulWidget {
  const QuickTechSplashPageOne({super.key});

  @override
  State<QuickTechSplashPageOne> createState() => _QuickTechSplashPageOneState();
}

class _QuickTechSplashPageOneState extends State<QuickTechSplashPageOne> {
  final box = GetStorage();

  final HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();

    _navigateToHome();
  }

  _navigateToHome() {
    Timer(const Duration(seconds: 3), () async {
      await homeController.fetchPracticeCategory();
      await homeController.getSlider();
      await homeController.getTrendingCourse();
      await homeController.fetchCategory();
      if (box.read("token").toString() != 'null') {
        log(box.read("token").toString());
        Get.offAll(() => QuickTechDashboard());
      } else {
        Get.offAll(() => const QuickTechSplashPage2nd(),
            transition: Transition.fadeIn, duration: 500.ms);
      }
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
