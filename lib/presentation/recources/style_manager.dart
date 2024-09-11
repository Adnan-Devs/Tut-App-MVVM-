
import 'package:flutter/material.dart';
import 'package:udemy_mvvm_seriese/presentation/recources/fonts_manager.dart';

TextStyle _getTextStyle(
    double fontSize , String fontFamily, FontWeight fontWeight, Color color){

  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color,
  );
}

// light TextStyle

TextStyle getLightStyle (
    {double fontSize = FontSize.s12 , required Color color}){
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.light, color);
}

// Regular TextStyle
TextStyle getRegularStyle (
    {double fontSize = FontSize.s12 , required Color color}){
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.regular, color);
}

// Medium TextStyle
TextStyle getMediumStyle (
    {double fontSize = FontSize.s12 , required Color color}){
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.medium, color);
}

// SemiBold TextStyle
TextStyle? getSemiBoldStyle (
    {double fontSize = FontSize.s12 , required Color color}){
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.semiBold, color);
}

// SemiBold TextStyle
TextStyle getBoldStyle (
    {double fontSize = FontSize.s12 , required Color color}){
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.bold, color);
}