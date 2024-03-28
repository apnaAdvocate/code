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
import 'package:apna_advocate/pages/register/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/icons.dart';
import '../../controllers/register/register.dart';

class forgot_pass_feild extends StatefulWidget {
  const forgot_pass_feild({Key? key}) : super(key: key);

  @override
  State<forgot_pass_feild> createState() => _forgot_pass_feildState();
}

class _forgot_pass_feildState extends State<forgot_pass_feild> {
  @override
  FocusNode inputNode = FocusNode();
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (login_controller.email_feild == false) {
          FocusScope.of(context).requestFocus(inputNode);
        } else {
          setState(() {

            login_controller.email_feild = !login_controller.email_feild;

          });

          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) => forget_password(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          );
        }

      },
      child: Container(
        height: login_controller.email_feild ?30 : 80,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: login_controller.email_feild ?colorHelper.transparent :colorHelper.rgb[0].withOpacity(0.80),
        ),
        child: login_controller.email_feild
            ?Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      Icon(iconHelper.icons[2],color: colorHelper.colors[1].withOpacity(0.60),),
                      SizedBox(width: 18,),
                      Text("${login_controller.email.text == "" ? "Enter Your Email" : login_controller.email.text}",style: TextStyle(color: colorHelper.colors[1].withOpacity(0.60)),)
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
                child: Text("YOUR EMAIL",style: TextStyle(color: colorHelper.colors[1].withOpacity(0.80),fontSize: 12),),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: const EdgeInsets.only(top: 14,left: 12),
                  child: Row(
                    children: [
                      Icon(iconHelper.icons[2],color: colorHelper.colors[1],),
                      SizedBox(width: 8,),
                      Expanded(
                          child: TextFormField(
                            focusNode: inputNode,
                            autofocus: true,
                            controller: login_controller.email,
                            style: TextStyle(color: colorHelper.colors[1]),
                            cursorColor: colorHelper.secondry_theme_color,
                            decoration: InputDecoration.collapsed(
                              hintText: "Enter EMAIL",
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
