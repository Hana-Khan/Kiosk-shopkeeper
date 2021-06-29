import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kiosk_shopkeeper/globals/global_strings.dart';
import 'package:kiosk_shopkeeper/utilities/constants.dart';
import 'package:kiosk_shopkeeper/utilities/custom_colors.dart';
import 'package:kiosk_shopkeeper/utilities/size_config.dart';
import 'package:kiosk_shopkeeper/widgets/bottom_navigation_bar.dart';
import 'package:kiosk_shopkeeper/widgets/dialog_order_placed.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({ Key? key }) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  bool _isSelected=false;
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    bool isLandscape=MediaQuery.of(context).orientation==Orientation.landscape;
    return SafeArea(
      child: Scaffold(
        backgroundColor: screenBackground,
        bottomNavigationBar: BottomNavigation(),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(
            // top:SizeConfig.convertHeight(context, 20),
            left: SizeConfig.convertWidth(context, 20),
            bottom: SizeConfig.convertHeight(context, 20),
            right: SizeConfig.convertWidth(context, 20)
          ),
          child: Column(
            children: [
              Container(
                color: white,
                alignment: Alignment.center,
                height: SizeConfig.convertHeight(context, 50),
                child: Image.asset(
                  Strings.appLogo,
                  height: SizeConfig.convertHeight(context, 40),
                  fit: BoxFit.cover,
                ),
              ),

              //List of products 
              !isLandscape?Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: SizeConfig.convertHeight(context, 10),
                    ),
                    Text(
                      'Products',
                      textAlign: TextAlign.center,
                      style: kTitleTextStyle
                    ),
                    Text(
                      'Select product and adjust quantity',
                      textAlign: TextAlign.center,
                      style: ksubtitleTextStyle,
                    ),
                    SizedBox(
                      height: SizeConfig.convertHeight(context, 10),
                    ),
                    Container(
                      height: SizeConfig.convertHeight(context, 263),
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                        .collection('products')
                        .orderBy('id', descending: false)
                        .snapshots(),
                          builder: (BuildContext context, snapshot) {
                            if (!snapshot.hasData) {
                              print('no data in snapshot');
                              return CircularProgressIndicator();
                            } 
                            else {
                              return ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (BuildContext context, int index) { 
                                return Container(
                                  height: SizeConfig.convertHeight(context, 130),
                                  width: double.infinity,
                                  child: Card(
                                    color: whitish,
                                    elevation: 0,
                                    shape:RoundedRectangleBorder(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(5.0),
                                        ),
                                        side: BorderSide( color: borderColor),
                                      ),
                                    child: Container(
                                      padding: EdgeInsets.only(left:10,right:10),

                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                        IconButton(
                                          icon:  Icon(
                                            !_isSelected?Icons.circle_outlined:Icons.circle_rounded,
                                            color: maroonColor
                                          ), onPressed: () { 
                                            setState(() {
                                              _isSelected=!_isSelected;
                                            
                                            });
                                              
                                           },
                                        ),

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
                                          height: SizeConfig.convertHeight(context, 60),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                            Container(
                                              width: SizeConfig.convertWidth(context, 250),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      snapshot.data!.docs[index]['name'],
                                                      style: TextStyle(
                                                        color: blackColor,
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.bold)
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      'SAR ${
                                                        snapshot.data!.docs[index]['price']}',
                                                      textAlign: TextAlign.justify,
                                                      style: TextStyle(color: blackColor,fontSize: 11,
                                                      fontWeight: FontWeight.bold)
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: SizeConfig.convertWidth(context, 160),
                                              child: Text(
                                                snapshot.data!.docs[index]['details'],
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(color: blackColor,fontSize: 12,
                                            fontWeight: FontWeight.normal)
                                              ),
                                            ),
                                          ],
                                          ),
                                        ),
                                        
                                        
                                        ],)
                                      ],),
                                    ),
                                  ),
                                );
                              }
                            );
                          } 
                        }
                      ),
                    ),
                    //Invoice Details Container
                    Container(
                      height: SizeConfig.convertHeight(context, 270),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top:10,bottom:10,left: 10),
                            child: Text(
                              'Invoice Details',
                              textAlign: TextAlign.left,
                              style: kTitleTextStyle
                            ),
                          ),
                          dividerLine(),
                          SizedBox(
                            height:SizeConfig.convertHeight(context, 10),
                          ),
                          Container(
                            color: invoiceDetails,
                            height:SizeConfig.convertHeight(context, 80),
                            width: SizeConfig.convertWidth(context, 280),
                            alignment: Alignment.center,
                            child:Card(
                              color: invoiceDetails,
                              elevation: 1,
                              shape:Border(
                                bottom: BorderSide( //                    <--- top side
                                  color: maroonColor,
                                  width: 0.5,
                                ),
                              ),
                            child:Column(
                              
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Total price',
                                        textAlign: TextAlign.left,
                                        style: kTitleTextStyle
                                      ),
                                    ),
                                    Container(
                                      child:Text(
                                        'SAR. 75.00',
                                        textAlign: TextAlign.left,
                                        style: kTitleTextStyle
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child:Text(
                                        'VAT amount',
                                        textAlign: TextAlign.left,
                                        style: kTitleTextStyle
                                      ),
                                    ),
                                    Container(
                                      child:Text(
                                        'SAR. 15.00',
                                        textAlign: TextAlign.left,
                                        style: kTitleTextStyle
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            ),
                          ),
                          Container(
                            height:SizeConfig.convertHeight(context, 30),
                            width: SizeConfig.convertWidth(context, 280),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text(
                                    'Grand Total',
                                    textAlign: TextAlign.left,
                                    style: kTitleTextStyle
                                  ),
                                ),
                                Container(
                                  child:Text(
                                    'SAR. 90.00',
                                    textAlign: TextAlign.left,
                                    style: kTitleTextStyle
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            height:SizeConfig.convertHeight(context, 40),
                            width: SizeConfig.convertWidth(context, 280),
                            child: Material(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              color: maroonColor,
                              elevation: 1.4,
                              shadowColor: Colors.red.shade300,
                              child: InkWell(
                                  onTap: (){
                                    orderPlacedDialog(context);
                                  },
                                  child: Center(
                                    child: Text(
                                      'Place order',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                            ),
                          )
                        ],
                      ),
                    )
                  ]
                ),
              ):

              //Lanscap ScreenDesign
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10
                    ),
                    Text(
                      'Products',
                      textAlign: TextAlign.left,
                      style: kTitleTextStyle
                    ),
                    Text(
                      'Select product and adjust quantity',
                      textAlign: TextAlign.left,
                      style: ksubtitleTextStyle,
                    ),
                    SizedBox(
                      height: 10
                    ),
                    Container(
                      width: 300,//SizeConfig.convertHeight(context, 200),
                      child: Row(
                        children: [
                          Container(
                            height: SizeConfig.convertHeight(context, 20),//SizeConfig.convertWidth(context, 200),
                            child: ListView.builder(
                              itemCount: 2,
                              itemBuilder: (BuildContext context, int index) { 
                                return Container(
                                  height: SizeConfig.convertHeight(context, 20),
                                  width: double.infinity,
                                  child: Card(
                                    color: whitish,
                                    elevation: 0,
                                    shape:RoundedRectangleBorder(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(5.0),
                                        ),
                                        side: BorderSide( color: borderColor),
                                      ),
                                    child: Container(
                                      padding: EdgeInsets.only(left:10,right:10),

                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                        Icon(
                                          Icons.circle_outlined,
                                          color: maroonColor
                                        ),

                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                          Container(
                                          alignment: Alignment.center,
                                          height: SizeConfig.convertWidth(context, 70),
                                          width: SizeConfig.convertHeight(context, 90),
                                          child: Image.asset(
                                            "assets/images/Product-Image.png",
                                            height: SizeConfig.convertWidth(context, 70),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: SizeConfig.convertHeight(context, 240),
                                          height: SizeConfig.convertWidth(context, 60),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                            Container(
                                              width: SizeConfig.convertWidth(context, 250),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                      'SAR 200.00',
                                                      textAlign: TextAlign.justify,
                                                      style: TextStyle(color: blackColor,fontSize: 11,
                                                      fontWeight: FontWeight.bold)
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: SizeConfig.convertWidth(context, 160),
                                              child: Text(
                                                'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et',
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(color: blackColor,fontSize: 12,
                                            fontWeight: FontWeight.normal)
                                              ),
                                            ),
                                          ],
                                          ),
                                        ),
                                        
                                        
                                        ],)
                                      ],),
                                    ),
                                  ),
                                );
                              }
                            ),
                          ),
                      //Invoice Details Container
                        Container(
                          width: SizeConfig.convertWidth(context, 200),
                          height: SizeConfig.convertHeight(context, 270),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top:10,bottom:10,left: 10),
                                child: Text(
                                  'Invoice Details',
                                  textAlign: TextAlign.left,
                                  style: kTitleTextStyle
                                ),
                              ),
                              dividerLine(),
                              SizedBox(
                                height:SizeConfig.convertHeight(context, 10),
                              ),
                              Container(
                                color: invoiceDetails,
                                height:SizeConfig.convertHeight(context, 80),
                                width: SizeConfig.convertWidth(context, 280),
                                alignment: Alignment.center,
                                child:Card(
                                  color: invoiceDetails,
                                  elevation: 1,
                                  shape:Border(
                                    bottom: BorderSide( //                    <--- top side
                                      color: maroonColor,
                                      width: 0.5,
                                    ),
                                  ),
                                child:Column(
                                  
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Text(
                                            'Total price',
                                            textAlign: TextAlign.left,
                                            style: kTitleTextStyle
                                          ),
                                        ),
                                        Container(
                                          child:Text(
                                            'SAR. 75.00',
                                            textAlign: TextAlign.left,
                                            style: kTitleTextStyle
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child:Text(
                                            'VAT amount',
                                            textAlign: TextAlign.left,
                                            style: kTitleTextStyle
                                          ),
                                        ),
                                        Container(
                                          child:Text(
                                            'SAR. 15.00',
                                            textAlign: TextAlign.left,
                                            style: kTitleTextStyle
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                ),
                              ),
                              Container(
                                height:SizeConfig.convertHeight(context, 30),
                                width: SizeConfig.convertWidth(context, 280),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Grand Total',
                                        textAlign: TextAlign.left,
                                        style: kTitleTextStyle
                                      ),
                                    ),
                                    Container(
                                      child:Text(
                                        'SAR. 90.00',
                                        textAlign: TextAlign.left,
                                        style: kTitleTextStyle
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                height:SizeConfig.convertHeight(context, 40),
                                width: SizeConfig.convertWidth(context, 280),
                                child: Material(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                  color: maroonColor,
                                  elevation: 1.4,
                                  shadowColor: Colors.red.shade300,
                                  child: InkWell(
                                      onTap: (){
                                        orderPlacedDialog(context);
                                      },
                                      child: Center(
                                        child: Text(
                                          'Place order',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                  ]
                ),
                    ),
              ],
              )
              ),
            ],
          )
        ),
      )
    );
  }
  SizedBox dividerLine() {
  return SizedBox(
    height: SizeConfig.convertHeight(context, 2),
    // width: ConfigSize.blockSizeHorizontal*80,
    child: Container(
      padding: EdgeInsets.only(left: 10),
      child: Divider(
        color: maroonColor,
        thickness: 0.5,
      ),
    ),
  );
}
}
