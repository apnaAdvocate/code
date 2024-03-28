import 'package:apna_advocate/pages/Forget%20Password/forget%20password.dart';
import 'package:apna_advocate/widgets/forgot_password_text_feild/new_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constant/assets.dart';
import '../../constant/color.dart';
import '../../constant/icons.dart';
import '../../controllers/login/login controller.dart';
import '../../widgets/forgot_password_text_feild/text_feild_forgot_password.dart';
import '../register/register.dart';
import '../splash/splash.dart';

class newPassword extends StatelessWidget {
  const newPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: 800,
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        colorHelper.rgb[1],
                        colorHelper.theme_color_black
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 0,),
                      Image.asset(assets.digital_india,height: 50,width:130,fit: BoxFit.fitWidth,)
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 5,),
                    Image.asset(assets.lion),
                    SizedBox(width: 18,),
                    Image.asset(assets.azadi_ka_amrit)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30,top: 0),
                  child: Image.asset(assets.logo_transparent,height: 200,width: double.infinity,fit: BoxFit.fitWidth,),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: IconButton(onPressed: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => register()));
                        }, icon: Icon(iconHelper.icons[0],color: colorHelper.colors[1],))
                    )
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: Text("New Password",style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold,color: colorHelper.colors[1],letterSpacing: 1),),
                    )
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: Text("Please enter new Password",style: TextStyle(fontSize: 12,color: colorHelper.colors[2]),),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18,right: 18,top: 40),
                  child: new_password(),
                ),
                SizedBox(height: 50,),
                InkWell(
                  onTap: ()async{
                    await login_controller.change_pass();
                    await Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => splash()), (route) => false);

                  },
                  child: Container(
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                        color: colorHelper.secondry_theme_color
                    ),
                    child: Center(
                      child: Text("Update Password"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
