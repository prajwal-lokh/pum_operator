import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pum_operator/presentation/modals/operator_modal.dart';
import 'package:pum_operator/resources/string_manager.dart';
import 'package:pum_operator/resources/theme_manager.dart';
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
  List<OperatorModal> operatormodal = [];

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
              AppString.logout,
              style: TextStyle(
                fontFamily: FontConstants.fontFamily1,
                color: ColorManager.white,
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
                    AppString.vishalmore,
                    style: ThemeManager.customTextStyle(color: ColorManager.navyblue)
                  ),
                  Text(
                    AppString.operatorshift,
                    style: ThemeManager.customTextStyle(color: ColorManager.black)
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
                      AppString.orders,
                      style: RandomConstant.customTextStyle(
                          FontSize.s20,
                          FontConstants.fontFamily2,
                          FontWeightManager.bold,ColorManager.black,)
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 100,
              ),
              Expanded(
                  child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: FutureBuilder(
                      future: DefaultAssetBundle.of(context)
                          .loadString('assets/operator_sample.json'),
                      builder: (context, snapshot) {
                        List? data1 = json.decode(snapshot.data.toString());
                        operatormodal = [];
                        data1?.forEach((element) {
                          print(element["dbid"]);
                          operatormodal.add(OperatorModal(
                              materialcode: element["materialcode"],
                              orderno: element["orderno"],
                              orderqty: element["orderqty"]));
                        });
                        return GridView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: operatormodal.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  MediaQuery.of(context).orientation ==
                                          Orientation.landscape
                                      ? 2
                                      : 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 10,
                              childAspectRatio: (2 / 1),
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  decoration: BoxDecoration(
                                    color: ColorManager.sidebar,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black45
                                            .withOpacity(0.2), // Shadow color
                                        spreadRadius:
                                            1,
                                        blurRadius:
                                            2,
                                        offset: Offset(0,
                                            2),
                                      ),
                                    ],
                                  ),
                                  child: ListView(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                AppString.orderoo,
                                                style: HomeOperatorConstant.customTextStyle(context,ColorManager.appbarcolor )
                                              ),
                                              Text(
                                                operatormodal[index].orderno,
                                                style: HomeOperatorConstant.customTextStyle(context,ColorManager.appbarcolor )
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                100,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                AppString.materialcode,
                                                style: HomeOperatorConstant.customTextStyle(context,ColorManager.black )
                                              ),
                                              Text(
                                                operatormodal[index].materialcode,
                                                style: HomeOperatorConstant.customTextStyle(context,ColorManager.black )
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                100,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                AppString.orderqty,
                                                style: HomeOperatorConstant.customTextStyle(context,ColorManager.black )
                                              ),
                                              Text(
                                                operatormodal[index].orderqty,
                                                style: HomeOperatorConstant.customTextStyle(context,ColorManager.black )
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                100,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      5,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      25,
                                                  child: ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        OperatorOrderScreen(
                                                                          ordernum: operatormodal[index]
                                                                              .orderno
                                                                              .toString(),
                                                                        )));
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        shape: StadiumBorder(),
                                                        backgroundColor:
                                                            ColorManager
                                                                .buttongridecolor,
                                                      ),
                                                      child: Text(
                                                        AppString.add,
                                                        style: HomeOperatorConstant.customTextStyle(context,ColorManager.faintblue )
                                                      )))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ]));
                            });
                      }),
                ),
              ))
            ],
          ),
        ));
  }
}

