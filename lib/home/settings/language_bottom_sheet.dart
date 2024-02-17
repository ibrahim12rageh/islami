import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii/my_theme.dart';
import 'package:islamii/provider/app_config_provider.dart';
import 'package:provider/provider.dart';
class LanguageButtomSheet extends StatefulWidget {
  @override
  State<LanguageButtomSheet> createState() => _LanguageButtomSheetState();
}

class _LanguageButtomSheetState extends State<LanguageButtomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              provider.changeLanguage('en');
            },
            child: provider.appLanguage == 'en' ?
                getSelectedItemWidget(AppLocalizations.of(context)!.english)
                :
            getUnSelectedItemWidget(AppLocalizations.of(context)!.english)
            ,
          ),
          SizedBox(height: 10,),
          InkWell(
            onTap: (){
              provider.changeLanguage('ar');
            },
            child: provider.appLanguage == 'ar'?
            getSelectedItemWidget(AppLocalizations.of(context)!.arabic)
                :
            getUnSelectedItemWidget(AppLocalizations.of(context)!.arabic)

            ,
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: MyTheme.blackColor
          ),),
        Icon(Icons.check,color: Theme.of(context).primaryColor,)
      ],
    );
  }
  Widget getUnSelectedItemWidget(String text){
    return Text(text,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
        color: MyTheme.primaryLightColor
      ),);
  }
}
