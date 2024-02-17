import 'package:flutter/material.dart';
import 'package:islamii/home/settings/language_bottom_sheet.dart';
import 'package:islamii/home/settings/mode_bottom_sheet.dart';
import 'package:islamii/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class SettingsTap extends StatefulWidget {
  @override
  State<SettingsTap> createState() => _SettingsTapState();
}

class _SettingsTapState extends State<SettingsTap> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.language,
          style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: 10,),
          InkWell(
            onTap: (){
              showLanguageBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: MyTheme.primaryLightColor,
                borderRadius: BorderRadius.circular(25)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.appLanguage == 'en' ?
                  AppLocalizations.of(context)!.english
                      :
                  AppLocalizations.of(context)!.arabic
                    , style: Theme.of(context).textTheme.titleSmall,),
                  Icon(Icons.arrow_drop_down,
                    color: provider.isDarkMode()?
                    MyTheme.whiteColor
                        :
                    MyTheme.blackColor
                    ,
                    size: 25,)
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Text(AppLocalizations.of(context)!.mode,
            style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: 10,),
          InkWell(
            onTap: (){
              showModeBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: MyTheme.primaryLightColor,
                  borderRadius: BorderRadius.circular(25)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.isDarkMode() ?
                  AppLocalizations.of(context)!.dark
                      :
                  AppLocalizations.of(context)!.light
                    , style: Theme.of(context).textTheme.titleSmall,),
                  Icon(Icons.arrow_drop_down,
                    color: provider.isDarkMode()?
                        MyTheme.whiteColor
                        :
                        MyTheme.blackColor
                    ,size: 25,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) => LanguageButtomSheet());
  }

  void showModeBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) => ModeButtomSheet());
  }
}
