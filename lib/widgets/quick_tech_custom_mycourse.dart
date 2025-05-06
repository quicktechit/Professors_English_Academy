import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/widgets/quick_tech_custom_button.dart';
import 'package:professors_english_academy/widgets/quick_tech_custom_reating_submit.dart';

Widget myCourse({required BuildContext context}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.asset(
        "assets/images/1-6-02.png",
        width: 110,
      ),
      10.widthBox,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          "Demo Course Title".text.semiBold.xl.make().w(180),
          5.heightBox,
          "10% complete".text.semiBold.make(),
          10.heightBox,
          Row(
            children: [
              customButton(
                      title: "Start",
                      onPressed: () {},
                      color: mainColor,
                      txtColor: white)
                  .box
                  .size(80, 35)
                  .make(),
              5.widthBox,
              customButton(
                      title: "Rate this Course",
                      onPressed: () {

                        Get.bottomSheet(

                            customRatingSubmitBottomShit());
                      },
                      color: orange,
                      txtColor: white)
                  .box
                  .size(120, 35)
                  .make(),
            ],
          ),
          10.heightBox,
        ],
      )
    ],
  ).card.make();
}
