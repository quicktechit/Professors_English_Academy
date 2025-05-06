import 'package:flutter/cupertino.dart';
import 'package:professors_english_academy/pages/leader%20board/quick_tech_leader_board.dart';
import 'package:professors_english_academy/pages/profile%20page/quick_tech_profile_screen.dart';
import '../consts/consts.dart';
import '../pages/Practice/quick_tech_Practice_page.dart';
import '../pages/category/quick_tech_category_page.dart';
import '../pages/home/quick_tech_home_page.dart';
class DashboardController extends GetxController {
  var currentIndex = 0.obs;
  var isSwitchOn = false.obs;

  Future<bool> onWillPop(context) async {
    return (await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Are you sure?'),
              content: const Text('Do you really want to exit?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text('Yes'),
                ),
              ],
            );
          },
        )) ??
        false;
  }

  void onItemTapped(int index) {
    currentIndex.value = index;
    update();
  }

  var item = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.menu_book),
      label: 'Category',
    ),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.rectangle_stack),
      label: 'Practice',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.leaderboard_outlined),
      label: 'LeaderBoard',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      label: 'Profile',
    ),
  ];
  var navBody = [
    QuickTechHomePage(),
    QuickTechCategoryPage(),
    QuickTechPracticePage(),
    QuickTechLeaderBoard(),
    QuickTechProfileScreen(),
  ];
}
