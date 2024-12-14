import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../Local Storage /localStorage.dart';
import '../../Routes/appRoutes.dart';

class SplashScreenController extends GetxController {
  String displayText = '';
  int index = 0;
  final String _fullText = 'Help Harbor';

  @override
  void onInit() {
    super.onInit();
    _navigate();
  }

  Future<void> _navigate() async {
    final box = GetStorage();
    bool status = await LocalStorage.getLoginStatus();

    Future.delayed(const Duration(seconds: 3)).then(
          (value) {
            if(status){
              Get.offNamed(Routes.drawerScreen);
            }else {
              Get.offNamed(Routes.loginScreen);
            }
      },
    );
  }
}
