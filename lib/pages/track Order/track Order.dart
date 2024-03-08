import 'package:flutter/material.dart';

import '../../constant/assets.dart';
import '../../constant/color.dart';
import '../../constant/icons.dart';
import '../../user/user.dart';
import '../../widgets/badgeIcon/badgeIcon.dart';
import '../../widgets/carousel/carousel.dart';
import '../../widgets/navigator/navigation bar.dart';
import '../notification/notification.dart';

class track_order extends StatelessWidget {
  const track_order({Key? key}) : super(key: key);

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
              child: Text("Your Orders :",style: TextStyle(color: colorHelper.colors[1],fontWeight: FontWeight.bold),),
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
                  child: Column(
                    children: [

                    ],
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
                child: navigation_bar(context,false,false,true)),
          ),
        ],
      ),
    );
  }
}
