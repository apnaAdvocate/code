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
  static TextEditingController password = new TextEditingController();
  static TextEditingController email = new TextEditingController();
  static TextEditingController otp = new TextEditingController();


  static bool password_feild = true;
  static bool email_feild = true;
  static var verification_email ;


  static verify_feilds(){
    if(password.text == ""){

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
    final Uri uri = Uri.parse("${keys.base_url}/findUser?password=${password.text}&email=${email.text.trim()}");

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
        prefs.setString("password", jsonResponse["user"]["password"]);
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


  static search_user()async{

    final Uri uri = Uri.parse("${keys.base_url}/givedetails?email=${email.text.trim()}");
    print(uri);
    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        print('Response: $jsonResponse');
        print(jsonResponse["code"]);
        print("${jsonResponse["user"]["email"]}");

        return jsonResponse;
      } else {
        // Handle errors

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

  static send_email_verification(name)async{

    final Uri uri = Uri.parse("${keys.base_url}/verification?email=${email.text.trim()}&name=${name}");

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        print('Response: $jsonResponse');
        print(jsonResponse["otp"]);
        return jsonResponse;

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
  static change_pass()async{
    EasyLoading.show(status: "Changing Password");
    EasyLoading.showProgress(0.3 ,status: "Changing Password");
    final Uri uri = Uri.parse("${keys.base_url}/updatePassword?email=${email.text.trim()}&newPassword=${password.text}");
    print(uri);
    EasyLoading.showProgress(0.6 ,status: "Changing Password");
    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        EasyLoading.showProgress(0.8 ,status: "Changing Password");
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        print('Response: $jsonResponse');
        print(jsonResponse["code"]);
        print("${jsonResponse["status"]}");
        EasyLoading.showSuccess("Password Changed");
        return jsonResponse;
      } else {
        // Handle errors
        EasyLoading.dismiss();
        Get.showSnackbar(
          GetSnackBar(
            title: "Something Went Wrong",
            message: 'Something went wrong. Please Try again later',
            icon: Icon(iconHelper.icons[5],color: colorHelper.colors[1],),
            duration: const Duration(seconds: 3),
          ),
        );
        EasyLoading.showError("Something went wrong");
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      // Handle exceptions
      EasyLoading.showError("Something went wrong");
      print('Exception: $error');
    }

  }




}