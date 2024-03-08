import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/icons.dart';
import '../../controllers/register/register.dart';
import '../../pages/register/register.dart';

class text_feild_password extends StatefulWidget {
  const text_feild_password({Key? key}) : super(key: key);

  @override
  State<text_feild_password> createState() => _text_feild_passwordState();
}

class _text_feild_passwordState extends State<text_feild_password> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          register_controller.name_feild = true;
          register_controller.email_feild = true;
          register_controller.password_feild = !register_controller.password_feild;
          register_controller.phone_feild = true;
        });
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => register(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      },
      child: Container(
        height: register_controller.password_feild ?30 : 80,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: register_controller.password_feild ?colorHelper.transparent :colorHelper.rgb[0].withOpacity(0.80),
        ),
        child: register_controller.password_feild
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
                      Text("${register_controller.password.text == "" ? "Enter Your Password" : register_controller.password.text}",style: TextStyle(color: colorHelper.colors[1].withOpacity(0.60)),)
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
                child: Text("YOUR PASSWORD",style: TextStyle(color: colorHelper.colors[1].withOpacity(0.80),fontSize: 12),),
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
                            controller: register_controller.password,
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
            ),
          ],
        ),
      ),
    );
  }
}
