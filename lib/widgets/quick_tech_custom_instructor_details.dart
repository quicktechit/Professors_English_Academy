import 'package:professors_english_academy/consts/consts.dart';

Widget customInstructorDetails(
    BuildContext context, image, prof, institution, name) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Image.network(
        "${Api.imageUrl}$image",
        width: 75,
      ).box.roundedFull.clip(Clip.antiAlias).make(),
      Column(
        children: [
          "$name".text.semiBold.black.make(),
          "$prof"
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
          "$institution".text.black.overflow(TextOverflow.ellipsis).make()
        ],
      )
    ],
  )
      .box
      .width(context.screenWidth)
      .gray100
      .roundedSM
      .clip(Clip.antiAlias)

      .shadowSm
      .margin(EdgeInsets.symmetric(horizontal: 7, vertical: 2))
      .padding(EdgeInsets.only(right: 15,left: 5,top: 5,bottom: 5))
      .make();
}
