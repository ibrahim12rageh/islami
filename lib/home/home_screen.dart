import 'package:flutter/material.dart';
import 'package:islamii/home/hadeth/hadethtap.dart';
import 'package:islamii/home/quran/quran_tap.dart';
import 'package:islamii/home/radio/radio_tap.dart';
import 'package:islamii/home/sebha/sebha_tap.dart';
import 'package:islamii/home/settings/settings_tap.dart';
import 'package:islamii/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';
   HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        provider.isDarkMode() ?
    Image.asset('assets/images/main_background_dark.png',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,)
            :
        Image.asset('assets/images/main.background.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.app_title,
            style: Theme.of(context).textTheme.titleLarge,),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).primaryColor
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex ,
                onTap: (index){
                selectedIndex =index ;
                setState(() {
                });
                },
                items: [
                  BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/icon_quran.png')),
                  label: AppLocalizations.of(context)!.quran),
                  BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/icon_hadeth.png')),
                  label: AppLocalizations.of(context)!.hadeth),
                  BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/icon_radio.png')),
                      label:AppLocalizations.of(context)!.radio),
                  BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/icon_sepha.png')),
                      label: AppLocalizations.of(context)!.sebha),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: AppLocalizations.of(context)!.settings),
                ]),
          ),
          body: tabs[selectedIndex],
        )
      ],
    );
  }
  List<Widget> tabs =[
    QuranTap(),HadethTap(),RadioTap(),SebhaTap(),SettingsTap()
  ];
}