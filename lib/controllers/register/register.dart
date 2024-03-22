import 'dart:convert';

import 'package:apna_advocate/constant/keys.dart';
import 'package:apna_advocate/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/color.dart';
import '../../constant/icons.dart';
class register_controller{
  static TextEditingController name = new TextEditingController();
  static TextEditingController email = new TextEditingController();
  static TextEditingController password = new TextEditingController();
  static TextEditingController phone = new TextEditingController();
  static TextEditingController otp = new TextEditingController();

  static bool name_feild = true;
  static bool email_feild = true;
  static bool password_feild = true;
  static bool phone_feild = true;


  static verify_text_feild(){
    if(name.text == ""){
      Get.showSnackbar(
        GetSnackBar(
          title: "Name not Valid",
          message: 'Something went wrong. Name not Valid',
          icon: Icon(iconHelper.icons[5],color: colorHelper.colors[3],),
          duration: const Duration(seconds: 3),
        ),
      );
    }else{
      if(email.text == ""){
        Get.showSnackbar(
          GetSnackBar(
            title: "Email not Valid",
            message: 'Something went wrong. Email not Valid',
            icon: Icon(iconHelper.icons[5],color: colorHelper.colors[3],),
            duration: const Duration(seconds: 3),
          ),
        );
      }else{
        if(phone.text == ""){
          Get.showSnackbar(
            GetSnackBar(
              title: "Phone not Valid",
              message: 'Something went wrong. Phone not Valid',
              icon: Icon(iconHelper.icons[5],color: colorHelper.colors[3],),
              duration: const Duration(seconds: 3),
            ),
          );
        }else{
          if(password.text == ""){
            Get.showSnackbar(
              GetSnackBar(
                title: "Password not Valid",
                message: 'Something went wrong. Password not Valid',
                icon: Icon(iconHelper.icons[5],color: colorHelper.colors[3],),
                duration: const Duration(seconds: 3),
              ),
            );
          }else{
            return false;
          }
        }
      }
    }
  }

  static verify_user()async{
    EasyLoading.show(status: 'loading...');
    EasyLoading.showProgress(0.3, status: 'loading...');
    final Uri uri = Uri.parse("${keys.base_url}/findUser?password=${password.text}&email=${email.text.trim()}");

    try {
      final response = await http.get(uri);
      EasyLoading.showProgress(0.8, status: 'loading...');
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        EasyLoading.showProgress(0.9, status: 'loading...');
        print('Response: $jsonResponse');
        print(jsonResponse["code"]);
        EasyLoading.dismiss();
        return jsonResponse;
      } else {
        // Handle errors
        Get.showSnackbar(
          GetSnackBar(
            title: "Something Went Wrong",
            message: 'Something went wrong. User already Exist',
            icon: Icon(iconHelper.icons[5],color: colorHelper.colors[3],),
            duration: const Duration(seconds: 3),
          ),
        );
        EasyLoading.showError('Failed with Error');

        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      // Handle exceptions
      print('Exception: $error');
    }
  }
  static create_user()async{
    EasyLoading.show(status: 'loading...');
    var token = await print_token();
    print(token);
    EasyLoading.showProgress(0.3, status: 'loading...');
    final Uri uri = await Uri.parse("${keys.base_url}/createAccount?username=${name.text}&email=${email.text.trim()}&password=${password.text}&phone=${phone.text}&notification_id=${token}");
    EasyLoading.showProgress(0.5, status: 'loading...');
    try {
      final response = await http.get(uri);
      EasyLoading.showProgress(0.6, status: 'loading...');
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        print('Response: $jsonResponse');
        print(jsonResponse);
        EasyLoading.showProgress(0.9, status: 'loading...');

        if(jsonResponse["code"] == "404"){
          EasyLoading.showError("Something went Wrong");
          Get.showSnackbar(
            GetSnackBar(
              title: "Something Went Wrong",
              message: 'Something went wrong. Please Try again later',
              icon: Icon(iconHelper.icons[3],color: colorHelper.colors[1],),
              duration: const Duration(seconds: 3),
            ),
          );
        }else{
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("password", password.text);
          prefs.setString("email", email.text);
          EasyLoading.showSuccess('Account Created');
        }
        return jsonResponse;
      } else {
        // Handle errors
        Get.showSnackbar(
          GetSnackBar(
            title: "Something Went Wrong",
            message: 'Something went wrong. Please Try again later',
            icon: Icon(iconHelper.icons[3],color: colorHelper.colors[1],),
            duration: const Duration(seconds: 3),
          ),
        );
        EasyLoading.showError('Failed with Error');

        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      // Handle exceptions
      print('Exception: $error');
    }

  }

  static get_user()async{
    final Uri uri = Uri.parse("${keys.base_url}/givedetails?email=${email.text.trim()}");

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        print('Response: $jsonResponse');
        print(jsonResponse["code"]);
        print("${jsonResponse["user"]}");
        print("${jsonResponse["user"]["email"]}");
        return jsonResponse;
      } else {
        // Handle errors
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
  static send_mail()async{
    final Uri uri = Uri.parse("${keys.base_url}/verification?name=${name.text}&email=${email.text.trim()}");

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        print('Response: $jsonResponse');
        print(jsonResponse["otp"]);
        return jsonResponse;
      } else {
        // Handle errors
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

  static verify_otp(){

  }

}