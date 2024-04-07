import 'dart:convert';

import 'package:apna_advocate/constant/keys.dart';
import 'package:apna_advocate/main.dart';
import 'package:apna_advocate/pages/UPDATE/update.dart';
import 'package:apna_advocate/user/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../pages/Dashboard/dashboard.dart';
import '../../pages/register/register.dart';

class engine_controller {
  static var password;

  static var email;

  static check_for_update(context) async {
    final Uri uri = Uri.parse(
        "${keys.base_url}/version");
    print(uri);
    final response = await http.get(uri);
    var jsonResponse = json.decode(response.body);
    print(jsonResponse[0]["version"]);
    if(jsonResponse[0]["version"] == "${keys.version}"){
      return true;
    }else{
      return false ;
    }
  }

  static collect_details() async {
    String decodedEmail = Uri.decodeComponent(email.trim());

    final Uri uri = Uri.parse(
        "${keys.base_url}/givedetails?email=$decodedEmail");

    try {
      final response = await http.get(uri);
      Map<String, dynamic> jsonResponse = json.decode(response.body);

      // Extracting data from the response
      String username = jsonResponse["user"]["username"];
      String userEmail = jsonResponse["user"]["email"];
      String userPhone = jsonResponse["user"]["phone"];
      String userPassword = jsonResponse["user"]["password"];
      List userNotification = jsonResponse["user"]["notification"];
      List orders = jsonResponse["user"]["orders"];
      List<Map<String, dynamic>> orderList = [];
      orders.forEach((orderString) {
        Map<String, dynamic> orderMap = parseOrderString(orderString);
        orderList.add(orderMap);
      });
      String notification_id = jsonResponse["user"]["notification_id"];
      user.name = username;
      user.email = userEmail;
      user.phone = userPhone;
      user.password = userPassword;
      user.notification_list = userNotification;
      user.order = orderList;
      print(user.order);
      var notification_id_firebase = await print_token();
      if (notification_id == notification_id_firebase) {
      } else {
        update_notification_id(notification_id_firebase);
      }

      return jsonResponse;
    } catch (error) {
      print(error);
      return null; // or handle the error appropriately
    }
  }

  static check_user_existence() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    password = await prefs.getString("password");
    email = await prefs.getString("email");

    if (await email == null) {
      return false;
    } else {
      print("SharedPrefs has value");
      final Uri uri = Uri.parse(
          "${keys.base_url}/findUser?password=${password}&email=${email.trim()}");
      print(uri);
      try {
        final response = await http.get(uri);

        Map<String, dynamic> jsonResponse = json.decode(response.body);
        print('Response: $jsonResponse');
        print(jsonResponse["code"]);
        if (jsonResponse["code"] == "404") {
          return true;
        } else {
          prefs.remove("password");
          prefs.remove("email");
          return false;
        }
      } catch (e) {}
    }
  }

  static navigator(context) async {
    var result = await check_for_update(context);
    if(result == true){
      var value = await check_user_existence();
      print("Value : $value");
      if (value == true) {
        var res = await collect_details();
        print("Collecting Details");
        print(res);
        if (res != null) {
          await Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => dashboard()),
                  (route) => false);
        }
      } else {
        Future.delayed(Duration(seconds: 3), () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => register()),
                  (route) => false);
        });
      }
    }else{
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => update_app()), (route) => false);

    }
  }

  static update_notification_id(id) async{
    final Uri uri = Uri.parse(
        "${keys.base_url}/updateId?newId=${id}&email=${email}");
    print(uri);
    try {
      final response = await http.get(uri);
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      print('Response: $jsonResponse');
      print(jsonResponse["code"]);
      if (jsonResponse["code"] == "200") {
        return true;
      } else {
        return false;
      }
    } catch (e) {}
  }

  static Map<String, dynamic> parseOrderString(String? orderString) {
    if (orderString == null) {
      // Handle the case where orderString is null, possibly by returning an empty map or throwing an error
      return {};
    }
    Map<String, dynamic> orderMap = {};
    RegExp regExp = RegExp(r'([a-zA-Z_]+): ([\w@. -]+)');
    regExp.allMatches(orderString).forEach((match) {
      orderMap[match.group(1)!] = match.group(2)!; // Use the ! operator to assert that the groups are not null
    });
    return orderMap;
  }


}
