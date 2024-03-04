import 'dart:convert';

import 'package:apna_advocate/constant/keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/color.dart';
import '../../constant/icons.dart';

class login_controller{
  static TextEditingController name = new TextEditingController();
  static TextEditingController email = new TextEditingController();

  static bool name_feild = true;
  static bool email_feild = true;


  static verify_feilds(){
    if(name.text == ""){

    }else{
      if(email.text == ""){

      }else{
        return true;
      }
    }
  }

  static check_for_existing_user()async{
    EasyLoading.show(status: 'loading...');
    EasyLoading.showProgress(0.3, status: 'loading...');
    final Uri uri = Uri.parse("${keys.base_url}/findUser?username=${name.text}&email=${email.text.trim()}");

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        print('Response: $jsonResponse');
        print(jsonResponse["code"]);
        if(jsonResponse["code"] == "404"){
          EasyLoading.showSuccess("User Exist");
          return true;
        }else{
          EasyLoading.showError("User doesn't exist");
          return false;
        }

      } else {
        // Handle errors
        EasyLoading.showError("Something Went wrong");
        Get.showSnackbar(
          GetSnackBar(
            title: "Something Went Wrong",
            message: 'Something went wrong. Please Try again later',
            icon: Icon(iconHelper.icons[3],color: colorHelper.colors[1],),
            duration: const Duration(seconds: 3),
          ),
        );

        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      // Handle exceptions
      print('Exception: $error');
    }

  }

  static get_user()async{
    EasyLoading.show(status: 'loading...');
    EasyLoading.showProgress(0.3, status: 'loading...');
    final Uri uri = Uri.parse("${keys.base_url}/givedetails?email=${email.text.trim()}");

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        print('Response: $jsonResponse');
        print(jsonResponse["code"]);
        print("${jsonResponse["user"]["email"]}");
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("name", name.text);
        prefs.setString("email", email.text);
        EasyLoading.showSuccess("User Logged In");
        EasyLoading.dismiss();
        return jsonResponse;
      } else {
        // Handle errors
        EasyLoading.showError("Something went wrong");
        Get.showSnackbar(
          GetSnackBar(
            title: "Something Went Wrong",
            message: 'Something went wrong. Please Try again later',
            icon: Icon(iconHelper.icons[5],color: colorHelper.colors[1],),
            duration: const Duration(seconds: 3),
          ),
        );

        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      // Handle exceptions
      print('Exception: $error');
    }

  }


}