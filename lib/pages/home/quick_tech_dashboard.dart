import 'package:professors_english_academy/controller/quick_tech_profile_controller.dart';

import '../../consts/consts.dart';
import '../../controller/quick_tech_dashboard_controller.dart';

class QuickTechDashboard extends StatefulWidget {
  const QuickTechDashboard({super.key});

  @override
  State<QuickTechDashboard> createState() => _QuickTechDashboardState();
}

class _QuickTechDashboardState extends State<QuickTechDashboard> {
  final DashboardController dashBoardController =
  Get.put(DashboardController());
  final ProfileController profileController=Get.put(ProfileController());
  final ThemeController themeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var res = await dashBoardController.onWillPop(context);
        return res;
      },
      child:  Scaffold(
          bottomNavigationBar:  Obx(
                () => BottomNavigationBar(
                backgroundColor: mainColor,
                unselectedItemColor:themeController.isDarkMode.value?white: Colors.black,
                selectedItemColor: mainColor,
                currentIndex: dashBoardController.currentIndex.value,
                onTap:dashBoardController. onItemTapped,
                items:dashBoardController.item
            ),
          ),

          body:Obx(
                ()=> Column(children: [
              Expanded(
                  child: dashBoardController.navBody
                      .elementAt(dashBoardController.currentIndex.value))
                  .animate()
                  .fadeIn()
            ],),
          )
      ),
    );
  }
}
