import 'package:apna_advocate/constant/assets.dart';
import 'package:apna_advocate/pages/Dashboard/dashboard.dart';
import 'package:apna_advocate/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant/color.dart';
import '../../constant/icons.dart';
import '../../widgets/navigator/navigation bar.dart';
import '../splash/splash.dart';

class account extends StatelessWidget {
  const account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Container(
                  height: 800,
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
                            child: Text("My Profile",style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold,color: colorHelper.colors[1],letterSpacing: 1),),
                          )
                      ),
                      SizedBox(height: 30,),
                      Container(
                        height: 70,
                        child: Row(
                          children: [
                            SizedBox(width: 18,),
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(80)),
                                border: Border.all(color: colorHelper.colors[4])
                              ),
                              child: Padding(
                                  padding: EdgeInsets.all(4),
                                child: Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(80))
                                  ),
                                  child: Image.asset(assets.avatar),
                                ),
                              )
                            ),
                            SizedBox(width: 12,),
                            Container(
                              height: double.infinity,
                              width: 300,
                              child: Column(
                                children: [
                                  SizedBox(height: 5,),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text("${user.name}",style: TextStyle(color: colorHelper.colors[1],fontSize :16),),
                                  ),
                                  Expanded(child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Row(
                                      children: [
                                        Icon(iconHelper.icons[4],color: colorHelper.colors[2],size: 20,),
                                        SizedBox(width: 3,),
                                        Text("+91 ${user.phone}",style: TextStyle(color: colorHelper.colors[2],fontSize: 12)),
                                        SizedBox(width: 8,),
                                        Icon(iconHelper.icons[2],color: colorHelper.colors[2],size: 20,),
                                        SizedBox(width: 3,),
                                        Expanded(
                                          child: Container(
                                              width: double.infinity,
                                              child: Text("${user.email}",style: TextStyle(color: colorHelper.colors[2],fontSize: 12),overflow: TextOverflow.ellipsis,)),
                                        )

                                      ],
                                    ),
                                  )),
                                  SizedBox(height: 10,)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          height: 190,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            color: colorHelper.colors[1]
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 20,),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Row(
                                  children: [
                                    TextButton(onPressed: () async{
                                      const url = "https://www.freeprivacypolicy.com/live/3905f1ca-4f54-4cbc-8004-3ec58a0f4aec";
                                      if (await launchUrl(Uri.parse(url))){
                                      await launchUrl(Uri.parse(url));
                                      } else {
                                      // can't launch url
                                      }
                                    }, child: Text("Terms & Conditions",style: TextStyle(color: colorHelper.colors[0],fontWeight: FontWeight.w500,fontSize: 20),)),
                                    Expanded(child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Icon(iconHelper.icons[7],color: colorHelper.colors[0],),
                                    ))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18,right: 18,bottom: 18),
                                child: Row(
                                  children: [
                                    TextButton(onPressed: ()async{
                                      const number = '8409037655'; //set the number here
                                      bool? res = await FlutterPhoneDirectCaller.callNumber(number);

                                    }, child: Text("Help & Support",style: TextStyle(color: colorHelper.colors[0],fontWeight: FontWeight.w500,fontSize: 20),)),
                                    Expanded(child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Icon(iconHelper.icons[7],color: colorHelper.colors[0],),
                                    ))
                                  ],
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(left: 18,right: 18,bottom: 18),
                              //   child: Row(
                              //     children: [
                              //       TextButton(onPressed: (){
                              //
                              //       }, child: Text("Share the app",style: TextStyle(color: colorHelper.colors[0],fontWeight: FontWeight.w500,fontSize: 20),)),
                              //       Expanded(child: Align(
                              //         alignment: Alignment.centerRight,
                              //         child: Icon(iconHelper.icons[7],color: colorHelper.colors[0],),
                              //       ))
                              //     ],
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.only(left: 18,right: 18,bottom: 18),
                              //   child: Row(
                              //     children: [
                              //       TextButton(onPressed: (){}, child: Text("Notification Preference",style: TextStyle(color: colorHelper.colors[0],fontWeight: FontWeight.w500,fontSize: 20),)),
                              //       Expanded(child: Align(
                              //         alignment: Alignment.centerRight,
                              //         child: Icon(iconHelper.icons[7],color: colorHelper.colors[0],),
                              //       ))
                              //     ],
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: InkWell(
                          onTap: () async{
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.remove("name");
                            prefs.remove("email");
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => splash()), (route) => false);

                          },
                          child: Container(
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(40)),
                              color: colorHelper.colors[1]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Row(
                                children: [
                                  TextButton(onPressed: ()async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.remove("name");
                                    prefs.remove("email");
                                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => splash()), (route) => false);

                                  }, child: Text("Logout",style: TextStyle(color: colorHelper.colors[0],fontWeight: FontWeight.w500,fontSize: 20),)),
                                  Expanded(child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(iconHelper.icons[7],color: colorHelper.colors[0],),
                                  ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(18.0),
                      //   child: InkWell(
                      //     onTap: (){
                      //
                      //     },
                      //     child: Container(
                      //       height: 80,
                      //       width: double.infinity,
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.all(Radius.circular(40)),
                      //           color: colorHelper.colors[1]
                      //       ),
                      //       child: Padding(
                      //         padding: const EdgeInsets.all(18.0),
                      //         child: Row(
                      //           children: [
                      //             TextButton(onPressed: (){}, child: Text("Delete Account",style: TextStyle(color: colorHelper.colors[0],fontWeight: FontWeight.w500,fontSize: 20),)),
                      //             Expanded(child: Align(
                      //               alignment: Alignment.centerRight,
                      //               child: Icon(iconHelper.icons[7],color: colorHelper.colors[0],),
                      //             ))
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),

                    ],
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
                  child: navigation_bar(context,false,true,false)),
            ),
          ],
        ),
      ),
    );
  }

  
}
