import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier{
  String appLanguage = 'en' ;
  ThemeMode appTheme = ThemeMode.light;

  void changeLanguage(String newLanguge){
    if(appLanguage == newLanguge){
      return ;
    }
    appLanguage = newLanguge;
    notifyListeners();
  }

  void changeTheme(ThemeMode newMode){
    if(appTheme == newMode){
      return ;
    }
    appTheme = newMode ;
    notifyListeners();
  }

  bool isDarkMode(){
    return appTheme == ThemeMode.dark ;
  }
}