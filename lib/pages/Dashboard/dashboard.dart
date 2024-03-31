import 'package:apna_advocate/constant/assets.dart';
import 'package:apna_advocate/constant/color.dart';
import 'package:apna_advocate/constant/icons.dart';
import 'package:apna_advocate/controllers/form/form.dart';
import 'package:apna_advocate/pages/notification/notification.dart';
import 'package:apna_advocate/pages/service%20form/service%20form.dart';
import 'package:apna_advocate/pages/splash/splash.dart';
import 'package:apna_advocate/user/user.dart';
import 'package:apna_advocate/widgets/carousel/carousel.dart';
import 'package:apna_advocate/widgets/navigator/navigation%20bar.dart';
import 'package:apna_advocate/widgets/services/affidevit.dart';
import 'package:apna_advocate/widgets/services/estamp.dart';
import 'package:apna_advocate/widgets/services/land%20details.dart';
import 'package:apna_advocate/widgets/services/mutation.dart';
import 'package:apna_advocate/widgets/services/notary%20public%20services.dart';
import 'package:apna_advocate/widgets/services/online%20rent%20payment.dart';
import 'package:apna_advocate/widgets/services/rent agreement.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/badgeIcon/badgeIcon.dart';

class dashboard extends StatelessWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 60,
                width: double.infinity,
                child: Row(
                  children: [
                    Image.asset(assets.app_logo, height: 50, width: 70, fit: BoxFit.fitHeight),
                    Text("Hi ${user.name}", style: TextStyle(color: colorHelper.colors[1])),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(assets.azadi_ka_amrit),
                      ),
                    ),
                    SizedBox(width: 18,),
                    Container(
                      width: 30,
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => notification()));
                        },
                        child: BadgeIconButton(
                          icon: Icon(iconHelper.icons[6], color: colorHelper.colors[1]),
                          badgeCount: user.notification_list.length, // Example number for badge count
                        ),
                      ),
                    ),
                    SizedBox(width: 18,)
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Carousel(),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 300,left: 15),
              child: Text("Our Services :",style: TextStyle(color: colorHelper.colors[1],fontWeight: FontWeight.bold),),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 340),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [colorHelper.theme_color_black,colorHelper.colors[5]]
                  )
                ),
                child: SingleChildScrollView(
                  child: Container(
                    height: 500,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          height : 100,
                          width: double.infinity,
                          child: Row(
                            children: [
                              SizedBox(width: 10,),
                              Expanded(child: InkWell(
                                  onTap: (){
                                    form_controller.name.text = user.name;
                                    form_controller.phone.text = user.phone;
                                    form_controller.email.text = user.email;
                                    form_controller.price = 80;
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => service_form(service: "Rent Agreement")));
                                  },
                                  child: rent_agreement_card())),
                              SizedBox(width: 10,),
                              Expanded(child: InkWell(
                                  onTap: (){
                                    form_controller.name.text = user.name;
                                    form_controller.phone.text = user.phone;
                                    form_controller.email.text = user.email;
                                    form_controller.price = 80;
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => service_form(service: "Affidevit")));
                                  },
                                  child: affidevit_card())),
                              SizedBox(width: 10,),
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(
                          height : 100,
                          width: double.infinity,
                          child: Row(
                            children: [
                              SizedBox(width: 10,),
                              Expanded(child: InkWell(
                                  onTap: (){
                                    form_controller.name.text = user.name;
                                    form_controller.phone.text = user.phone;
                                    form_controller.email.text = user.email;
                                    form_controller.price = 40;
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => service_form(service: "E-Stamp")));
                                  },
                                  child: e_stamp_card())),
                              SizedBox(width: 10,),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 70,
                width: double.infinity,
                color: colorHelper.colors[5],
                child: navigation_bar(context,true,false,false)),
          ),
        ],
      ),
    );
  }
}

