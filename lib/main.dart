import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/pages/splash_page/quick_tech_splash_page_one.dart';

import 'firebase_options.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(LoaderController());
  Get.put(LoaderService());
  await PushNotificationService().initialize();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    final ThemeController themeController = Get.put(ThemeController());
    return Obx(
      ()=> GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 400),
        theme: themeController.currentTheme,
        home: QuickTechSplashPageOne(),
      ),
    );
  }
}
