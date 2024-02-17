import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamii/home/hadeth/item_hadeth_name.dart';
import 'package:islamii/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii/provider/app_config_provider.dart';
import 'package:provider/provider.dart';
class HadethTap extends StatefulWidget {
  @override
  State<HadethTap> createState() => _HadethTapState();
}

class _HadethTapState extends State<HadethTap> {
  List<Hadeth> hadethList =[] ;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if(hadethList.isEmpty){
      loadFile();
    }
    return  Column(
      children: [
        Center(child: Image.asset('assets/images/ahadeth_image.png')),
        Divider(
          color: provider.isDarkMode() ?
          MyTheme.yellowColor
              :
          MyTheme.primaryLightColor,
          thickness: 3,
        ),
        Text(AppLocalizations.of(context)!.hadeth_name,style: Theme.of(context).textTheme.titleMedium,),
        Divider(
          color: provider.isDarkMode() ?
          MyTheme.yellowColor
              :
          MyTheme.primaryLightColor,
          thickness: 3,
        ),
        hadethList.isEmpty ?
            Center(child: CircularProgressIndicator(
              color:  MyTheme.primaryLightColor,
            ),)
            :
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
              return ItemHadethName(hadeth: hadethList[index] ,);
            },
            itemCount: hadethList.length ,
          ),
        )
      ],
    );
  }

  void loadFile()async{
   String hadethContent = await rootBundle.loadString('assets/files/ahadeth.txt');
   List<String> ahadethList = hadethContent.split('#\r\n');
   for(int i = 0 ; i<ahadethList.length  ;i++){
     List<String> hadethlines = ahadethList[i].split('\n');
     String titleHadeth =hadethlines[0] ;
     hadethlines.removeAt(0);
     Hadeth hadeth = Hadeth(title: titleHadeth, content: hadethlines);
     hadethList.add(hadeth);
     setState(() {

     });
   }
  }
}

class Hadeth{
  String title ;
  List<String> content ;
  Hadeth({required this.title,required this.content});
}
