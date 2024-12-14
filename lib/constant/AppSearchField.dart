import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

import 'app_color.dart';

class AppSearchField extends StatefulWidget {
  const AppSearchField({super.key, required this.controller, this.onTap});
  final TextEditingController controller;
  final onTap;
  @override
  State<AppSearchField> createState() => _AppSearchFieldState();
}

class _AppSearchFieldState extends State<AppSearchField> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: TextFormField(
        maxLines: 1,
        onChanged: widget.onTap ?? (value) {},
        decoration: InputDecoration(
            prefixIcon: SvgPicture.asset(
              "assets/images/svg/search.svg",
              height: 20,
            ).paddingAll(17),
            suffixIcon: SvgPicture.asset(
              "assets/images/svg/settings-sliders.svg",
              height: 20,
              color: appColor,
            ).paddingAll(17),
            fillColor: const Color(0xfff5f5f5),
            filled: true,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search..",
            hintStyle: TextStyle(
                fontFamily: 'OpenSans', fontSize: 11.sp, color: greyColor)),
      ),
    );
  }
}
