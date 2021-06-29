import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiosk_shopkeeper/utilities/constants.dart';
import 'package:kiosk_shopkeeper/utilities/custom_colors.dart';
import 'package:kiosk_shopkeeper/utilities/size_config.dart';
class BottomNavigationOrder extends StatefulWidget {
  const BottomNavigationOrder({ Key? key }) : super(key: key);

  @override
  _BottomNavigationOrderState createState() => _BottomNavigationOrderState();
}

class _BottomNavigationOrderState extends State<BottomNavigationOrder> {
  List imageUrl=[
    
    "assets/images/Orders-icon",
    "assets/images/Products-icon",
    "assets/images/Requisition-icon",
    "assets/images/Reports-icon",
    "assets/images/Reports-icon"
    ];
  List titleText=["Orders","Products","Requisition","Reports","Settings"];
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: whitish,
      shape: CircularNotchedRectangle(),
      notchMargin: 3.0,
      child: Container(
        height: SizeConfig.convertHeight(context, 56),
        child: ListView.separated(
          separatorBuilder: (context, index) =>
            SizedBox(
              width:SizeConfig.convertWidth(context, 10),
            ),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
            itemBuilder: (context, index){
                return Container(
                  padding: EdgeInsets.only(left:10,right: 10,top:10),
                  child: NavigationItem(
                    imageUrl:'${imageUrl[index]}.png',
                    title: titleText[index].toString(),
                    ),
                );
            },
        ),
      ),
    );   
  }
}

class NavigationItem extends StatelessWidget {
  String? imageUrl;
  String? title;
  NavigationItem({ Key? key,this.imageUrl,this.title });
  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      Image.asset(
        imageUrl!.toString(),
        height: SizeConfig.convertHeight(context, 25),
        fit: BoxFit.cover,
      ),
      Text(
        title!,
        textAlign: TextAlign.center,
        style: kLogoutTextStyle,
      ),
    ],
  );
  }
}