import 'package:flutter/material.dart';
import 'package:islamii/home/quran/sura_details_screen.dart';
import 'package:islamii/my_theme.dart';
import 'package:islamii/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class ItemHadethDetails extends StatelessWidget {
  String content ;
  ItemHadethDetails({required this.content});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Text(
      content,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
        color: provider.isDarkMode()?
            MyTheme.yellowColor
            :
            MyTheme.blackColor
            
      )
    );
  }
}
