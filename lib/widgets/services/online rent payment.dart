import 'package:apna_advocate/constant/assets.dart';
import 'package:apna_advocate/constant/color.dart';
import 'package:apna_advocate/constant/icons.dart';
import 'package:flutter/cupertino.dart';

Widget online_rent_payment_card(){
  return Container(
    height: 120,
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorHelper.rgb[11],
              colorHelper.rgb[12].withOpacity(0.30)
            ]
        )
    ),
    child: Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Online Rent Payment",style: TextStyle(fontSize: 14,color: colorHelper.colors[1],fontWeight: FontWeight.bold),),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(assets.icon),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 32,left: 0),
              child: Container(
                height: 60,
                width: 90,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(iconHelper.icons[8],color: colorHelper.colors[1],size: 16,),
                        SizedBox(width: 8,),
                        Text("24 hours",style: TextStyle(color: colorHelper.colors[1],fontSize: 12),)
                      ],
                    ),
                    SizedBox(height: 8,),
                    Row(
                      children: [
                        Icon(iconHelper.icons[9],color: colorHelper.colors[1],size: 16,),
                        SizedBox(width: 8,),
                        Text("120",style: TextStyle(color: colorHelper.colors[1],fontSize: 12),)],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}