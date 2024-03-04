import 'package:apna_advocate/pages/Dashboard/dashboard.dart';
import 'package:apna_advocate/pages/profile/profile.dart';
import 'package:flutter/material.dart';

import '../../constant/color.dart';

Widget navigation_bar(context){
  return Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Container(
        height: 50,
        width: 344,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(80)),
            color: colorHelper.secondry_theme_color
        ),
        child: Row(
          children: [
            SizedBox(width:18,),
            TextButton(onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => dashboard()));
            },child :Text("Home",style: TextStyle(color: colorHelper.colors[0])),),
            SizedBox(width: 18,),
            Container(height: double.infinity,width: 1,color: colorHelper.colors[0],),
            SizedBox(width: 18,),
            TextButton(onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => profile()));

            },child :Text("Profile",style: TextStyle(color: colorHelper.colors[0])),),
            SizedBox(width: 18,),
            Container(height: double.infinity,width: 1,color: colorHelper.colors[0],),
            SizedBox(width: 18,),
            TextButton(onPressed: (){

            },child :Text("Track Order",style: TextStyle(color: colorHelper.colors[0])),),
            SizedBox(width: 18,),
          ],
        ),
      ),
    ),
  );
}