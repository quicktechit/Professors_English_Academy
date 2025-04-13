import 'package:professors_english_academy/consts/consts.dart';

Widget customInstructorDetails(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.asset(
        "assets/images/bussiness-man.png",
        width: 75,
      ).box.roundedFull.clip(Clip.antiAlias).make(),
      Column(
        children: [
          "Demo Instructor".text.semiBold.black.make(),
          "Admin & CEO"
              .text
              .semiBold
              .white
              .make()
              .box
              .padding(EdgeInsets.symmetric(horizontal: 5, vertical: 2))
              .color(mainColor)
              .roundedSM
              .make(),
          5.heightBox,
          "Professors English Academy".text.black.overflow(TextOverflow.ellipsis).make()
        ],
      )
    ],
  ).box.width(context.screenWidth / 1.3).gray100.roundedSM.clip(Clip.antiAlias).p4.shadowSm.margin(EdgeInsets.symmetric(horizontal: 7,vertical: 2)).make();
}
