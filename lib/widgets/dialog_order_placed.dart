import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kiosk_shopkeeper/utilities/constants.dart';
import 'package:kiosk_shopkeeper/utilities/custom_colors.dart';
import 'package:kiosk_shopkeeper/utilities/size_config.dart';

class OrderPlacedDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Container(
        height: 110,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Container(
              alignment: Alignment.center,
              height: SizeConfig.convertHeight(context, 30),
              child: Image.asset(
                "assets/images/Successful.png",
                height: SizeConfig.convertHeight(context, 70),
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'Your Order has been placed',
              style: kTitleTextStyle,
            ),
            Text(
              'Please collect your items from counter',
              style: ksubtitleTextStyle,
            )
             
          ],
          
        ),
      ),
    );
  }
}

Future<dynamic> orderPlacedDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          backgroundColor: white,
          insetPadding: EdgeInsets.symmetric(horizontal: 34),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(70),
          ),
          child: OrderPlacedDialog(),
        );
      });
}
