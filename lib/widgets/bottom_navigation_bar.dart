import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiosk_shopkeeper/utilities/constants.dart';
import 'package:kiosk_shopkeeper/utilities/custom_colors.dart';
import 'package:kiosk_shopkeeper/utilities/size_config.dart';

class BottomNavigation extends StatefulWidget {

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}
class _BottomNavigationState extends State<BottomNavigation> {
  

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: whitish,
        shape: CircularNotchedRectangle(),
        notchMargin: 3.0,
        child: Container(
          height: SizeConfig.convertHeight(context, 46),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
             Column(
               children: [
                 Image.asset(
                   "assets/images/Home-icon.png",
                   height: SizeConfig.convertHeight(context, 25),
                   fit: BoxFit.cover,
                 ),
                 Text(
                    'Home',
                    textAlign: TextAlign.center,
                    style: kLogoutTextStyle,
                  ),
               ],
             ),
              Column(
                children: [
                  Image.asset(
                   "assets/images/ProductsGray-icon.png",
                   height: SizeConfig.convertHeight(context, 25),
                   fit: BoxFit.cover,
                  ),
                  Text(
                    'Products',
                    textAlign: TextAlign.center,
                    style: kLogoutTextStyle,
                  ),
                ],
              ),
             Column(
              children: [
                CircleAvatar(
                  backgroundColor: maroonColor,
                  radius: 20,
                  child: Image.asset(
                    "assets/images/Cart-icon.png",
                    height: SizeConfig.convertHeight(context, 25),
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                   'Cart',
                   textAlign: TextAlign.center,
                   style: kLogoutTextStyle,
                 ),
              ],
               ),
              
              ],
            ),
          ),
    );   
  }
}



