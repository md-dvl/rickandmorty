// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

abstract class AppColors {
  final Color bg;
  final Color bg2;
  final Color searchBar;
  final Color searchBarText;
  final Color greyCommonText;
  final Color statusGreenGrid;
  final Color statusRed;
  final Color baseColor;
  final Color navBar;
  final Color episodeDate;
  final Color alertDialog;
  final Color checkbox;
  final Color white;
  final Color elementsNotFound;
  final Color cancelTheme;
  final Color iconsBoth;
  final Color lineSearchBar;
  final LinearGradient gradient;

  AppColors({
    required this.bg,
    required this.bg2,
    required this.searchBar,
    required this.searchBarText,
    required this.greyCommonText,
    required this.statusGreenGrid,
    required this.statusRed,
    required this.baseColor,
    required this.navBar,
    required this.episodeDate,
    required this.alertDialog,
    required this.checkbox,
    required this.white,
    required this.elementsNotFound,
    required this.cancelTheme,
    required this.iconsBoth,
    required this.lineSearchBar,
    required this.gradient,
  });
}

class LightColors implements AppColors {
  @override
  Color get bg => const Color(0xffFCFCFC);

  @override
  Color get bg2 => Colors.white;

  @override
  Color get searchBar => const Color(0xffF2F2F2);

  @override
  Color get searchBarText => const Color(0xffBDBDBD);

  @override
  Color get greyCommonText => const Color(0xff828282);

  @override
  Color get baseColor => const Color(0xff0B1E2D);

  @override
  Color get statusRed => const Color(0xffEB5757);

  @override
  Color get navBar => const Color(0xff22A2BD);

  @override
  Color get statusGreenGrid => const Color(0xff43D049);

  @override
  Color get episodeDate => const Color(0xff6E798C);

  @override
  Color get alertDialog => Colors.white;

  @override
  Color get checkbox => const Color(0xff22A2BD);

  @override
  Color get white => Colors.white;

  @override
  Color get elementsNotFound => const Color(0xff828282);

  @override
  LinearGradient get gradient => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.black.withOpacity(0.5),
          const Color(0xFF0B1E2D).withOpacity(0.39),
          const Color(0xFF0B1E2D).withOpacity(0),
          Colors.white.withOpacity(.01),
        ],
        stops: const [0, 0.37, 0.68, 1],
      );

  @override
  Color get cancelTheme => const Color(0xff4F4F4F);

  @override
  Color get iconsBoth => const Color(0xff5B6975);

  @override
  Color get lineSearchBar => const Color(0xffBDBDBD);
}

class DarkColors implements AppColors {
  @override
  Color get bg => const Color(0xff0B1E2D);

  @override
  Color get bg2 => const Color(0xff0B1E2D);

  @override
  Color get searchBar => const Color(0xff152A3A);

  @override
  Color get searchBarText => const Color(0xff5B6975);

  @override
  Color get greyCommonText => const Color(0xff6E798C);

  @override
  Color get baseColor => Colors.white;

  @override
  Color get statusRed => const Color(0xffEB5757);

  @override
  Color get navBar => const Color(0xff43D049);

  @override
  Color get statusGreenGrid => const Color(0xff43D049);

  @override
  Color get episodeDate => const Color(0xff6E798C);

  @override
  Color get alertDialog => const Color(0xff152A3A);

  @override
  Color get checkbox => const Color(0xff22A2BD);

  @override
  Color get white => Colors.white;

  @override
  Color get elementsNotFound => const Color(0xff5B6975);

  @override
  LinearGradient get gradient => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.black.withOpacity(0.65),
          const Color(0xFF0B1E2D).withOpacity(0.65),
          const Color(0xFF0B1E2D).withOpacity(0.65),
          const Color(0xFF0B1E2D).withOpacity(0.65),
        ],
        stops: const [0, 0.37, 0.68, 1],
      );

  @override
  Color get cancelTheme => Colors.white;

  @override
  Color get iconsBoth => const Color(0xff5B6975);

  @override
  @override
  Color get lineSearchBar => Colors.white.withOpacity(
        0.1,
      );
}
