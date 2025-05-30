import 'package:professors_english_academy/widgets/quick_tech_custom_button.dart';
import '../../consts/consts.dart';
import '../../controller/quick_tech_practice_controller.dart';

class QuickTechResultScreen extends StatefulWidget {
  const QuickTechResultScreen({super.key});

  @override
  State<QuickTechResultScreen> createState() => _QuickTechResultScreenState();
}

class _QuickTechResultScreenState extends State<QuickTechResultScreen> {
  final PracticeController practiceController=Get.find();
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
                "${practiceController.lastResult.value?.formattedScore}"
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
          "Your Quiz Submit Success"
              .text
              .color(mainColor).semiBold
              .textStyle(GoogleFonts.kufam())
              .size(22)
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
