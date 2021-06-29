import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiosk_shopkeeper/screens/screen_order_details.dart';
import 'package:kiosk_shopkeeper/utilities/constants.dart';
import 'package:kiosk_shopkeeper/utilities/custom_colors.dart';
import 'package:kiosk_shopkeeper/utilities/size_config.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({ Key? key }) : super(key: key);

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
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) {
          return OrderHistoryItem(
            customerName: "Hina",
            paymentMethod: "cash",
            orderDate: "22/4/2021",
            orderId: "DC-01",
            orderStatus: true,
            total:77.01
          );
        }
      ),
    );
  }
}

class OrderHistoryItem extends StatelessWidget {
  String? orderId,customerName,paymentMethod,orderDate;
  bool? orderStatus;
  double? total;
  OrderHistoryItem({
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
    return InkWell(
      onTap: (){
        Get.to(OrderDetailsScreen());
      },
      child: Container(
        height:SizeConfig.convertHeight(context, 120),
        width: SizeConfig.convertWidth(context, 100),
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
                        Text(orderId!),
                        SizedBox(width:5),
                        Text(
                          'Date: ${orderDate!}',
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                        "assets/images/Successful.png",
                        height: SizeConfig.convertHeight(context, 20),
                        fit: BoxFit.cover,
                        ),
                        SizedBox(width:5),

                        Text(
                          orderStatus!?'Completed':'pending',
                        )

                      ],
                    )
                    
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
        )
      ),
    );
  }
}