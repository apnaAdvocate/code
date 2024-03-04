import 'package:apna_advocate/constant/assets.dart';
import 'package:apna_advocate/constant/color.dart';
import 'package:apna_advocate/constant/icons.dart';
import 'package:apna_advocate/pages/notification/notification.dart';
import 'package:apna_advocate/pages/splash/splash.dart';
import 'package:apna_advocate/user/user.dart';
import 'package:apna_advocate/widgets/carousel/carousel.dart';
import 'package:apna_advocate/widgets/navigator/navigation%20bar.dart';
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

          navigation_bar(context),
        ],
      ),
    );
  }
}

