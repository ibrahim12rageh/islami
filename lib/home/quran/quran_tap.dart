import 'package:flutter/material.dart';
import 'package:islamii/home/quran/item_sura_name.dart';
import 'package:islamii/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii/provider/app_config_provider.dart';
import 'package:provider/provider.dart';
class QuranTap extends StatelessWidget {
  List<String> suraName =["الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
    ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
    ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
    ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
    ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
    ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
    ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
    ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
    ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
    "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        Center(child: Image.asset('assets/images/quran_image.png')),
        Divider(
          color: provider.isDarkMode() ?
          MyTheme.yellowColor
          :
              MyTheme.primaryLightColor,
          thickness: 3,
        ),
        Text(AppLocalizations.of(context)!.sura_name,style: Theme.of(context).textTheme.titleMedium,),
        Divider(
          color: provider.isDarkMode() ?
          MyTheme.yellowColor
              :
          MyTheme.primaryLightColor,
          thickness: 3,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder:(context,index){
              return Divider(
                color: provider.isDarkMode() ?
                MyTheme.yellowColor
                    :
                MyTheme.primaryLightColor,
                thickness: 2,
              );
            } ,
              itemBuilder: (context,index){
                return ItemSuraName(name:suraName[index],index: index,);
                },
            itemCount: suraName.length,
              ),
        )
      ],
    );
  }
}
