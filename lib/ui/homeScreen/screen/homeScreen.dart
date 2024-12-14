import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_hub_admin_final/utils/extension.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/app_color.dart';
import '../../drawerScreen/controller/drawerScreenController.dart';
import '../controller/homeScreenController.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  DrawerScreenController drawerScreenController = Get.find<DrawerScreenController>();
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              drawerScreenController.advancedDrawerController.showDrawer();
            },
            child: const Icon(Icons.menu)),
        title: "Home".boldOpenSans(fontSize: 12.sp, fontColor: Colors.black),
      ),
      body: GetBuilder<HomeScreenController>(
        builder: (controller) {
          return controller.isLoading == true
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : Column(
            children: [
              3.h.addHSpace(),
              Row(
                children: [
                  Card(
                    child: Container(
                      width: 45.w,
                      height: 15.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25.w,
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: "Wallet".boldOpenSans(
                                      fontSize: 12.sp,
                                      fontColor: Colors.black),
                                ),
                                Center(
                                  child:
                                  "${controller.userData["wallet"]} ₹"
                                      .boldOpenSans(
                                      fontSize: 12.sp,
                                      fontColor: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Image.asset(
                            "assets/images/img.png",
                            width: 40,
                            color: appColor,
                          )
                        ],
                      ).paddingSymmetric(vertical: 2.h, horizontal: 2.w),
                    ),
                  ),
                  const Spacer(),
                  Card(
                    child: Container(
                      width: 45.w,
                      height: 15.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 29.w,
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: "Total Refund".boldOpenSans(
                                      fontSize: 12.sp,
                                      fontColor: Colors.black),
                                ),
                                Center(
                                  child:
                                  "${controller.userData["refund"]} ₹"
                                      .boldOpenSans(
                                      fontSize: 12.sp,
                                      fontColor: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Image.asset(
                            "assets/images/img_1.png",
                            width: 40,
                          )
                        ],
                      ).paddingSymmetric(vertical: 2.h, horizontal: 2.w),
                    ),
                  ),
                ],
              ),
              3.h.addHSpace(),
              Row(
                children: [
                  Card(
                    child: Container(
                      width: 45.w,
                      height: 15.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30.w,
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: "Total Payment".boldOpenSans(
                                      fontSize: 12.sp,
                                      fontColor: Colors.black),
                                ),
                                Center(
                                  child:
                                  "${controller.userData["payment"]} ₹"
                                      .boldOpenSans(
                                      fontSize: 12.sp,
                                      fontColor: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Image.asset(
                            "assets/images/img_2.png",
                            width: 35,
                            color: appColor,
                          )
                        ],
                      ).paddingSymmetric(vertical: 2.h, horizontal: 2.w),
                    ),
                  ),
                  const Spacer(),
                  Card(
                    child: Container(
                      width: 45.w,
                      height: 15.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 29.w,
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: "Total Orders".boldOpenSans(
                                      fontSize: 12.sp,
                                      fontColor: Colors.black),
                                ),
                                Center(
                                  child: "${controller.totalOrders}"
                                      .boldOpenSans(
                                      fontSize: 12.sp,
                                      fontColor: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Image.asset(
                            "assets/images/img_3.png",
                            width: 40,
                          )
                        ],
                      ).paddingSymmetric(vertical: 2.h, horizontal: 2.w),
                    ),
                  ),
                ],
              ),
              3.h.addHSpace(),
              Row(
                children: [
                  Card(
                    child: Container(
                      width: 45.w,
                      height: 15.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: "Service Providers".boldOpenSans(
                                fontSize: 12.sp, fontColor: Colors.black),
                          ),
                          Center(
                            child: "${controller.totalProviders}"
                                .boldOpenSans(
                                fontSize: 14.sp,
                                fontColor: Colors.black),
                          ),
                        ],
                      ).paddingSymmetric(vertical: 2.h, horizontal: 2.w),
                    ),
                  ),
                  const Spacer(),
                  Card(
                    child: Container(
                      width: 45.w,
                      height: 15.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: "Total Users".boldOpenSans(
                                fontSize: 12.sp, fontColor: Colors.black),
                          ),
                          Center(
                            child: "${controller.totalUsers}"
                                .boldOpenSans(
                                fontSize: 14.sp,
                                fontColor: Colors.black),
                          ),
                        ],
                      ).paddingSymmetric(vertical: 2.h, horizontal: 2.w),
                    ),
                  ),
                ],
              ),
            ],
          ).paddingSymmetric(horizontal: 2.w);
        },
      ),
    );
  }
}
