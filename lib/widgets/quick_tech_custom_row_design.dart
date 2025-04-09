import 'package:professors_english_academy/consts/consts.dart';

Widget customRow(BuildContext context, String title, String subtitle,) {
  return Row(
    children: [
      title.tr.text.make().w(context.screenWidth / 2.4),
      subtitle.text.make().w(context.screenWidth / 2.4),
    ],
  ).box.p8.border(color: tndora.withOpacity(0.5)).make();
}

Widget customDriverDetails(BuildContext context, String title, String value,color) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      title.tr.text.xl.semiBold.overflow(TextOverflow.fade).maxLines(1).make(),
      value.text.lg.semiBold.make()
    ],
  ).box.p8.shadowSm.size(context.screenWidth / 3.5,65).roundedSM.color(color).make();
}
