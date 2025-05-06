import 'package:professors_english_academy/controller/quick_tech_my_course_controller.dart';
import 'package:professors_english_academy/widgets/quick_tech_custom_button.dart';
import 'package:professors_english_academy/widgets/quicktech_custom_text_field.dart';

import '../consts/consts.dart';

Widget customRatingSubmitBottomShit() {
  MyCourseController myCourseController = Get.find();
  return Column(
    children: [
      10.heightBox,

      Text('How would you rate This Course?', style: TextStyle(fontSize: 18)),
      20.heightBox,
      Obx(() =>
          RatingBar.builder(
            initialRating: myCourseController.rating.value,
            minRating: 0.5,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 40.0,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
            onRatingUpdate: (rating) {
              myCourseController.updateRating(rating);
            },
          )),
      15.heightBox,
      "Note".text.make().box.alignCenterLeft.make().pSymmetric(h: 15),
      10.heightBox,
      customTextField(hint: "note", isSuffix: false, isVisible: true).pSymmetric(h: 15),

      20.heightBox,
      customButton(title: "Submit", onPressed: () {
        myCourseController.submitRating();
      }, color: mainColor, txtColor: white).w(150)
    ],
  )
      .box
      .white
      .width(Get.width)
      .p4
      .customRounded(BorderRadius.only(
      topLeft: Radius.circular(12), topRight: Radius.circular(12)))
      .make();
}
