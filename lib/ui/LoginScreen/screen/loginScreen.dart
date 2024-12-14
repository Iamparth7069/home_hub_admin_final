import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../Routes/appRoutes.dart';
import '../../../constant/app_assets.dart';
import '../../../utils/extension.dart';
import '../controller/loginScreenContoller.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginScreenController>(
      init: LoginScreenController(),
      builder: (controller) {
      return Scaffold(
        body: Form(
            key: controller.key,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        "assets/images/svg/login.svg",
                        height: 40.h,
                      ),
                    ),
                    "Login Now"
                        .boldOpenSans(fontColor: Colors.black, fontSize: 20.sp),
                    SizedBox(
                      height: 5.h,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || !AppAssets.isvalidemail(value)) {
                          return "Enter the Valid Email";
                        } else {
                          return null;
                        }
                      },
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Email",
                        filled: true,
                        fillColor: Colors.grey[100],
                        prefixIcon: const Icon(Icons.email),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    TextFormField(
                      controller: controller.passwordController,
                      obscureText: controller.isPasswordShow,
                      validator: (value) {
                        if (value == null || !AppAssets.isvalidpassword(value)) {
                          return "Enter the validPassword";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Password",
                          filled: true,
                          fillColor: Colors.grey[100],
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: GestureDetector(
                              onTap: () {
                               controller.showPassword();

                              },
                              child: Icon(controller.isPasswordShow == false
                                  ? Icons.visibility_off
                                  : Icons.remove_red_eye_sharp))),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    appButton(
                        onTap: () {
                          controller.adminAuthentication();
                        },
                        fontColor: Colors.white,
                        fontSize: 12.sp,
                        text: "Login")
                  ],
                ),
              ),
            )),
      );
    },);
  }
}
