import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/value_manager.dart';
import '../operator_screens/operator_order_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // bool automaticallyImplyLeading;
    return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ColorManager.appbarcolor,
          elevation: AppSize.s0,
          actions: [
            Text(
              'LogOut',
              style: TextStyle(
                fontFamily: FontConstants.fontFamily1,
                color: ColorManager.white,
                // fontWeight: FontWeightManager.bold,
                //fontSize: FontSize.s20,
              ),
            ),
            IconButton(
                onPressed: () async {
                  Navigator.pop(context);
                  await _auth.signOut();
                },
                icon: Icon(
                  Icons.logout,
                  color: ColorManager.white,
                ))
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Column(
                children: [
                  Icon(
                    Icons.account_circle,
                    color: ColorManager.faintblue,
                    size: AppSize.s65,
                  ),
                  Text(
                    'Vishal More',
                    style: TextStyle(
                        fontFamily: FontConstants.fontFamily2,
                        color: ColorManager.navyblue,
                        //fontWeight: FontWeightManager.bold,
                        fontSize: FontSize.s16),
                  ),
                  Text(
                    'Operator ( 2nd Shift )',
                    style: TextStyle(
                        fontFamily: FontConstants.fontFamily2,
                        color: ColorManager.black,
                        //fontWeight: FontWeightManager.bold,
                        fontSize: FontSize.s16),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 100,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text(
                      'Orders',
                      style: TextStyle(
                          fontFamily: FontConstants.fontFamily2,
                          color: ColorManager.black,
                          fontWeight: FontWeightManager.bold,
                          fontSize: FontSize.s20),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 100,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 5,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? 2
                          : 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 10,
                      childAspectRatio: (2 / 1),
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          //height: MediaQuery.of(context).size.height / 250,
                          decoration: BoxDecoration(
                            color: ColorManager.sidebar,
                            // borderRadius:
                            //     const BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45
                                    .withOpacity(0.2), // Shadow color
                                spreadRadius:
                                    1, // How far the shadow should spread (positive values spread outwards, negative values spread inwards)
                                blurRadius: 2, // The blur radius of the shadow
                                offset: Offset(0,
                                    2), // The offset of the shadow from the box
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Order No : ',
                                      style: TextStyle(
                                          fontFamily: FontConstants.fontFamily2,
                                          color: ColorManager.appbarcolor,
                                          fontWeight: FontWeightManager.bold,
//fontWeight: FontWeightManager.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              40),
                                    ),
                                    Text(
                                      '12345678913',
                                      style: TextStyle(
                                          fontFamily: FontConstants.fontFamily2,
                                          color: ColorManager.appbarcolor,
                                          fontWeight: FontWeightManager.bold,
//fontWeight: FontWeightManager.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              40),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 100,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Material code   :',
                                      style: TextStyle(
                                          fontFamily: FontConstants.fontFamily2,
                                          color: ColorManager.black,
//fontWeight: FontWeightManager.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              40),
                                    ),
                                    Text(
                                      '10',
                                      style: TextStyle(
                                          fontFamily: FontConstants.fontFamily2,
                                          color: ColorManager.black,
                                          fontWeight: FontWeightManager.bold,
//fontWeight: FontWeightManager.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              40),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 100,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Order Qty         :',
                                      style: TextStyle(
                                          fontFamily: FontConstants.fontFamily2,
                                          color: ColorManager.black,
//fontWeight: FontWeightManager.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              40),
                                    ),
                                    Text(
                                      '100',
                                      style: TextStyle(
                                          fontFamily: FontConstants.fontFamily2,
                                          color: ColorManager.black,
                                          fontWeight: FontWeightManager.bold,
//fontWeight: FontWeightManager.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              40),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 100,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                25,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const OperatorOrderScreen()));
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape: StadiumBorder(),
                                              backgroundColor:
                                                  ColorManager.buttongridecolor,
                                            ),
                                            child: Text(
                                              'Add',
                                              style: TextStyle(
                                                  fontFamily:
                                                      FontConstants.fontFamily2,
                                                  color: ColorManager.faintblue,
                                                  fontWeight:
                                                      FontWeightManager.bold,
                                                  fontSize: FontSize.s15),
                                            )))
                                  ],
                                )
                              ],
                            ),
                          ));
                    }),
              ))
            ],
          ),
        ));
  }
}

// Card(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(10)),
// elevation: 4,
// child: Column(
// children: [
// ClipRRect(
// borderRadius: const BorderRadius.only(
// topLeft: Radius.circular(10),
// topRight: Radius.circular(10),
// ),
// ),
// Container(
// child: Padding(
// padding: const EdgeInsets.all(12),
// child: Column(
// children: [
// Row(
// children: [
// Text(
// 'Order No : 12345678912',
// style: TextStyle(
// fontFamily: FontConstants.fontFamily2,
// color: ColorManager.black,
// //fontWeight: FontWeightManager.bold,
// fontSize: FontSize.s16),
// ),
// ],
// ),
// Row(
// children: [
// Text(
// 'Material code   :   10',
// style: TextStyle(
// fontFamily: FontConstants.fontFamily2,
// color: ColorManager.black,
// //fontWeight: FontWeightManager.bold,
// fontSize: FontSize.s16),
// ),
// ],
// ),
// Row(
// children: [
// Text(
// 'Order Qty         : 100',
// style: TextStyle(
// fontFamily: FontConstants.fontFamily2,
// color: ColorManager.black,
// //fontWeight: FontWeightManager.bold,
// fontSize: FontSize.s16),
// ),
// ],
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.end,
// children: [
// SizedBox(
// height: 25,
// child: ElevatedButton(
// onPressed: () {},
// child: Text('Add')))
// ],
// )
// ],
// ),
// ),
// ),
// ],
// ),
// );
