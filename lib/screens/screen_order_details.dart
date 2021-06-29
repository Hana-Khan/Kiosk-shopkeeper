import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiosk_shopkeeper/globals/global_strings.dart';
import 'package:kiosk_shopkeeper/screens/screen_order_history.dart';
import 'package:kiosk_shopkeeper/utilities/constants.dart';
import 'package:kiosk_shopkeeper/utilities/custom_colors.dart';
import 'package:kiosk_shopkeeper/utilities/size_config.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({ Key? key }) : super(key: key);

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: screenBackground,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(
            top:SizeConfig.convertHeight(context, 20),
            left: SizeConfig.convertWidth(context, 20),
            bottom: SizeConfig.convertHeight(context, 20),
            right: SizeConfig.convertWidth(context, 20)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                    ), onPressed: () { Get.back(); },
                  ),
                  Text(
                    'Back',
                    textAlign: TextAlign.center,
                    style: kLogoutTextStyle,
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.convertHeight(context, 10),
              ),
              Text(
              'Order information',
              textAlign: TextAlign.center,
              style: kTitleTextStyle
            ),
            SizedBox(
                height: SizeConfig.convertHeight(context, 10),
              ),
            Text(
              'Customer details',
              textAlign: TextAlign.center,
              style: ksubtitleTextStyle,
            ),
              
              Container(
                alignment: Alignment.center,
                height: SizeConfig.convertHeight(context, 140),
                child: Card(
                  color: white,
                  elevation: 1,
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
                          children: [
                            Image.asset(
                              "assets/images/User-icon.png",
                              height: SizeConfig.convertHeight(context, 15),
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'John',
                              textAlign: TextAlign.center,
                              style: kTitleTextStyle
                            ),
                            SizedBox(
                              width: 150,
                            ),
                            Text(
                              'Date: 22/2/2021',
                              textAlign: TextAlign.right,
                              style: ksubtitleTextStyle
                            ),
                          ]
                        ),
                        SizedBox(
                        height: 20,
                      ),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email',
                                textAlign: TextAlign.center,
                                style: kLogoutTextStyle,
                              ),
                              Text(
                                'john@gmail.com',
                                textAlign: TextAlign.center,
                                style: kTitleTextStyle,
                              ),
                            ]
                          ),
                         Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'payment method',
                                textAlign: TextAlign.center,
                                style: kLogoutTextStyle,
                              ),
                              Text(
                                'Card Payment',
                                textAlign: TextAlign.center,
                                style: kTitleTextStyle,
                              ),
                              
                            ],
                          ),
                        
                      ]
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Phone no',
                            textAlign: TextAlign.center,
                            style: kLogoutTextStyle,
                          ),
                          SizedBox(
                              width: 180,
                            ),
                          Icon(
                            Icons.credit_card,
                            color: creditCardColor,
                          )
                        ],
                      ),
                      Text(
                        '0900-78601',
                        textAlign: TextAlign.center,
                        style: kTitleTextStyle,
                      ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.convertHeight(context, 10),
              ),
              Text(
              'Product details',
              textAlign: TextAlign.center,
              style: ksubtitleTextStyle,
            ),
            Container(
              height: SizeConfig.convertHeight(context, 300),
              child: SingleChildScrollView(
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
                    return OrderDetailItem(
                      customerName: "Hina",
                      paymentMethod: "cash",
                      orderDate: "22/4/2021",
                      orderId: "DC-01",
                      orderStatus: true,
                      total:77.01
                    );
                  }
                ),
              ),
            ),

            SizedBox(
              height: SizeConfig.convertHeight(context, 10),
            ),

            //Grand Total
            Container(
            color: white,
            alignment: Alignment.center,
            height: SizeConfig.convertHeight(context, 80),
            child: Column(
              children: [
                Container(
                  color: screenBackground,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                        Container(

                          padding: EdgeInsets.all(10),
                          child: Text(
                              'Grand total :',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: selectedColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              )
                            ),
                        ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'SAR 3,242',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: selectedColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              )
                            ),
                          )
                        ],
                      ),
                    ),
                    //Buttons
                    Row(
                    children: [
                      Expanded(
                        child: MaterialButton(
                          onPressed: () { Get.back(); },
                          elevation: 0,
                          color: cancelBtnColor,
                          child: Text('Cancel',
                          ),
                          shape: RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius: BorderRadius.circular(0)),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {},
                          elevation: 0,
                          child: Text('Proceed',
                          style: TextStyle(color: white),
                          ),
                          color: maroonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        ),
                      )
                    ],
                  ),
                  ],
                )
              ),
            ]
          )
        )
      )
    );
  }
}

class OrderDetailItem extends StatelessWidget {
  String? orderId,customerName,paymentMethod,orderDate;
  bool? orderStatus;
  double? total;
  OrderDetailItem({
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
    return Container(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Container(
                  alignment: Alignment.center,
                  height: SizeConfig.convertHeight(context, 70),
                  width: SizeConfig.convertWidth(context, 90),
                  child: Image.asset(
                    "assets/images/Product-Image.png",
                    height: SizeConfig.convertHeight(context, 70),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: SizeConfig.convertWidth(context, 240),
                  height: SizeConfig.convertHeight(context, 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Container(
                      width: SizeConfig.convertWidth(context, 250),
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              'Adria contact lenses',
                              style: TextStyle(
                                color: blackColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold)
                            ),
                          ),
                          Container(
                            child: Text(
                              '_Nike',
                              textAlign: TextAlign.justify,
                              style: TextStyle(color: lightGray,fontSize: 11,
                              fontWeight: FontWeight.bold)
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 150,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consetetur ……',
                            textAlign: TextAlign.left,
                            style: kLogoutTextStyle,
                          ),
                        ),
                        //remove
                        Container(
                          child: Column(
                            children: [
                              Icon(
                                Icons.delete,
                                size: 17,
                              ),
                              Text(
                                'Remove',
                                textAlign: TextAlign.center,
                                style: kLogoutTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // price
                        Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price',
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
                       //add or remove product
                       Container(
                          height: 25.00,
                          width: 80,
                          
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {                                          
                                //   Provider.of<AddItem>(context, listen: false)
                                //       .updateTask(Provider.of<AddItem>(context,
                                //               listen: false)
                                //           .tasks[0]);
                                //   setState(() {
                                //     // value++;
                                //     // print(Provider.of<AddItem>(context,
                                //     //         listen: false)
                                //     //     .newDataCount);
                                //   });
                                },
                                child: Icon(
                                  Icons.remove_circle_outline,
                                  color: maroonColor
                                  )),
                                Text(
                                  '05',
                                  // value.toString(),
                                  style: TextStyle(color: lightGray),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // setState(() {
                                    //   value >= 2 ? value-- : null;
                                    // });
                                  },
                                  child: Icon(
                                    Icons.add_circle_outline,
                                    color: maroonColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]
                      )
                    ]
                  ),
                )
                ]
              )
            ]
          ),
        )
      )
    );
  }
}