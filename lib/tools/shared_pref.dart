
import 'package:flutter/material.dart';
import 'package:lesson_5/bloc/theme_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<int> saveNumber(int number) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setInt("NUMBER", number);
  return number;
}

Future<int> getNumber() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  int? number = preferences.getInt("NUMBER");
  return number == null ? 0 : number;
}


Future<String> saveTheme(ThemeData themeData) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();

  if(themeData == ThemeData.dark()){
    preferences.setString("THEME", AppTheme.GreenDark.toString());
  }else{
    preferences.setString("THEME", AppTheme.GreenLight.toString());
  }

  return themeData.toString();
}

Future<String> getThemeMode() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String theme = preferences.getInt("THEME") as String;
  return theme;
}