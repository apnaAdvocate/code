import 'package:apna_advocate/constant/color.dart';
import 'package:apna_advocate/constant/icons.dart';
import 'package:apna_advocate/controllers/register/register.dart';
import 'package:apna_advocate/pages/register/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class text_feild_name extends StatefulWidget {
  const text_feild_name({Key? key}) : super(key: key);

  @override
  State<text_feild_name> createState() => _text_feild_nameState();
}

class _text_feild_nameState extends State<text_feild_name> {
  @override

  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          register_controller.name_feild = !register_controller.name_feild;
          register_controller.email_feild = true;
          register_controller.password_feild = true;
          register_controller.phone_feild = true;
        });
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => register()));

      },
      child: Container(
        height: register_controller.name_feild ?30 : 80,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: register_controller.name_feild ?colorHelper.transparent :colorHelper.rgb[0].withOpacity(0.80),
        ),
        child: register_controller.name_feild
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
                    Text("${register_controller.name.text == "" ? "Enter Your Name" : register_controller.name.text}",style: TextStyle(color: colorHelper.colors[1].withOpacity(0.60)),)
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
                          controller: register_controller.name,
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
