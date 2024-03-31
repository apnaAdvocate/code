import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:apna_advocate/user/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constant/color.dart';
import '../../constant/icons.dart';
import '../../constant/keys.dart';

class form_controller {
  static File? imageFile;
  static File? aadharCard;
  static File? panCard;
  static var price ;
  static var stamp_price = 0;
  static TextEditingController name = new TextEditingController();
  static TextEditingController aadhar_no = new TextEditingController();
  static TextEditingController email = new TextEditingController();
  static TextEditingController phone = new TextEditingController();
  static TextEditingController additional_info = new TextEditingController();


  static validate_form() {
    if (aadhar_no.text.isEmpty) {
      Get.showSnackbar(
        GetSnackBar(
          title: "Something Went Wrong",
          message: 'Something went wrong. Aadhar Number not found',
          icon: Icon(
            iconHelper.icons[5],
            color: colorHelper.colors[1],
          ),
          duration: const Duration(seconds: 3),
        ),
      );
    } else {
      if (name.text.isEmpty) {
        Get.showSnackbar(
          GetSnackBar(
            title: "Something Went Wrong",
            message: 'Something went wrong. Name not found',
            icon: Icon(
              iconHelper.icons[5],
              color: colorHelper.colors[1],
            ),
            duration: const Duration(seconds: 3),
          ),
        );
      } else {
        if (email.text.isEmpty) {
          Get.showSnackbar(
            GetSnackBar(
              title: "Something Went Wrong",
              message: 'Something went wrong. Email not found',
              icon: Icon(
                iconHelper.icons[5],
                color: colorHelper.colors[1],
              ),
              duration: const Duration(seconds: 3),
            ),
          );
        } else {
          if (phone.text.isEmpty) {
            Get.showSnackbar(
              GetSnackBar(
                title: "Something Went Wrong",
                message: 'Something went wrong. Phone not found',
                icon: Icon(
                  iconHelper.icons[5],
                  color: colorHelper.colors[1],
                ),
                duration: const Duration(seconds: 3),
              ),
            );
          } else {
            if (stamp_price == 0) {
              Get.showSnackbar(
                GetSnackBar(
                  title: "Something Went Wrong",
                  message: 'Something went wrong. Stamp Price not entered',
                  icon: Icon(
                    iconHelper.icons[5],
                    color: colorHelper.colors[1],
                  ),
                  duration: const Duration(seconds: 3),
                ),
              );
            } else {
              return true;
            }
          }
        }
      }
    }
  }

  static place_order(service) async {

    Random random = Random();
    String orderId = '';

    for (int i = 0; i < 10; i++) {
      orderId += random.nextInt(10).toString();
    }

    var order = {
      "order_id": orderId,
      "service" : "$service",
      "aadhar": aadhar_no.text,
      "name": name.text,
      "email": email.text,
      "phone": phone.text,
      "additional_info": additional_info.text,
      "total_price" : "${int.parse("${form_controller.price}") + int.parse("${form_controller.stamp_price}")}",
      "progress": "0",
      "status" : "pending"
    };
   user.order.add(order);
    print(user.order);
    final Uri uri = Uri.parse(
        "${keys.base_url}/updateOrder?email=${user.email.trim()}&newOrder=${order}");
    print(uri);

    final response = await http.get(uri);

    Map<String, dynamic> jsonResponse = json.decode(response.body);
    print(jsonResponse);

    ///// stage 2
    final Uri uri2 = Uri.parse(
        "${keys.base_url}/addOrder?email=${email.text.trim()}&order_id=${orderId}&name=${name.text}");
    print(uri);

    final response2 = await http.get(uri2);

    Map<String, dynamic> jsonResponse2 = json.decode(response2.body);
    print(jsonResponse2);

  }
}
