import 'package:flutter/material.dart';
import 'package:islamii/my_theme.dart';
import 'package:islamii/provider/app_config_provider.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaTap extends StatefulWidget {
  @override
  State<SebhaTap> createState() => _SebhaTapState();
}
class _SebhaTapState extends State<SebhaTap> {
  int count =0;
  List<String> azkar = ['سبحان الله ','الحمد لله','الله أكبر'];
  int changeAzkar =0;
  double rotationAngle = 0.0;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.04),
      child: Center(
        child: Column(
          children:
              [
                Container(
                  child: Stack(
                  children: [
                    Container(


                        margin: provider.appLanguage=='ar'?
                        EdgeInsets.only(right: 63)
                            : EdgeInsets.only(left: 100),
                        child: Image.asset('assets/images/head_of_seb7a.png')),
                    Container(
                      margin: EdgeInsets.only(top: 79),
                      color: Colors.transparent,
                      child: GestureDetector(
                          onTap: (){
                            if(count<33){
                              count++;
                              setState(() {
                              });
                            }else{
                              changeAzkar++;
                              if(changeAzkar==azkar.length){
                                changeAzkar =0;
                              }
                              count =0;
                              setState(() {
                              });
                            }
                            setState(() {
                              rotationAngle += -45.0 * (3.141592653589793 / 180.0);
                            });
                          },
                          child: Transform.rotate(
                              angle: rotationAngle,
                              child: Image.asset('assets/images/body_of_seb7a.png'))),
                    ),
                  ],
                ),),
            Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: MyTheme.primaryLightColor,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Text('$count',),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                color: MyTheme.primaryLightColor,
                borderRadius: BorderRadius.circular(30)
              ),
              child: Text('${azkar[changeAzkar]}'),
            )
          ]
        ),
      ),
    );
  }
}
