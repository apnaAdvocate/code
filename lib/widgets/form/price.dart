import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../controllers/form/form.dart';

late _priceState price_state;
class price extends StatefulWidget {
  price({Key? key, required this.service}) : super(key: key);
final service ;
  @override
  State<price> createState() {
    price_state = _priceState();
    return price_state;
  }
}

class _priceState extends State<price> {
  @override
  var final_price = int.parse("${form_controller.price}");
  bool clicked = false;
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        children: [
          Container(
            height: 70,
            width: 120,
            child: Column(
              children: [
                Text("₹${int.parse("${form_controller.price}") + int.parse("${form_controller.stamp_price}")}",style: TextStyle(color: colorHelper.colors[1],fontSize: 24,fontWeight: FontWeight.bold),),
                Text("COD",style: TextStyle(color: colorHelper.secondry_theme_color,fontWeight: FontWeight.bold),)
              ],
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: ()async{

                var res = form_controller.validate_form();
                if(res == true){
                  setState(() {
                    clicked = true;
                  });
                  await form_controller.place_order(widget.service);
                  CoolAlert.show(
                      context: context,
                      type: CoolAlertType.success,
                      text: "Service booked. Go to Track Order to track your order",
                      confirmBtnText: "Ok"
                  );
                  setState(() {
                    clicked = false;
                  });
                }else{

                }
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: colorHelper.secondry_theme_color
                ),
                child: Center(
                  child: clicked
                  ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(color: colorHelper.colors[0],),
                  )
                      : Text("Book My Service")
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
