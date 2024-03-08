import 'package:apna_advocate/constant/icons.dart';
import 'package:apna_advocate/pages/Dashboard/dashboard.dart';
import 'package:apna_advocate/pages/profile/profile.dart';
import 'package:apna_advocate/pages/track%20Order/track%20Order.dart';
import 'package:flutter/material.dart';

import '../../constant/color.dart';

Widget navigation_bar(context,home,profile,track){
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconHelper.icons[10],color: home == true ?colorHelper.colors[1] : colorHelper.colors[0],),
          SizedBox(width: 3,),
          TextButton(onPressed: (){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => dashboard()), (route) => false);
          }, child:Text("Home",style: TextStyle(color: home == true ?colorHelper.colors[1] : colorHelper.colors[0],),),),
          SizedBox(width: 18,),
          Icon(iconHelper.icons[11],color: profile == true ?colorHelper.colors[1] : colorHelper.colors[0],),
          SizedBox(width: 3,),
          TextButton(onPressed: (){
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => account()), (route) => false);
          }, child:Text("Profile",style: TextStyle(color: profile == true ?colorHelper.colors[1] : colorHelper.colors[0],),),),
          SizedBox(width: 18,),
          Icon(iconHelper.icons[12],color: track == true ?colorHelper.colors[1] : colorHelper.colors[0],),
          SizedBox(width: 3,),
          TextButton(onPressed: (){
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => track_order()), (route) => false);
          }, child:Text("Track Order",style: TextStyle(color: track == true ?colorHelper.colors[1] : colorHelper.colors[0],),),),

        ],
      ),
    ),
  );
}