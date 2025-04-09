

import '../../consts/consts.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: mainColor.withOpacity(0.8), // Background color for the drawer
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                'John Doe',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              accountEmail: Text('john.doe@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.white),
              title: Text('Home'.tr,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500)),
              onTap: () {
                Navigator.pop(context);
                // Navigate to home or perform any action
              },
            ),
            ListTile(
              leading: Icon(Icons.credit_score, color: Colors.white),
              title: Text('Add Point'.tr,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500)),
              onTap: () {

                // Navigate to settings or perform any action
              },
            ),
            ListTile(
              leading: Icon(Icons.add_card, color: Colors.white),
              title: Text('WithDraw Request'.tr,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500)),
              onTap: () {

                // Navigate to settings or perform any action
              },
            ),
            ListTile(
              leading: Icon(
                Icons.share_rounded,
                color: Colors.white,
              ),
              title: Text('buyCredit2'.tr,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500)),
              onTap: () {

                // Navigate to settings or perform any action
              },
            ),
            ListTile(
              leading: Icon(Icons.list_alt_rounded, color: Colors.white),
              title: Text('Transaction'.tr,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500)),
              onTap: () {

                // Navigate to settings or perform any action
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.assignment_late_outlined, color: Colors.white),
              title: Text('Terms & Condition'.tr,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500)),
              onTap: () {

                // Navigate to settings or perform any action
              },
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip_outlined, color: Colors.white),
              title: Text('Privacy & Policy'.tr,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500)),
              onTap: () {

                // Navigate to settings or perform any action
              },
            ),
            ListTile(
              leading: Icon(Icons.help, color: Colors.white),
              title: Text('Help'.tr,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500)),
              onTap: () {
                Navigator.pop(context);
                // Navigate to help or perform any action
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.white),
              title: Text('Logout'.tr,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500)),
              onTap: () {
                Get.defaultDialog(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: dynamicSize),
                  title: 'Log Out',
                  middleText: 'Do you want to logout from this App?',
                  barrierDismissible: false,
                  // Prevent tapping outside the dialog to dismiss
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back(); // Close the dialog
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        backgroundColor: mainColor,
                      ),
                      child: Text('No',style: TextStyle(color: Colors.white)),
                    ).box.color(mainColor).shadowSm.rounded.make(),
                    15.widthBox,
                    TextButton(
                      onPressed: () {
                        Get.back(); // Close the dialog
                        // Add your logout logic here
                        Get.snackbar('Logging Out', 'You have been logged out',
                            snackPosition: SnackPosition.BOTTOM);
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        backgroundColor: mainColor,
                      ),
                      child: Text('Yes',style: TextStyle(color: Colors.white),),
                    ).box.color(mainColor).shadowSm.rounded.make(),
                  ],
                );

                // Perform logout or any other action
              },
            ),
          ],
        ),
      ),
    );
  }
}