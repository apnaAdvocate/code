import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:apna_advocate/constant/icons.dart';
import 'package:apna_advocate/controllers/form/form.dart';
import 'package:apna_advocate/widgets/form/price.dart';
import 'package:flutter/material.dart';

import '../../constant/color.dart';

class stamp_dropdown extends StatelessWidget {
  const stamp_dropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18,right: 18,bottom: 18),
      child: Container(
        height: 81,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "e-stamp price",
                style: TextStyle(fontSize: 10, color: colorHelper.colors[2]),
              ),
            ),
            SizedBox(height: 5),
            CustomDropdown(
              decoration: CustomDropdownDecoration(
                closedFillColor: colorHelper.transparent,
                closedBorder: Border.all(color: colorHelper.colors[2]),
                closedSuffixIcon: Icon(iconHelper.icons[15],color: colorHelper.colors[2],),
                expandedFillColor: colorHelper.colors[0],
                listItemStyle: TextStyle(color: colorHelper.colors[1]),
                headerStyle: TextStyle(color: colorHelper.colors[1],fontWeight: FontWeight.bold,letterSpacing: 0.5),
              ),
              items: ["Rs 10","Rs 50","Rs 100","Rs 200","Rs 300","Rs 500","Rs 1,000"],
              hintText: 'Select E-stamp paper price',
              onChanged: (price) {
                String cleanedPrice = price.replaceAll(RegExp(r'[^0-9]'), '');
                form_controller.stamp_price = int.parse("$cleanedPrice");
                price_state.setState(() {
                  price_state.final_price = int.parse("${form_controller.stamp_price}") + int.parse("${form_controller.price}");
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
