import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../constant/color.dart';
import '../../constant/icons.dart';
import '../../controllers/form/form.dart';

class pan_card extends StatefulWidget {
  const pan_card({Key? key}) : super(key: key);

  @override
  State<pan_card> createState() => _pan_cardState();
}

class _pan_cardState extends State<pan_card> {
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
                "* Pan Card Photo",
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
                    form_controller.panCard = File(image.path);
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
