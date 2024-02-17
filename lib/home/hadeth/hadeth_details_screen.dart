import 'package:flutter/material.dart';
import 'package:islamii/home/hadeth/hadethtap.dart';
import 'package:islamii/home/hadeth/item_hadeth_details.dart';
import 'package:islamii/my_theme.dart';
import 'package:islamii/provider/app_config_provider.dart';
import 'package:provider/provider.dart';
class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'hadeth_details_screen';
  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}
class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
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
    title: Text('${args.title}',
    style: Theme.of(context).textTheme.titleLarge,),
    ),
      body: Container(
        margin: EdgeInsets.symmetric
          (vertical: MediaQuery.of(context).size.height*0.06
            ,horizontal: MediaQuery.of(context).size.width*0.04),
        decoration: BoxDecoration(
          color: provider.isDarkMode()?
              MyTheme.primaryDarkColor
          :
          MyTheme.whiteColor,
          borderRadius: BorderRadius.circular(25)
        ),
        child: ListView.builder(
          itemBuilder: (context,index){
          return ItemHadethDetails(content : args.content[index]);
        },
        itemCount: args.content.length ,
        ),
      ),
    )
      ]
    );
  }
}
