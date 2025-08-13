import 'package:flutter/widgets.dart';

class Dimensions {
  final BuildContext context;
  final double screenWidth;
  final double screenHeight;

  Dimensions(this.context)
      : screenWidth = MediaQuery.of(context).size.width,
        screenHeight = MediaQuery.of(context).size.height;

  // Heights
  double get height300 => screenHeight / 15.5;
  double get height10 => screenHeight / 73.1;
  double get height20 => screenHeight / 36.55;
  double get height15 => screenHeight / 48.7;
  double get height30 => screenHeight / 28.1;
  double get height45 => screenHeight / 16.4;
  double get height25 => screenHeight / 29.4;
  double get height5 => screenHeight / 146.2;
  double get height50 => screenHeight / 14.1;

  // Widths
  double get width150 => 150;

  // Font sizes
  double get font26 => screenHeight / 28.11;
  double get font20 => screenHeight / 36.55;
  double get font16 => screenHeight / 45.69;
  double get font12 => screenHeight / 58.07;

  // Margins
  double get margin30 => screenHeight / 28.1;
  double get margin45 => screenHeight / 16.4;

  // Radii
  double get radius20 => screenHeight / 36.55;
  double get radius30 => screenHeight / 28.1;
  double get radius15 => screenHeight / 48.7;

  // Icon sizes
  double get iconSize24 => screenHeight / 30.05;
  double get iconSize16 => screenHeight / 45.7;

  // ListView sizes
  double get listViewImgSize => screenHeight / 6.09;
  double get listViewTextContSize => screenHeight / 7.31;

  // Popular food image
  double get popularFoodImgSize => screenHeight / 2.09;

  // Bottom bar height
  double get bottomHeight => screenHeight / 6.09;
}
