import 'package:client/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static InputDecoration inputDecoration(text, IconData? icon) {

      prefixIcon: icon != null
          ? Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Icon(
                icon,
                color: AppColors.blackColor,
                size: 26,
              ),
            )
          : null,
      border: InputBorder.none,
      filled: true,
      fillColor: AppColors.greyColor,
      hoverColor: AppColors.greyColor,
      focusColor: AppColors.greyColor,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(40),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(40),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(40),
      ),
    );
  }
}
