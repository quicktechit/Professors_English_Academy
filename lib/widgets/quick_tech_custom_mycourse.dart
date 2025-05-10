import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/widgets/quick_tech_custom_button.dart';
import 'package:professors_english_academy/widgets/quick_tech_custom_reating_submit.dart';

Widget myCourse({
  required BuildContext context,
  required String id,
  required String title,
  required String image,
  required String complete,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.network(
        Api.imageUrl + image,
        width: 100,
        fit: BoxFit.cover,
      ),
      10.widthBox,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          title.text.semiBold.lg.make().w(context.screenWidth * 0.6),
          5.heightBox,
          "$complete % Complete".text.semiBold.make(),
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
                        Get.bottomSheet(customRatingSubmitBottomShit(id));
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
