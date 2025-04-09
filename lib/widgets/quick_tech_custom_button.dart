import 'package:professors_english_academy/consts/consts.dart';
Widget customButton(
    {required String title, required onPressed, required color, txtColor}) {
  return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: color,
      ),
      child: title.tr.text.color(txtColor ?? gryBlack).size(16).make()).box.color(color).shadowSm.rounded.make();
}

Widget customButtonWithIcon(
    {required String title, onPressed, required icons, backgroundColor,txtColor}) {
  return TextButton.icon(
    onPressed: onPressed,
    style: TextButton.styleFrom(
      backgroundColor: backgroundColor,
    ),
    icon: Image.asset(
      icons,
      width: 30,color: Colors.white,
    ),
    label: title.text.color(txtColor ?? gryBlack).size(16).make(),
  ).box.color(backgroundColor).shadowSm.rounded.make();
}
