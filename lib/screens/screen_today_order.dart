import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:kiosk_shopkeeper/screens/screen_order_details.dart';
import 'package:kiosk_shopkeeper/utilities/constants.dart';
import 'package:kiosk_shopkeeper/utilities/custom_colors.dart';
import 'package:kiosk_shopkeeper/utilities/size_config.dart';

class OrderTodayScreen extends StatefulWidget {
  const OrderTodayScreen({ Key? key }) : super(key: key);

  @override
  _OrderTodayScreenState createState() => _OrderTodayScreenState();
}

class _OrderTodayScreenState extends State<OrderTodayScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.separated(
        separatorBuilder: (context, index) =>
          SizedBox(
            height:SizeConfig.convertHeight(context, 7),
          ),
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
          return TodayOrderItem(
            customerName: "Hina",
            paymentMethod: "cash",
            orderDate: "22/4/2021",
            orderId: "DC-01",
            orderStatus: false,
            total:77.01
          );
        }
      ),
    );
  }
}

class TodayOrderItem extends StatelessWidget {
  String? orderId,customerName,paymentMethod,orderDate;
  bool? orderStatus;
  double? total;
  TodayOrderItem({
    Key? key,
    this.customerName,
    this.paymentMethod,
    this.orderDate,
    this.orderId,
    this.orderStatus,
    this.total
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height:SizeConfig.convertHeight(context, 145),
        width: SizeConfig.convertWidth(context, 105),
        child: InkWell(
          splashColor: Colors.orange.shade50,
          onTap: (){
            Get.to(OrderDetailsScreen());
          },
          child: Card(
            color: white,
            elevation: 0.5,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    
                      Row(
                        children: [
                          Text(
                          orderId!
                          ),
                          SizedBox(width:5),
                          Text(
                            'Date: ${orderDate!}',
                          
                          ),
                        ]),
                        Row(
                        children: [
                          SpinKitCircle(
                            color: Colors.orange,
                            size: 40.0,
                          ),
                          SizedBox(width:5),
                          Text(
                            orderStatus!?'Completed':'pending',
                          )
                       ]),
                  ],),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Customer name',
                    textAlign: TextAlign.center,
                    style: kLogoutTextStyle,
                  ),
                  Text(
                    customerName!,
                    textAlign: TextAlign.center,
                    style: kTitleTextStyle,
                  ),
                  
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            'payment method',
                            textAlign: TextAlign.center,
                            style: kLogoutTextStyle,
                          ),
                           Text(
                            paymentMethod!,
                            textAlign: TextAlign.center,
                            style: kTitleTextStyle,
                          ),
                        ],
                      ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total',
                            textAlign: TextAlign.left,
                            style: kLogoutTextStyle,
                          ),
                           Text(
                           'SAR ${total!}',
                            textAlign: TextAlign.center,
                            style: kTitleTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}