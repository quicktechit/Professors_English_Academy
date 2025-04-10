import 'package:professors_english_academy/consts/consts.dart';

Widget customContractUS(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          "Having any Trouble?".text.make(),
          10.heightBox,
          "Call Us".text.semiBold.xl.make(),10.heightBox,
          "9 AM to 10 PM".text.make(),
          15.heightBox,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.phone,
                color: Colors.white,
              ),
              15.widthBox,
              "01641634899".text.semiBold.white.make()
            ],
          )
              .box
              .size(context.screenWidth / 2, 45)
              .roundedSM
              .alignCenter
              .clip(Clip.antiAlias)
              .color(mainColor)
              .make()
        ],
      ),
      Image.asset(
        "assets/images/5145032_2516482-removebg-preview.png",
       width: context.screenWidth*0.3,
      )
    ],
  )
      .box
      .padding(EdgeInsets.all(10))
      .size(context.screenWidth, 200)
      .roundedSM
      .clip(Clip.antiAlias)
      .margin(EdgeInsets.all( 7))
      .withDecoration(
        BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.greenAccent.withOpacity(0.5) ,Colors.orangeAccent.withOpacity(0.5)], // Define your gradient colors
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(
              12), // Optional: Add border radius if desired
        ),
      )
      .make().card.elevation(3).p8.make().marginAll(10);
}
