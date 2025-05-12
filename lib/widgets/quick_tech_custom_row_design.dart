import 'package:professors_english_academy/consts/consts.dart';

Widget customRow(BuildContext context, String title, String subtitle,onTap) {
  return Row(
    children: [
      title.tr.text.xl2.semiBold.white.make(),
      Spacer(),
      subtitle.text.semiBold.xl.color(mainColor).make().onTap(onTap)
    ],
  );
}


