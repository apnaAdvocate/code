import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constant/color.dart';
import '../../constant/icons.dart';

class form_controller{

  static File? imageFile;
  static File? aadharCard;
  static File? panCard;
  static TextEditingController name = new TextEditingController();
  static TextEditingController email = new TextEditingController();
  static TextEditingController phone = new TextEditingController();
  static TextEditingController additional_info = new TextEditingController();

  static validate_form(){
    if(imageFile == null){
      Get.showSnackbar(
        GetSnackBar(
          title: "Something Went Wrong",
          message: 'Something went wrong. Image not found',
          icon: Icon(iconHelper.icons[5],color: colorHelper.colors[1],),
          duration: const Duration(seconds: 3),
        ),
      );
    }else{
      if(aadharCard == null){
        Get.showSnackbar(
          GetSnackBar(
            title: "Something Went Wrong",
            message: 'Something went wrong. Aadhar not found',
            icon: Icon(iconHelper.icons[5],color: colorHelper.colors[1],),
            duration: const Duration(seconds: 3),
          ),
        );
      }else{
        if(panCard == null){
          Get.showSnackbar(
            GetSnackBar(
              title: "Something Went Wrong",
              message: 'Something went wrong. Pan Card not found',
              icon: Icon(iconHelper.icons[5],color: colorHelper.colors[1],),
              duration: const Duration(seconds: 3),
            ),
          );
        }else{
          if(name.text == null){
            Get.showSnackbar(
              GetSnackBar(
                title: "Something Went Wrong",
                message: 'Something went wrong. Name not found',
                icon: Icon(iconHelper.icons[5],color: colorHelper.colors[1],),
                duration: const Duration(seconds: 3),
              ),
            );
          }else{
            if(email.text == null){
              Get.showSnackbar(
                GetSnackBar(
                  title: "Something Went Wrong",
                  message: 'Something went wrong. Email not found',
                  icon: Icon(iconHelper.icons[5],color: colorHelper.colors[1],),
                  duration: const Duration(seconds: 3),
                ),
              );
            }else{
              if(phone.text == null){
                Get.showSnackbar(
                  GetSnackBar(
                    title: "Something Went Wrong",
                    message: 'Something went wrong. Phone not found',
                    icon: Icon(iconHelper.icons[5],color: colorHelper.colors[1],),
                    duration: const Duration(seconds: 3),
                  ),
                );
              }else{
                return true;
              }
            }
          }
        }
      }
    }
  }

}