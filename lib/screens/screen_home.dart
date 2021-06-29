import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiosk_shopkeeper/globals/global_strings.dart';
import 'package:kiosk_shopkeeper/screens/screen_order.dart';
import 'package:kiosk_shopkeeper/widgets/grid_item.dart';
import 'package:kiosk_shopkeeper/screens/screen_products.dart';
import 'package:kiosk_shopkeeper/utilities/constants.dart';
import 'package:kiosk_shopkeeper/utilities/custom_colors.dart';
import 'package:kiosk_shopkeeper/utilities/size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List imageUrl=[
    "assets/images/Orders-icon",
    "assets/images/Products-icon",
    "assets/images/Requisition-icon",
    "assets/images/Reports-icon"
    ];
  List titleText=["Orders","Products","Requisition","Reports"];
  List details=["View orders placed by customers or view history","Total","Last request made","Last viewed"];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
            children: <Widget>[
              Icon(
                Icons.logout_rounded,
                size: 30,
              ),
              Text(
                'Log-out',
                textAlign: TextAlign.center,
                style: kLogoutTextStyle,
              ),
              Container(
                alignment: Alignment.center,
                height: SizeConfig.convertHeight(context, 40),
                child: Image.asset(
                  Strings.appLogo,
                  height: SizeConfig.convertHeight(context, 40),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: SizeConfig.convertHeight(context, 20),
              ),
              Container(
                height: SizeConfig.convertHeight(context, 50),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                    Text(
                      'Welcome to KIOSK Panel',
                      textAlign: TextAlign.center,
                      style: kTitleTextStyle
                    ),
                    Text(
                      'Make a selection to continue',
                      textAlign: TextAlign.center,
                      style: ksubtitleTextStyle,
                    )
                  ]
                ),
              ),
              SizedBox(
                height: SizeConfig.convertHeight(context, 30),
              ),
              Container(
                height: SizeConfig.convertHeight(context, 360),
                child: SingleChildScrollView(
                  child: GridView.builder(
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8, 
                      mainAxisSpacing: 4
                    ),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return GridItem(
                        titleText:titleText[index],
                        subtitleText:details[index],
                        imageUrl:imageUrl[index],
                        onPress: () {
                          print("pressed");
                          Get.to(index==0?OrderScreen():ProductsScreen());
                          // if(index==0){
                          //   Get.to(OrderScreen());
                          // }
                          // else if(index==1){
                          //   Get.to(ProductsScreen());
                          // }
                          
                        } 
                      );
                                                // return InkWell(
                                                //   child:Card(
                                                //     color: whitish,//subjectColors[index],//Color(0xffF5F5F5),
                                                //     elevation: 0,
                                                //     shape:RoundedRectangleBorder(
                                                //       borderRadius: const BorderRadius.all(
                                                //         Radius.circular(7.0),
                                                //       ),
                                                      
                                                //       ),
                                                //       child: Column(
                                                //         mainAxisAlignment: MainAxisAlignment.center,
                                                //         children: <Widget>[
                                                //           Container(
                                                //             alignment: Alignment.center,
                                                //             height: SizeConfig.convertHeight(context, 50),
                                                //             child: Image.asset(
                                                //               "${imageUrl[index]}.png",
                                                //               height: SizeConfig.convertHeight(context, 50),
                                                //               fit: BoxFit.cover,
                                                //             ),
                                                //           ),
                                                //           Container(
                                                //             alignment: Alignment.center,
                                                //             child: ListTile(
                                                //               title:Text(
                                                //                 titleText[index],
                                                //                 textAlign:TextAlign.center,
                                                //               style: kTitleTextStyle,
                                                //             ),
                                                //           subtitle:Text(
                                                //             details[index],
                                                //             textAlign:TextAlign.center,
                                                //             style: ksubtitleTextStyle,
                                                //             ),
                                                //           ),
                                                //           ),
                                                //         ],
                                                //       ),
                                                //     ),
                                                //   );
                                                },
                                              ),
                                            ),
                                          )
                                      ]
                                    )
                                  ),
                                ),
                              );
                            }
                          }
                          
