import 'package:apna_advocate/constant/icons.dart';
import 'package:apna_advocate/controllers/login/login%20controller.dart';
import 'package:apna_advocate/pages/Forget%20Password/email_form.dart';
import 'package:apna_advocate/pages/splash/splash.dart';
import 'package:apna_advocate/widgets/text_feild_login/text_feild_email.dart';
import 'package:apna_advocate/widgets/text_feild_login/text_feild_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/assets.dart';
import '../../constant/color.dart';
import '../../widgets/text_feild/text_feild_email.dart';
import '../../widgets/text_feild/text_feild_name.dart';
import '../Forget Password/forget password.dart';
import '../register/register.dart';

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 1000,
          width: double.infinity,
          child: SafeArea(
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
                      child: Text("Login",style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold,color: colorHelper.colors[1],letterSpacing: 1),),
                    )
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: Text("Please fill the input given below",style: TextStyle(fontSize: 12,color: colorHelper.colors[2]),),
                    )
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 18,right: 18,top: 40),
                  child: text_feild_password_login(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18,right: 18,top: 40),
                  child: text_feild_email_login(),
                ),

                SizedBox(height: 50,),
                InkWell(
                  onTap: ()async{
                    if(login_controller.verify_feilds() == true){
                      if(await login_controller.check_for_existing_user() == false){

                    }else{
                        await login_controller.get_user();
                        await Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => splash()), (route) => false);
                      }

                    }else{
                      Get.showSnackbar(
                        GetSnackBar(
                          title: "Something Went Wrong",
                          message: 'Something went wrong. Please fill the form correctly',
                          icon: Icon(iconHelper.icons[3],color: colorHelper.colors[1],),
                          duration: const Duration(seconds: 3),
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                        color: colorHelper.secondry_theme_color
                    ),
                    child: Center(
                      child: Text("Login"),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18,left: 8),
                      child: TextButton(onPressed: ()async{
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => forget_password()));
                      }, child: Text("Forgot your Password ?",style: TextStyle(color: colorHelper.colors[2],fontWeight: FontWeight.bold),)),
                    )
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => register()));
                  },
                  child: RichText(
                    text: new TextSpan(
                      style: new TextStyle(
                          color: colorHelper.colors[1],
                          fontSize: 16
                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'Already have an account ?',style: GoogleFonts.poppins()),
                        new TextSpan(text: '  ',style: GoogleFonts.poppins()),
                        new TextSpan(text: 'REGISTER', style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: colorHelper.secondry_theme_color,decoration: TextDecoration.underline)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
