import 'package:apna_advocate/pages/splash/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:pinput/pinput.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/assets.dart';
import '../../constant/color.dart';
import '../../constant/icons.dart';
import '../../controllers/register/register.dart';



final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: TextStyle(fontSize: 20, color: colorHelper.colors[1], fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(color: colorHelper.colors[2]),
    borderRadius: BorderRadius.circular(20),
  ),
);
class phone_verification extends StatelessWidget {
  phone_verification({Key? key, required this.otp, this.phone}) : super(key: key);
final otp;
final phone;
  @override


final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: colorHelper.rgb[2]),
  borderRadius: BorderRadius.circular(8),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration?.copyWith(
    color: colorHelper.colors[0],
  ),
);

  Widget build(BuildContext context) {
    print("OTP $otp");
    print("Phone $phone");

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100,),
          Center(child: Image.asset(assets.phone_verification,height: 200,width: 200,fit: BoxFit.fitHeight,),),
          Text("Verify your Phone Number",style: TextStyle(fontSize: 20,color: colorHelper.colors[2],fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Text("Please enter the 6-digit code sent to",style : TextStyle(color: colorHelper.colors[1],fontSize: 16)),
          SizedBox(height: 10,),
          Text("$phone",style : TextStyle(color: colorHelper.secondry_theme_color,fontSize: 16)),
          SizedBox(height: 50,),
           Pinput(
             controller: register_controller.otp,
             length: 6,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            submittedPinTheme: submittedPinTheme,
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            showCursor: true,
            onCompleted: (pin) => print(pin),
             onSubmitted: (code) => {

             },
          ),
          Expanded(child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: InkWell(
                onTap: () async{
                  EasyLoading.show(status: 'loading...');
                  EasyLoading.showProgress(0.6, status: 'loading...');
                  try{
                    FirebaseAuth auth = FirebaseAuth.instance;
                    PhoneAuthCredential credential = PhoneAuthProvider.credential(
                        verificationId: otp,
                        smsCode:
                        "${register_controller.otp.text[0]}${register_controller.otp.text[1]}${register_controller.otp.text[2]}${register_controller.otp.text[3]}${register_controller.otp.text[4]}${register_controller.otp.text[5]}");


                    await auth.signInWithCredential(credential);
                    Get.showSnackbar(
                      GetSnackBar(
                        title: "Verifying. Please Wait",
                        message: 'Verifying Please Wait few moments',
                        duration: const Duration(seconds: 3),
                      ),
                    );
                    EasyLoading.showSuccess("OTP Verified");
                    await register_controller.verify_user();
                    await register_controller.create_user();
                    await Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => splash()), (route) => false);
                  }catch(e){
                    Get.showSnackbar(
                      GetSnackBar(
                        title: "Wrong OTP",
                        message: 'Wrong OTP. Please enter correct OTP to continue',
                        duration: const Duration(seconds: 3),
                      ),

                    );
                    EasyLoading.showError("Wrong OTP");
                  }


                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: colorHelper.secondry_theme_color
                  ),
                  child: Center(
                    child: Text("Complete Sign Up Process",style: TextStyle(color: colorHelper.colors[0]),),
                  ),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}


