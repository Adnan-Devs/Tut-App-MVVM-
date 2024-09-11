import 'package:flutter/material.dart';
import 'package:udemy_mvvm_seriese/presentation/recources/color_manager.dart';
import 'package:udemy_mvvm_seriese/presentation/recources/fonts_manager.dart';
import 'package:udemy_mvvm_seriese/presentation/recources/style_manager.dart';
import 'package:udemy_mvvm_seriese/presentation/recources/value_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // Main Colors for App
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpecity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1, // use in case if disables button for example
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: ColorManager.grey, // Use this instead of accentColor
    ),
    splashColor: ColorManager.primaryOpecity70,

    // card view theme

    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSizes.s4,
    ),

    // app bar theme

    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: AppSizes.s4,
      color: ColorManager.primary,
      shadowColor: ColorManager.primaryOpecity70,
      titleTextStyle: getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16),
    ),

    // button theme

    buttonTheme: ButtonThemeData(
      shape: StadiumBorder(),
      buttonColor: ColorManager.primary,
      disabledColor: ColorManager.grey1,
      splashColor: ColorManager.primaryOpecity70,
    ),
    
    // Elevated Buttton Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontSize: FontSize.s16, color: ColorManager.white),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.s12)),
      ),
    ),

    // text theme
    textTheme: TextTheme(
      headlineLarge: getSemiBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
      titleMedium : getMediumStyle(color: ColorManager.lightGrey, fontSize: FontSize.s14),
      bodySmall : getRegularStyle(color: ColorManager.grey1),
      bodyLarge: getRegularStyle(color: ColorManager.grey),
    ),

    // input theme

    inputDecorationTheme: InputDecorationTheme(
      //content padding
      contentPadding: const EdgeInsets.all(AppPaddings.p8),
      // hint Style
      hintStyle: getRegularStyle(color: ColorManager.grey1),
      // label style
      labelStyle: getRegularStyle(color: ColorManager.darkGrey),
      // error style
      errorStyle: getRegularStyle(color: ColorManager.error),
      
      // enabled border
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.grey,
          width: AppSizes.s1_5,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(AppSizes.s8))
      ),
      // focused border
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primary,
            width: AppSizes.s1_5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(AppSizes.s8))
      ),
      // error border
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.error,
            width: AppSizes.s1_5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(AppSizes.s8))
      ),
      // focused error boroder
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primary,
            width: AppSizes.s1_5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(AppSizes.s8))
      ),
    ),

  );
}