import 'package:professors_english_academy/consts/consts.dart';

import '../../controller/quick_tech_dashboard_controller.dart';
import '../../pages/notification/quick_tech_notification_page.dart';

Widget customAppbar(BuildContext context) {
  final DashboardController dashboardController = Get.find();
  return AppBar(
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisSize:MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/man.png",
          width: 40,
          fit: BoxFit.cover,
        )
            .box
            .roundedFull.white
            .clip(Clip.antiAlias)
            .border(color: Colors.black, width: 1.4)
            .make().card.roundedLg.elevation(5).make(),
        20.widthBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Nasir Khan".text.semiBold.xl2.make(),
            "01641634899".text.semiBold.sm.make()
          ],
        ),
      ],
    ).box.make().onTap((){
      dashboardController.currentIndex.value=3;
    }),
    actions: [
      Icon(
        Icons.notifications_active_outlined,
        color: mainColor,
        size: 30,
      ).onTap((){
        Get.to(()=>QuickTechNotificationPage());
      }),
      5.widthBox,
    ],
  );
}
