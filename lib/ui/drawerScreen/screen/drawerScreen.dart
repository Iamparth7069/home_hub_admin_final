import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';


import 'package:sizer/sizer.dart';

import '../../../constant/app_color.dart';
import '../controller/drawerScreenController.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  DrawerScreenController drawerScreenController = Get.find<DrawerScreenController>();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [semiLightPurple, lightPurple],
          ),
        ),
      ),
      controller: drawerScreenController.advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    // color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/app_logo.png',
                  ),
                ),
                ListTile(
                  onTap: () {
                    drawerScreenController.setScreenNo(0);
                    drawerScreenController.advancedDrawerController
                        .hideDrawer();
                  },
                  leading: const Icon(Icons.home, size: 28, color: appColor),
                  title: Text('Home',
                      style: TextStyle(color: appColor, fontSize: 14.sp)),
                ),
                ListTile(
                  onTap: () {
                    drawerScreenController.setScreenNo(1);
                    drawerScreenController.advancedDrawerController
                        .hideDrawer();
                  },
                  leading: Image.asset(
                    "assets/images/add-friend.png",
                    color: appColor,
                    width: 20,
                  ),
                  title: Text('Provider Requests',
                      style: TextStyle(color: appColor, fontSize: 14.sp)),
                ),
                ListTile(
                  onTap: () {
                    drawerScreenController.setScreenNo(2);
                    drawerScreenController.advancedDrawerController
                        .hideDrawer();
                  },
                  leading: const Icon(Icons.miscellaneous_services_outlined,
                      size: 28, color: appColor),
                  title: Text('Services',
                      style: TextStyle(color: appColor, fontSize: 14.sp)),
                ),
                ListTile(
                  leading: Image.asset(
                    "assets/images/discount.png",
                    color: appColor,
                    width: 20,
                  ),
                  onTap: () {
                    drawerScreenController.setScreenNo(3);
                    drawerScreenController.advancedDrawerController
                        .hideDrawer();
                  },
                  title: Text('Offers',
                      style: TextStyle(color: appColor, fontSize: 14.sp)),
                ),
                ListTile(
                  onTap: () {
                    drawerScreenController.setScreenNo(4);
                    drawerScreenController.advancedDrawerController
                        .hideDrawer();
                  },
                  leading: Image.asset(
                    "assets/images/money.png",
                    color: appColor,
                    width: 21,
                  ),
                  title: Text('Payment Requests',
                      style: TextStyle(color: appColor, fontSize: 14.sp)),
                ),
                ListTile(
                  onTap: () {
                    drawerScreenController.setScreenNo(5);
                    drawerScreenController.advancedDrawerController
                        .hideDrawer();
                  },
                  leading: const Icon(Icons.settings, color: appColor),
                  title: Text('Transaction',
                      style: TextStyle(color: appColor, fontSize: 14.sp)),
                ),
                // ListTile(
                //   onTap: () {
                //     drawerScreenController.setScreenNo(6);
                //     drawerScreenController.advancedDrawerController
                //         .hideDrawer();
                //   },
                //   leading: const Icon(Icons.notifications, color: appColor),
                //   title: Text('Send Notification',
                //       style: TextStyle(color: appColor, fontSize: 14.sp)),
                // ),
                const Spacer(),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: const Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      child: GetBuilder<DrawerScreenController>(
        builder: (controller) {
          return controller.widgets[controller.screenNo];
        },
      ),

    );
  }
}
