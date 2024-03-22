import 'package:apna_advocate/constant/assets.dart';
import 'package:apna_advocate/constant/color.dart';
import 'package:apna_advocate/controllers/login/login%20controller.dart';
import 'package:apna_advocate/pages/Forget%20Password/otp_page.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class loading extends StatelessWidget {
  const loading({Key? key}) : super(key: key);

  @override

  load_user_send_verification(context) async{
    var user = await login_controller.search_user();
    if(await user["code"] == "404"){
      print("USER : ${user}");
      CoolAlert.show(context: context,
          type: CoolAlertType.error,
          title: "User Does not Exist",
          onConfirmBtnTap: (){
            Navigator.pop(context);
          }
      );
    }else{
      var otp = await login_controller.send_email_verification(user["user"]["username"]);
      await Navigator.of(context).push(MaterialPageRoute(builder: (context) => update_acc_verification(otp: otp["otp"], email: user["user"]["email"])));

    }
  }

  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4),(){
      load_user_send_verification(context);
    });
    return Scaffold(
      backgroundColor: colorHelper.rgb[15],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(assets.loading,height: 200,width: 200,fit: BoxFit.fill,),
            SizedBox(height: 20,),
            Text("We are searching you in our Database",style: TextStyle(color: colorHelper.colors[1],fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
