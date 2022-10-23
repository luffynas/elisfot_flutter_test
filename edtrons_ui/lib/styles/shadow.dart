import 'package:edtrons_ui/themes/colors.dart';
import 'package:flutter/material.dart';

abstract class AppShadow {
  static List<BoxShadow> xs = <BoxShadow>[
    BoxShadow(
      color: AppColors.gray[200]!,
      offset: const Offset(0, 0),
      blurRadius: 0,
      spreadRadius: 1,
    )
  ];

  static List<BoxShadow> sm = <BoxShadow>[
    BoxShadow(
      color: AppColors.gray[200]!,
      offset: const Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
    )
  ];

  static List<BoxShadow> base = <BoxShadow>[
    BoxShadow(
      color: AppColors.black[6]!,
      offset: const Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: AppColors.black[10]!,
      offset: const Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
    ),
  ];

  static List<BoxShadow> md = <BoxShadow>[
    BoxShadow(
      color: AppColors.black[6]!,
      offset: const Offset(0, 2),
      blurRadius: 4,
      spreadRadius: -1,
    ),
    BoxShadow(
      color: AppColors.black[10]!,
      offset: const Offset(0, 4),
      blurRadius: 6,
      spreadRadius: -1,
    ),
  ];

  static List<BoxShadow> lg = <BoxShadow>[
    BoxShadow(
      color: AppColors.black[5]!,
      offset: const Offset(0, 4),
      blurRadius: 6,
      spreadRadius: -2,
    ),
    BoxShadow(
      color: AppColors.black[10]!,
      offset: const Offset(0, 10),
      blurRadius: 15,
      spreadRadius: -3,
    ),
  ];

  static List<BoxShadow> xl = <BoxShadow>[
    BoxShadow(
      color: AppColors.black[4]!,
      offset: const Offset(0, 10),
      blurRadius: 10,
      spreadRadius: -5,
    ),
    BoxShadow(
      color: AppColors.black[10]!,
      offset: const Offset(0, 20),
      blurRadius: 25,
      spreadRadius: -5,
    ),
  ];

  static List<BoxShadow> xl2 = <BoxShadow>[
    BoxShadow(
      color: AppColors.black[25]!,
      offset: const Offset(0, 25),
      blurRadius: 50,
      spreadRadius: -12,
    ),
  ];
}
