import 'package:flutter/material.dart';
import 'package:updown_app/resources/themes/styles/app_colors.dart';
import 'package:updown_app/resources/themes/styles/app_sizes.dart';

class AppBorders {
  static BorderRadius none = BorderRadius.circular(0);
  static BorderRadius extraSmall = BorderRadius.circular(4);
  static BorderRadius small = BorderRadius.circular(8);
  static BorderRadius medium = BorderRadius.circular(16);
  static BorderRadius large = BorderRadius.circular(24);
  static BorderRadius extraLarge = BorderRadius.circular(100);
}

class AppShapes {
  static RoundedRectangleBorder none =
      RoundedRectangleBorder(borderRadius: AppBorders.none);
  static RoundedRectangleBorder extraSmall =
      RoundedRectangleBorder(borderRadius: AppBorders.extraSmall);
  static RoundedRectangleBorder small =
      RoundedRectangleBorder(borderRadius: AppBorders.small);
  static RoundedRectangleBorder medium =
      RoundedRectangleBorder(borderRadius: AppBorders.medium);
  static RoundedRectangleBorder large =
      RoundedRectangleBorder(borderRadius: AppBorders.large);
  static RoundedRectangleBorder extraLarge =
      RoundedRectangleBorder(borderRadius: AppBorders.extraLarge);
}

class AppBorderSides {
  static const none = BorderSide(width: 0, color: AppColors.transparent);
  static final checkbox = BorderSide(width: 9, color: AppColors.opacityWhite);
}

class AppInputBorders {
  static final textFormFieldInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(AppSizes.small)),
    borderSide: const BorderSide(width: 0),
    gapPadding: AppSizes.small,
  );
  static final none = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(AppSizes.none)),
    borderSide: const BorderSide(width: 0, color: AppColors.transparent),
    gapPadding: AppSizes.none,
  );
}
