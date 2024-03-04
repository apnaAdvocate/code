import 'dart:convert';

import 'package:apna_advocate/constant/keys.dart';
import 'package:apna_advocate/main.dart';
import 'package:apna_advocate/user/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../pages/Dashboard/dashboard.dart';
import '../../pages/register/register.dart';

class engine_controller {
  static var name;

  static var email;

  static collect_details() async {
    String decodedName = Uri.decodeComponent(name.trim());
    String decodedEmail = Uri.decodeComponent(email.trim());

    final Uri uri = Uri.parse(
        "${keys.base_url}/givedetails?username=$decodedName&email=$decodedEmail");

    try {
      final response = await http.get(uri);
      Map<String, dynamic> jsonResponse = json.decode(response.body);

      // Extracting data from the response
      String username = jsonResponse["user"]["username"];
      String userEmail = jsonResponse["user"]["email"];
      String userPhone = jsonResponse["user"]["phone"];
      String userPassword = jsonResponse["user"]["password"];
      List userNotification = jsonResponse["user"]["notification"];
      String notification_id = jsonResponse["user"]["notification_id"];
      // Assuming 'user' is an object where you want to store these details
      user.name = username;
      user.email = userEmail;
      user.phone = userPhone;
      user.password = userPassword;
      user.notification_list = userNotification;
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
    name = await prefs.getString("name");
    email = await prefs.getString("email");

    if (await name == null) {
      return false;
    } else {
      print("SharedPrefs has value");
      final Uri uri = Uri.parse(
          "${keys.base_url}/findUser?username=${name}&email=${email}");
      try {
        final response = await http.get(uri);
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        print('Response: $jsonResponse');
        print(jsonResponse["code"]);
        if (jsonResponse["code"] == "404") {
          return true;
        } else {
          prefs.remove("name");
          prefs.remove("email");
          return false;
        }
      } catch (e) {}
    }
  }

  static navigator(context) async {
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
}
