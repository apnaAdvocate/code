import 'dart:math';
import 'dart:ui';

import 'package:apna_advocate/constant/assets.dart';
import 'package:apna_advocate/constant/color.dart';
import 'package:apna_advocate/constant/icons.dart';
import 'package:apna_advocate/controllers/register/register.dart';
import 'package:apna_advocate/pages/login/login.dart';
import 'package:apna_advocate/pages/verification/phone_verification.dart';
import 'package:apna_advocate/widgets/text_feild/text_feild_name.dart';
import 'package:apna_advocate/widgets/text_feild/text_feild_password.dart';
import 'package:apna_advocate/widgets/text_feild/text_feild_phone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/text_feild/text_feild_email.dart';

class register extends StatelessWidget {
  const register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height.toDouble(),
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
                  padding: const EdgeInsets.only(left: 30,right: 30,top: 30),
                  child: Image.asset(assets.logo_transparent,height: 100,width: double.infinity,fit: BoxFit.fitWidth,),
                ),
                SizedBox(height: 40,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Text("Create Account",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: colorHelper.colors[1],letterSpacing: 1),),
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
                  child: text_feild_name(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18,right: 18,top: 40),
                  child: text_feild_email(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18,right: 18,top: 40),
                  child: text_feild_phone(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18,right: 18,top: 40),
                  child: text_feild_password(),
                ),
                SizedBox(height: 50,),
                InkWell(
                  onTap: ()async{

                    if(register_controller.verify_text_feild() == false){
                      EasyLoading.show(status: 'loading...');
                      EasyLoading.showProgress(0.6, status: 'loading...');
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: '+91${register_controller.phone.text}',
                        verificationCompleted: (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException e) {
                          EasyLoading.showError("Pleasy enter another number");
                        },
                        codeSent: (String verificationId, int? resendToken) {
                          EasyLoading.showSuccess("OTP Sent !");
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => phone_verification(otp: verificationId,phone: "+91 ${register_controller.phone.text}",)));
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                    }else{

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
                      child: Text("Register"),
                    ),
                  ),
                ),
      Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => login()));
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
                      new TextSpan(text: 'LOGIN', style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: colorHelper.secondry_theme_color,decoration: TextDecoration.underline)),
                    ],
                  ),
                ),
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
