import 'package:professors_english_academy/consts/consts.dart';

Widget customCard(BuildContext context,int index) {
  return Container(
    alignment: Alignment.bottomLeft,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        image: DecorationImage(
            image: AssetImage(imageList[index]), fit: BoxFit.fill)),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.edit,
          color: Colors.black,
          size: 15,
        ),
        5.widthBox,
        "20".text.sm.black.make()
      ],
    )
        .box
        .padding(EdgeInsets.symmetric(horizontal: 7, vertical: 5))
        .white
        .roundedSM
        .shadowSm
        .margin(EdgeInsets.all(6))
        .make(),
  );
}
