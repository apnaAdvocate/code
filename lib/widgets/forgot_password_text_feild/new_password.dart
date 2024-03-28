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
import 'package:apna_advocate/controllers/login/login%20controller.dart';
import 'package:apna_advocate/pages/Forget%20Password/email_form.dart';
import 'package:apna_advocate/pages/Forget%20Password/newPassword.dart';
import 'package:apna_advocate/pages/register/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/icons.dart';
import '../../controllers/register/register.dart';

class new_password extends StatefulWidget {
  const new_password({Key? key}) : super(key: key);

  @override
  State<new_password> createState() => _new_passwordState();
}

class _new_passwordState extends State<new_password> {
  @override
  FocusNode inputNode = FocusNode();
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (login_controller.password_feild == false) {
          FocusScope.of(context).requestFocus(inputNode);
        } else {
          setState(() {

            login_controller.password_feild = !login_controller.password_feild;

          });

          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) => newPassword(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          );
        }

      },
      child: Container(
        height: login_controller.password_feild ?30 : 80,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: login_controller.password_feild ?colorHelper.transparent :colorHelper.rgb[0].withOpacity(0.80),
        ),
        child: login_controller.password_feild
            ?Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      Icon(iconHelper.icons[3],color: colorHelper.colors[1].withOpacity(0.60),),
                      SizedBox(width: 18,),
                      Text("${login_controller.password.text == "" ? "Enter new Password" : login_controller.password.text}",style: TextStyle(color: colorHelper.colors[1].withOpacity(0.60)),)
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
                child: Text("NEW PASSWORD",style: TextStyle(color: colorHelper.colors[1].withOpacity(0.80),fontSize: 12),),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: const EdgeInsets.only(top: 14,left: 12),
                  child: Row(
                    children: [
                      Icon(iconHelper.icons[3],color: colorHelper.colors[1],),
                      SizedBox(width: 8,),
                      Expanded(
                          child: TextFormField(
                            focusNode: inputNode,
                            autofocus: true,
                            controller: login_controller.password,
                            style: TextStyle(color: colorHelper.colors[1]),
                            cursorColor: colorHelper.secondry_theme_color,
                            decoration: InputDecoration.collapsed(
                              hintText: "Enter PASSWORD",
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
