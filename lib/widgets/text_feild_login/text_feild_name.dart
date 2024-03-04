import 'package:apna_advocate/constant/color.dart';
import 'package:apna_advocate/constant/icons.dart';
import 'package:apna_advocate/controllers/login/login%20controller.dart';
import 'package:apna_advocate/controllers/login/login%20controller.dart';
import 'package:apna_advocate/controllers/login/login%20controller.dart';
import 'package:apna_advocate/controllers/login/login%20controller.dart';
import 'package:apna_advocate/controllers/login/login%20controller.dart';
import 'package:apna_advocate/controllers/login/login%20controller.dart';
import 'package:apna_advocate/controllers/login/login%20controller.dart';
import 'package:apna_advocate/controllers/login/login%20controller.dart';
import 'package:apna_advocate/controllers/login/login%20controller.dart';
import 'package:apna_advocate/controllers/login/login%20controller.dart';
import 'package:apna_advocate/controllers/login/login%20controller.dart';
import 'package:apna_advocate/controllers/register/register.dart';
import 'package:apna_advocate/pages/login/login.dart';
import 'package:apna_advocate/pages/register/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class text_feild_name_login extends StatefulWidget {
  const text_feild_name_login({Key? key}) : super(key: key);

  @override
  State<text_feild_name_login> createState() => _text_feild_name_loginState();
}

class _text_feild_name_loginState extends State<text_feild_name_login> {
  @override

  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          login_controller.name_feild = !login_controller.name_feild;
          login_controller.email_feild = true;
        });
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => login()));

      },
      child: Container(
        height: login_controller.name_feild ?30 : 80,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: login_controller.name_feild ?colorHelper.transparent :colorHelper.rgb[0].withOpacity(0.80),
        ),
        child: login_controller.name_feild
        ?Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Icon(iconHelper.icons[1],color: colorHelper.colors[1].withOpacity(0.60),),
                    SizedBox(width: 18,),
                    Text("${login_controller.name.text == "" ? "Enter Your Name" : login_controller.name.text}",style: TextStyle(color: colorHelper.colors[1].withOpacity(0.60)),)
                  ],
                )
              ),
            ),
          ],
        )
        :Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 8,left: 45),
                child: Text("FULL NAME",style: TextStyle(color: colorHelper.colors[1].withOpacity(0.80),fontSize: 12),),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 14,left: 12),
                child: Row(
                  children: [
                    Icon(iconHelper.icons[1],color: colorHelper.colors[1],),
                    SizedBox(width: 8,),
                    Expanded(
                        child: TextFormField(
                          controller: login_controller.name,
                          style: TextStyle(color: colorHelper.colors[1]),
                          cursorColor: colorHelper.secondry_theme_color,
                          decoration: InputDecoration.collapsed(
                              hintText: "Enter Name",
                            hintStyle: TextStyle(color: colorHelper.colors[1].withOpacity(0.60)),
                          ),

                        )
                    )
                  ],
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
