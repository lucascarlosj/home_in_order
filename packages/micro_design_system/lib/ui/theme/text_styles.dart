import 'package:flutter/material.dart';
import 'package:micro_design_system/micro_design_system.dart';

mixin TextStyles {
  static TextStyle title = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 25,
    fontFamily: 'Urbanist',
    color: AppColors.primaryColor,
  );

  static TextStyle titleMono1 = title.copyWith(
    fontWeight: FontWeight.normal,
    fontSize: 18,
    color: AppColors.black,
  );

  static TextStyle titleMono2 = title.copyWith(
    fontWeight: FontWeight.normal,
    fontSize: 16,
    color: AppColors.black,
  );

  static TextStyle titleDisable = title.copyWith(
    fontWeight: FontWeight.normal,
    fontSize: 16,
    color: AppColors.greyBorder,
  );

  static TextStyle link = title.copyWith(
    fontSize: 16,
    color: AppColors.black,
  );

  static TextStyle linkPrimaryColor = title.copyWith(
    fontSize: 16,
    color: AppColors.primaryColor,
  );

  static TextStyle linkPrimaryColor14 = title.copyWith(
    fontSize: 14,
    color: AppColors.primaryColor,
  );

  static TextStyle linkButton = title.copyWith(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: AppColors.greyDark,
  );

  static TextStyle textButton = title.copyWith(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: Colors.white,
  );
}