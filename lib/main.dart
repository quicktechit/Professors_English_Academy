import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/pages/home/quick_tech_dashboard.dart';
import 'package:professors_english_academy/pages/splash_page/quick_tech_splash_page_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 400),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(size: 30, color: Colors.white),
            backgroundColor: mainColor),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: QuickTechSplashPageOne(),
    );
  }
}
