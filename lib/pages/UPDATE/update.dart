import 'package:apna_advocate/constant/assets.dart';
import 'package:apna_advocate/constant/color.dart';
import 'package:flutter/material.dart';

class update_app extends StatelessWidget {
  const update_app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(assets.update_app),
          ),
          SizedBox(height: 30,),
          Center(
            child: Text("New Update",style: TextStyle(color: colorHelper.colors[1],fontWeight: FontWeight.bold,fontSize: 34),),
          ),
          SizedBox(height: 10,),
          Center(
            child: Text("Dear User, Apna Advocate has launched a new update. Kindly Download it from play store and continue using our app. \n Thank You",style: TextStyle(color: colorHelper.colors[1].withOpacity(0.6),fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          )
        ],
      ),
    );
  }
}
