import 'package:flutter/material.dart';
import 'package:islamii/my_theme.dart';

class RadioTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.13),
      child: Center(
        child: Column(
          children: [
            Container(
                child: Image .asset('assets/images/radio_image.png')
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.05),

                child: Text('إذاعة القرآن الكريم',style: Theme.of(context).textTheme.titleMedium,)
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.skip_previous,color: MyTheme.primaryLightColor,size: 30,)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.play_arrow,color: MyTheme.primaryLightColor,size: 30,)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.skip_next,color: MyTheme.primaryLightColor,size: 30,)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
