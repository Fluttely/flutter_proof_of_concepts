import 'package:flutter/widgets.dart';

class AppSizes {
  static double none = 0;
  static double extraSmall = 4;
  static double small = 8;
  static double medium = 16;
  static double large = 24;
  static double extraLarge = 32;

  static double iconButton = 12;
  static double iconDropdown = 44;
  static double profielTreasure = 380;
  static double detailsTreasure = 200;
  static double detailsContainerWidth = 380;
  static double detailsContainerHeight = 252;
  static double detailsContainerDescriptionTitleMaxWidth = 80;
  static double transactionValueContainerWidth = 380;
}

class AppTextSizes {
  static double none = 0;
  static double extraSmall = 10;
  static double small = 14;
  static double medium = 20;
  static double large = 26;
  static double extraLarge = 32;
}

class AppSpacers {
  static SizedBox none = const SizedBox();
  static SizedBox extraSmallVertical = SizedBox(height: AppSizes.extraSmall);
  static SizedBox smallVertical = SizedBox(height: AppSizes.small);
  static SizedBox mediumVertical = SizedBox(height: AppSizes.medium);
  static SizedBox largeVertical = SizedBox(height: AppSizes.large);
  static SizedBox extraLargeVertical = SizedBox(height: AppSizes.extraLarge);

  static SizedBox extraSmallHorizontal = SizedBox(width: AppSizes.extraSmall);
  static SizedBox smallHorizontal = SizedBox(width: AppSizes.small);
  static SizedBox mediumHorizontal = SizedBox(width: AppSizes.medium);
  static SizedBox largeHorizontal = SizedBox(width: AppSizes.large);
  static SizedBox extraLargeHorizontal = SizedBox(width: AppSizes.extraLarge);
}

class AppPaddings {
  static EdgeInsets noneAll = EdgeInsets.all(AppSizes.none);
  static EdgeInsets contentDialog = EdgeInsets.fromLTRB(
    AppSizes.medium,
    AppSizes.medium,
    AppSizes.medium,
    AppSizes.none,
  );
}
