import 'package:professors_english_academy/consts/consts.dart';

Widget customAppbar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        Image.asset(
          "assets/images/man.png",
          width: 40,
          fit: BoxFit.cover,
        )
            .box
            .roundedFull
            .clip(Clip.antiAlias)
            .border(color: Colors.black, width: 1.4)
            .make(),
        20.widthBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Nasir Khan".text.semiBold.xl2.make(),
            "01641634899".text.semiBold.sm.make()
          ],
        ),
      ],
    ),
    actions: [
      Icon(
        Icons.notifications_active_outlined,
        color: mainColor,
        size: 30,
      ),
      5.widthBox,
    ],
  );
}
