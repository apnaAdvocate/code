import 'dart:io';

import 'package:apna_advocate/constant/icons.dart';
import 'package:apna_advocate/controllers/form/form.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../constant/color.dart';

class profile_image extends StatefulWidget {
  const profile_image({Key? key}) : super(key: key);

  @override
  State<profile_image> createState() => _profile_imageState();
}

class _profile_imageState extends State<profile_image> {
  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18,right: 18,bottom: 8),
      child: Container(
        height: 250,
        width: double.infinity,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "* Your Photo",
                style: TextStyle(fontSize: 10, color: colorHelper.colors[2]),
              ),
            ),
            SizedBox(height: 5),
            InkWell(
              onTap: () async {
                final ImagePicker picker = ImagePicker();
                final XFile? image =
                await picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  setState(() {
                    form_controller.imageFile = File(image.path);
                  });
                }
              },
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: colorHelper.colors[2])),
                child: Center(
                  child: form_controller.imageFile != null
                  ? Container(
                    height: 40,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: colorHelper.colors[6].withOpacity(0.80)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(iconHelper.icons[14],color: colorHelper.colors[1],),
                        SizedBox(width: 5,),
                        Text("Uploaded",style: TextStyle(color: colorHelper.colors[1],fontWeight: FontWeight.bold),)
                      ],
                    ),
                  )
                  //     ? ClipRRect(
                  //   borderRadius: BorderRadius.all(Radius.circular(20)),
                  //   child: Image.file(
                  //     _imageFile!,
                  //     fit: BoxFit.cover,
                  //     height: 200,
                  //     width: double.infinity,
                  //   ),
                  // )
                      : Icon(
                    iconHelper.icons[13],
                    color: colorHelper.colors[2],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
