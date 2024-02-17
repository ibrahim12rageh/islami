import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii/my_theme.dart';
import 'package:islamii/provider/app_config_provider.dart';
import 'package:provider/provider.dart';
class ModeButtomSheet extends StatefulWidget {
  @override
  State<ModeButtomSheet> createState() => _ModeButtomSheetState();
}

class _ModeButtomSheetState extends State<ModeButtomSheet> {
  late AppConfigProvider provider ;
  @override
  Widget build(BuildContext context) {

     provider = Provider.of<AppConfigProvider>(context);

    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              provider.changeTheme(ThemeMode.dark);
            },
            child: provider.isDarkMode() ?
                getSelectedItemWidget(AppLocalizations.of(context)!.dark)
                :
            getUnSelectedItemWidget(AppLocalizations.of(context)!.dark)
            ,
          ),
          SizedBox(height: 10,),
          InkWell(
            onTap: (){
              provider.changeTheme(ThemeMode.light);
            },
            child: provider.isDarkMode()?
            getUnSelectedItemWidget(AppLocalizations.of(context)!.light)
                :
            getSelectedItemWidget(AppLocalizations.of(context)!.light)

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
              color: Theme.of(context).primaryColor
          ),),
        Icon(Icons.check,color: Theme.of(context).primaryColor,)
      ],
    );
  }
  Widget getUnSelectedItemWidget(String text){
    return Text(text,
      style: provider.isDarkMode()?
      Theme.of(context).textTheme.titleSmall?.copyWith(
        color: MyTheme.primaryLightColor
      )
            :
      Theme.of(context).textTheme.titleSmall,);
  }
}
