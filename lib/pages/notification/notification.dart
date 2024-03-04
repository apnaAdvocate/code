import 'package:apna_advocate/pages/Dashboard/dashboard.dart';
import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/icons.dart';

class notification extends StatelessWidget {
  const notification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: IconButton(onPressed: (){
                        Navigator.pop(context);
                    }, icon: Icon(iconHelper.icons[0],color: colorHelper.colors[1],))
                )
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Text("Notification",style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold,color: colorHelper.colors[1],letterSpacing: 1),),
                )
            ),
          ],
        ),
      ),
    );
  }
}
