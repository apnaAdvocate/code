import 'package:apna_advocate/constant/assets.dart';
import 'package:apna_advocate/constant/color.dart';
import 'package:apna_advocate/controllers/engine/engine.dart';
import 'package:apna_advocate/pages/Dashboard/dashboard.dart';
import 'package:apna_advocate/pages/register/register.dart';
import 'package:apna_advocate/user/user.dart';
import 'package:flutter/material.dart';

class splash extends StatelessWidget {
  const splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    engine_controller.navigator(context);
    
    
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(assets.logo_transparent),
          SizedBox(height : 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: colorHelper.secondry_theme_color,strokeWidth: 5,),
              SizedBox(width: 20,),
              Text("Starting App ..",style: TextStyle(color: colorHelper.colors[1],fontWeight: FontWeight.bold),)
            ],
          )
        ],
      ),
    );
  }
}
