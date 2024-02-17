import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamii/home/quran/item_sura_details.dart';
import 'package:islamii/home/quran/item_sura_name.dart';
import 'package:islamii/my_theme.dart';
import 'package:islamii/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details_screen';
  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}
class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses =[];
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs ;
    var provider = Provider.of<AppConfigProvider>(context);
    if(verses.isEmpty){
      loadFile(args.index);
    }
    return  Stack(
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
    title: Text('${args.name}',
    style: Theme.of(context).textTheme.titleLarge,),
    ),
      body: verses.isEmpty ?
          Center(child: CircularProgressIndicator())
      :
      Container(
        margin: EdgeInsets.symmetric
          (vertical: MediaQuery.of(context).size.height*0.06
            ,horizontal: MediaQuery.of(context).size.width*0.04),
        decoration: BoxDecoration(
          color: provider.isDarkMode()?
            MyTheme.primaryDarkColor
              :
              MyTheme.whiteColor
            ,
          borderRadius: BorderRadius.circular(25)
        ),
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
          return ItemSuraDetails(name :verses[index],index: index,);
        },
        itemCount: verses.length ,
        ),
      ),
    )
      ]
    );
  }
  void loadFile(int index)async{
    String content = await rootBundle.loadString('assets/files/${index+1}.txt');
    List<String> lines =content.split('\n');
    // for(int i = 0; i<lines.length;i++){
    //   print(lines[i]);
    verses = lines;
    setState(() {
    });
    }
}
class SuraDetailsArgs {
  String name ;
  int index ;
  SuraDetailsArgs({required this.name,required this.index});
}
