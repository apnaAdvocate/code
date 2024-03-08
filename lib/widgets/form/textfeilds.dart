import 'package:flutter/material.dart';

import '../../constant/color.dart';

class text_feilds extends StatefulWidget {
  const text_feilds({Key? key, required this.name, required this.controller}) : super(key: key);
final name;
final controller;
  @override
  State<text_feilds> createState() => _text_feildsState();
}

class _text_feildsState extends State<text_feilds> {
  @override
  bool pressed = false;
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18,right: 18,bottom: 18),
      child: Container(
        height: 80,
        width: double.infinity,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "${widget.name}",
                style: TextStyle(fontSize: 10, color: colorHelper.colors[2]),
              ),
            ),
            SizedBox(height: 5),
            Container(
              height: 59,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: colorHelper.colors[2])),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextFormField(
                  controller: widget.controller,
                  style: TextStyle(color: colorHelper.colors[1]),
                  cursorColor: colorHelper.secondry_theme_color,
                  decoration: InputDecoration.collapsed(
                      hintText: "Enter Your ${widget.name}",
                    hintStyle: TextStyle(color: colorHelper.colors[2])
                  ),
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
