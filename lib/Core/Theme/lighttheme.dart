import 'package:flutter/material.dart';

import '../Constants/App/color.dart';
import 'textTheme.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  backgroundColor: AppColors.kWhite,
  primaryColor: AppColors.kYellow,
  accentColor: AppColors.kBlack,
  scaffoldBackgroundColor: AppColors.kWhite,
  textTheme: robototexttheme,
);
