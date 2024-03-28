import 'package:apna_advocate/constant/color.dart';
import 'package:apna_advocate/controllers/form/form.dart';
import 'package:apna_advocate/widgets/form/aadhar%20card.dart';
import 'package:apna_advocate/widgets/form/dropdown.dart';
import 'package:apna_advocate/widgets/form/pan%20card.dart';
import 'package:apna_advocate/widgets/form/price.dart';
import 'package:apna_advocate/widgets/form/profile%20image.dart';
import 'package:apna_advocate/widgets/form/textfeilds.dart';
import 'package:apna_advocate/widgets/text_feild/text_feild_email.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

import '../../constant/icons.dart';
import '../Dashboard/dashboard.dart';

class service_form extends StatelessWidget {
  service_form({Key? key, required this.service}) : super(key: key);
final service ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: IconButton(onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => dashboard()));
                      }, icon: Icon(iconHelper.icons[0],color: colorHelper.colors[1],))
                  )
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Text("$service",style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold,color: colorHelper.colors[1],letterSpacing: 1),),
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Please fill the details carefully",style: TextStyle(fontSize: 14,color: colorHelper.colors[2]),),
                ),
              ),
              SizedBox(height: 20,),
              // profile_image(),
              // aadhar_card(),
              // pan_card(),
              text_feilds(name: "* Your Name", controller: form_controller.name),
              text_feilds(name: "* Aadhar Number", controller: form_controller.aadhar_no),
              stamp_dropdown(),
              text_feilds(name: "* Your Email", controller: form_controller.email),
              text_feilds(name: "* Your Phone", controller: form_controller.phone),
              text_feilds(name: "Any Additional Info", controller: form_controller.additional_info),
              Padding(
                padding: const EdgeInsets.only(left: 12,right: 12,bottom: 18),
                child: price(service: service,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
