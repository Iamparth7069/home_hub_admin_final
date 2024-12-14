import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Local Storage /localStorage.dart';
import '../../../Routes/appRoutes.dart';
import '../../../utils/extension.dart';

class LoginScreenController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordShow = true;
  LocalStorage localStorage = LocalStorage();
  final key = GlobalKey<FormState>();

  void showPassword(){
    isPasswordShow = !isPasswordShow;
    update();
  }


  void adminAuthentication(){
    if (key.currentState!.validate()) {
      if (emailController.text.trim() != "admin@gmail.com") {
        print("Please Enter valid email address");
        showMessege(
            title: "Login Failed",
            messege: "Please Enter valid email address");
      } else if (passwordController.text.trim() !=
          "Admin@123") {
        print("Please Enter valid email address");
        showMessege(
            title: "Login Failed",
            messege: "Please Enter valid password");
      } else {
        ///Navigate to home page
        LocalStorage.setLoginStatus(loginFlag: true);
        Get.offAllNamed(Routes.drawerScreen);
      }
    }else{
      showMessege(
          title: "error",
          messege: "Please Enter valid email address or password");
    }
    update();
  }
}