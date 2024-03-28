import 'package:apna_advocate/widgets/stepper/stepper.dart';
import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import '../../constant/assets.dart';
import '../../constant/color.dart';
import '../../constant/icons.dart';
import '../../user/user.dart';
import '../../widgets/badgeIcon/badgeIcon.dart';
import '../../widgets/carousel/carousel.dart';
import '../../widgets/navigator/navigation bar.dart';
import '../notification/notification.dart';

class track_order extends StatelessWidget {
  track_order({Key? key}) : super(key: key);

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
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 450,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                        itemCount: user.order.length,
                        shrinkWrap: true,
                        itemBuilder:
                        (context,index){
                          print("Users ORder : ${user.order[index]["service"]}");
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 180,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: colorHelper.colors[0],
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Column(
                            children: [
                              Align(
                                  alignment : Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text("${user.order[index]["service"]}",style: TextStyle(color: colorHelper.colors[1],fontWeight: FontWeight.bold,fontSize: 18),),
                                        SizedBox(width: 8,),
                                        Text("order id : ${user.order[index]["order_id"]}",style: TextStyle(color: colorHelper.colors[1]),)
                                      ],
                                    ),
                                  )),
                              stepper(step: int.parse("${user.order[index]["progress"]}"),),
                              TextButton(onPressed: ()async{
                                const number = '8409037655'; //set the number here
                                bool? res = await FlutterPhoneDirectCaller.callNumber(number);
                              }, child: Text("need help ? call us"))
                            ],
                          ),
                        ),
                      );
                    }),
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
