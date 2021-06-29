import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiosk_shopkeeper/screens/screen_order_history.dart';
import 'package:kiosk_shopkeeper/screens/screen_today_order.dart';
import 'package:kiosk_shopkeeper/utilities/constants.dart';
import 'package:kiosk_shopkeeper/utilities/custom_colors.dart';
import 'package:kiosk_shopkeeper/utilities/size_config.dart';
import 'package:kiosk_shopkeeper/widgets/bottom_navigation_bar.dart';
import 'package:kiosk_shopkeeper/widgets/bottom_navigation_order.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({ Key? key }) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  
  int _selectedIndex = 0;

  final tabs = [
    OrderTodayScreen(),
    OrderHistoryScreen(),
  ];
  Future<void> _onTapped(int index) async {
    //
    if (index == 0) {
      setState(() {
         _selectedIndex = index;
      });
    }
    else if(index==1){
      setState(() {
         _selectedIndex = index;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: screenBackground,
        bottomNavigationBar: BottomNavigationOrder(),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: (){
                      _onTapped(0);
                      // _selectedIndex=0;
                    },
                    child: Ink( 
                      color: Colors.transparent,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                            'Today',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: _selectedIndex==0?selectedColor:notSelectedColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            )
                          ),
                      ),
                    ),
                  ),
                    InkWell(
                      splashColor: Colors.transparent,
                      onTap: (){
                        _onTapped(1);
                        // _selectedIndex=1;
                      },
                      child: Ink( 
                        color: Colors.transparent,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'History',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: _selectedIndex==1?selectedColor:notSelectedColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            )
                          ),
                        ),
                      ),
                    ),
                ],),
              ),
              SizedBox(
                height:SizeConfig.convertHeight(context, 10),
              ),
              Container(
                color: white,
                alignment: Alignment.center,
                height: SizeConfig.convertHeight(context, 80),
                width: double.infinity,
                child: SearchContainer()
              ),
              SizedBox(
                height:SizeConfig.convertHeight(context, 10),
              ),
              Container(
                color: screenBackground,
                alignment: Alignment.topCenter,
                height: SizeConfig.convertHeight(context, 450),
                child: tabs[_selectedIndex],
                ),
                
                
              
            ],
          ),
        ),
      ),  
    );
  }
}

class SearchContainer extends StatelessWidget {
  const SearchContainer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      alignment: Alignment.center,
      height: SizeConfig.convertHeight(context, 100),
      width: double.infinity,
      padding: EdgeInsets.only(left:10,right:10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(left:2),
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 2),
                  top: BorderSide(color: Colors.grey, width: 2),
                  left: BorderSide(color: Colors.grey, width: 2),
                ),  
              ),
              child:
              Row(
                children: [
                  Text('All'),
                  DropdownButton<String>(
                    items: <String>['All', 'B', 'C', 'D'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                        //   child: //Text (value),
                        ));
                    }).toList(),
                    onChanged: (_) {},
                  ),
                ],
              )
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
                height: 50,
                decoration: BoxDecoration(
                  border:Border.all(
                  color: Colors.grey, width: 2),
                ),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Search here",
                    hintStyle: TextStyle(
                      color: searchGray,
                      ),
                    suffixIcon: Icon(
                      Icons.search,
                      color: lightGray,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 16, vertical: 4),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white, width: 0)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white, width: 0)),
                  ),
                )
              )
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              flex: 2,
              child: Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey, width: 2),
              ),
              child:Container(
                alignment: Alignment.center,
                child: Text('Export',

                ),
              )
            ),)
        ],
      ),
    );
  }
}
