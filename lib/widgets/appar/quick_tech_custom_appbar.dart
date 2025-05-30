import 'package:professors_english_academy/consts/consts.dart';
import 'package:professors_english_academy/controller/quick_tech_profile_controller.dart';

import '../../controller/quick_tech_dashboard_controller.dart';

Widget customAppbar(BuildContext context) {
  final DashboardController dashboardController = Get.find();
  final ProfileController profileController = Get.find();
  final ThemeController themeController = Get.find();
  return AppBar(
    automaticallyImplyLeading: false,
    title: Obx(
      ()=> Row(
        mainAxisSize:MainAxisSize.min,
        children: [
          "${profileController.profile.value.user?.image}" != "null"
                ? Image.network(
                    "${Api.baseUrl}/${profileController.profile.value.user?.image}",
                    width: 40,height: 40,
                    fit: BoxFit.cover,
                  )
                    .box
                    .roundedFull
                    .white
                    .clip(Clip.antiAlias)
                    .border(color: Colors.black, width: 1.4)
                    .make()
                    .card
                    .roundedLg
                    .elevation(5)
                    .make()
                : Image.asset(
              "assets/images/man.png",
              width: 40,
              height: 40,
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
              "${profileController.profile.value.user?.name}".text.semiBold.xl2.make(),
              "${profileController.profile.value.user?.phone}".text.semiBold.sm.make()
            ],
          ),
        ],
      ).box.make().onTap((){
        dashboardController.currentIndex.value=4;
      }),
    ),
    actions: [
      Obx(
        () => Icon(
          !themeController.isDarkMode.value
              ? Icons.nightlight_outlined
              : Icons.sunny,
          //Icons.sunny,
          color:
              !themeController.isDarkMode.value ? Colors.black : Colors.white,
          //color: Colors.redAccent,
        ).onTap(() {
          themeController.toggleTheme();
          Get.appUpdate();
        }),
      ),
      // Icon(
      //     Icons.notifications_active_outlined,
      //     color: mainColor,
      //     size: 30,
      //   ).onTap((){
      //     Get.to(()=>QuickTechNotificationPage());
      //   }),
      10.widthBox,
    ],
  );
}
