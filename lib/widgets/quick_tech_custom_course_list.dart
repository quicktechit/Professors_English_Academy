import 'package:flutter/cupertino.dart';
import 'package:professors_english_academy/consts/consts.dart';

Widget customCourseList(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.asset("assets/images/banner2.jpg", fit: BoxFit.cover, height: 155),
      3.heightBox,
      "Demo Course TitleDemo Course Title"
          .text
          .lineHeight(1.2)
          .semiBold
          .maxLines(2)
          .overflow(TextOverflow.ellipsis)
          .xl
          .make()
          .pSymmetric(h: 10),
      Spacer(),
      Row(
        children: [

          "Class ".text.semiBold.lg.gray400.make(),
          "50".text.semiBold.lg.color(mainColor).make(),
          Spacer(),

          "Student ".text.semiBold.lg.gray400.make(),
          "50".text.semiBold.lg.color(mainColor).make(),
        ],
      ).pSymmetric(h: 10),
      3.heightBox,
      Row(
        children: [

          "Nots ".text.semiBold.lg.gray400.make(),
          "50".text.semiBold.lg.color(mainColor).make(),
          Spacer(),

          "Exams ".text.semiBold.lg.gray400.make(),
          "50".text.semiBold.lg.color(mainColor).make(),
        ],
      ).pSymmetric(h: 10),
      2.heightBox,
      Row(
        children: [
          Icon(
            CupertinoIcons.star,
            color: Colors.orange,
            size: 17,
          ),
          5.widthBox,
          "4.5 (10)".text.semiBold.color(mainColor).xl.make(),
          Spacer(),
          "৳ 100".text.semiBold.color(mainColor).xl.make()
        ],
      ).pSymmetric(h: 10),
      3.heightBox,
    ],
  ).card.color(Colors.white).elevation(5).make().w(235);
}

Widget customCourseListHori(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.asset("assets/images/banner2.jpg", fit: BoxFit.cover,).w(context.screenWidth).h(150),
      3.heightBox,
      "Demo Course TitleDemo Course Title"
          .text
          .lineHeight(1.2)
          .semiBold
          .maxLines(2)
          .overflow(TextOverflow.ellipsis)
          .xl
          .make()
          .pSymmetric(h: 10),
      Spacer(),
      Row(
        children: [

          "Class ".text.semiBold.lg.make(),
          "50".text.semiBold.lg.color(mainColor).make(),
          Spacer(),

          "Student ".text.semiBold.lg.make(),
          "50".text.semiBold.lg.color(mainColor).make(),
        ],
      ).pSymmetric(h: 10),
      3.heightBox,
      Row(
        children: [

          "Nots ".text.semiBold.lg.make(),
          "50".text.semiBold.lg.color(mainColor).make(),
          Spacer(),

          "Exams ".text.semiBold.lg.make(),
          "50".text.semiBold.lg.color(mainColor).make(),
        ],
      ).pSymmetric(h: 10),
      2.heightBox,
      Row(
        children: [
          Icon(
            CupertinoIcons.star,
            color: mainColor,
            size: 16,
          ),
          5.widthBox,
          "4.5 (10)".text.semiBold.color(mainColor).xl.make(),
          Spacer(),
          "৳ 100".text.semiBold.color(mainColor).xl.make()
        ],
      ).pSymmetric(h: 10),
      3.heightBox,
    ],
  ).card.color(Colors.white).elevation(5).make().h(280);
}
