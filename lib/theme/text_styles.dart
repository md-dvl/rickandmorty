import 'package:flutter/material.dart';
import 'package:rickmorty/theme/colors.dart';

abstract class AppTextStyles {
  static const def16w400 = TextStyle(
    fontSize: 16,
    height: 24 / 16,
    letterSpacing: 0.44,
    color: AppColors.colorBDBDBD,
  );

  static const def16w400Black = TextStyle(
    fontSize: 16,
    height: 24 / 16,
    letterSpacing: 0.15,
    color: AppColors.color0B1E2D,
  );
  static const def10w500 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    height: 16 / 10,
    letterSpacing: 1.5,
    color: AppColors.color828282,
  );
  static const def16w500 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 24 / 16,
    letterSpacing: 0.5,
    color: AppColors.color0B1E2D,
  );

  static const def12w400 = TextStyle(
    fontSize: 12,
    height: 16 / 12,
    letterSpacing: 0.5,
    color: AppColors.color828282,
  );

  static const def20w500 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 28 / 20,
    letterSpacing: 0.15,
    color: AppColors.color0B1E2D,
  );

  static const def14w400 = TextStyle(
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0.25,
    color: AppColors.color828282,
  );

  static const def13w400 = TextStyle(
    fontSize: 13,
    height: 19.5 / 13,
    letterSpacing: 0.25,
    color: AppColors.color0B1E2D,
  );

  static const def34w400 = TextStyle(
    fontSize: 34,
    height: 40 / 34,
    letterSpacing: 0.25,
    color: AppColors.color0B1E2D,
  );
  static const def10w500det = TextStyle(
    color: AppColors.color43D049,
    letterSpacing: 1.5,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    height: 16 / 10,
  );
  static const def13w400det = TextStyle(
    letterSpacing: 0.5,
    fontSize: 13,
    height: 19.5 / 13,
    color: AppColors.color0B1E2D,
  );

  static const def14w400det = TextStyle(
      letterSpacing: 0.25,
      fontSize: 14,
      height: 20 / 14,
      color: AppColors.color0B1E2D);
}
