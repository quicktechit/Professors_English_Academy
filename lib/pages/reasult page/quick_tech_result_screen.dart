import 'package:professors_english_academy/widgets/quick_tech_custom_button.dart';
import '../../consts/consts.dart';

class QuickTechResultScreen extends StatefulWidget {
  const QuickTechResultScreen({super.key});

  @override
  State<QuickTechResultScreen> createState() => _QuickTechResultScreenState();
}

class _QuickTechResultScreenState extends State<QuickTechResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            "assets/icons/congratulaton.json",
            width: 200,
            repeat: false,
          ),
          CircleAvatar(
            backgroundColor: mainColor,
            radius: 75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                "Your Score"
                    .text
                    .white
                    .textStyle(GoogleFonts.kufam())
                    .size(22)
                    .make(),
                "25/30"
                    .text
                    .white
                    .textStyle(GoogleFonts.kufam())
                    .size(22)
                    .make(),
              ],
            ),
          )
              .box
              .color(mainColor.withOpacity(0.5))
              .p12
              .roundedFull
              .makeCentered(),
          10.heightBox,
          "Congratulation"
              .text
              .color(mainColor)
              .textStyle(GoogleFonts.kufam())
              .size(22)
              .make(),
          "Great job, Rasheeq Ishmum! You Did It"
              .text
              .color(gry)
              .textStyle(GoogleFonts.kufam())
              .size(18)
              .make(),
          20.heightBox,
          customButton(
                  title: 'Share',
                  onPressed: () {},
                  color: mainColor,
                  txtColor: white)
              .box
              .width(context.screenWidth / 1.2)
              .make(),
          15.heightBox,
          customButton(
                  title: 'Return',
                  onPressed: () {
                    Get.back();
                    Get.back();
                  },
                  color: mainColor,
                  txtColor: white)
              .box
              .size(context.screenWidth / 1.2, 40)
              .make()
        ],
      )),
    );
  }
}
