import 'package:flutter/cupertino.dart';
import 'package:professors_english_academy/consts/consts.dart';

Widget customQuestionList(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      "Question title".text.semiBold.xl.make(),
      10.heightBox,
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            CupertinoIcons.timer,
            color: mainColor,
            size: 19,
          ),
          5.widthBox,
          "4 Hour".text.semiBold.make(),
          12.widthBox,
          "||".text.xl2.gray400.make(),
          12.widthBox,
          Icon(
            CupertinoIcons.t_bubble,
            color: secondColor,
            size: 19,
          ),
          5.widthBox,
          "4 Question".text.semiBold.make(),
        ],
      )
    ],
  )
      .box
      .padding(EdgeInsets.symmetric(horizontal: 13, vertical: 9))
      .shadowSm
      .rounded
      .white
      .margin(EdgeInsets.only(bottom: 10))
      .make();
}
