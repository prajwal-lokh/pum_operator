import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pum_operator/presentation/modals/orders_modal.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/value_manager.dart';
import '../../../resources/string_manager.dart';
import '../popup/popup.dart';

class OperatorOrderScreen extends StatefulWidget {
  final String ordernum;
  OperatorOrderScreen({Key? key, required this.ordernum}) : super(key: key);

  @override
  State<OperatorOrderScreen> createState() => _OperatorOrderScreenState();
}

class _OperatorOrderScreenState extends State<OperatorOrderScreen> {
  List<OrdersModal> orders = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.appbarcolor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: ColorManager.white,
          ),
        ),
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
                style: TextStyle(
                    fontFamily: FontConstants.fontFamily2,
                    color: ColorManager.navyblue,
                    //fontWeight: FontWeightManager.bold,
                    fontSize: FontSize.s16),
              ),
              Text(
                AppString.operatorshift,
                style: TextStyle(
                    fontFamily: FontConstants.fontFamily2,
                    color: ColorManager.black,
                    //fontWeight: FontWeightManager.bold,
                    fontSize: FontSize.s16),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
              child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/orders_sample.json'),
                builder: (context, snapshot) {
                  List? data1 = json.decode(snapshot.data.toString());
                  data1?.forEach((element) {
                    print(element["dbid"]);
                    orders.add(OrdersModal(
                        operation: element["operation"],
                        //orderno: element["orderno"],
                        items: element["items"]));
                  });
                  return ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: ListView.builder(
                        itemCount: orders.length,
                        itemBuilder: (BuildContext, index) {
                          return Card(
                            child: Container(
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
                                    blurRadius:
                                        2, // The blur radius of the shadow
                                    offset: Offset(0,
                                        2), // The offset of the shadow from the box
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          AppString.operatoroo,
                                          style: TextStyle(
                                              fontFamily:
                                                  FontConstants.fontFamily2,
                                              color: ColorManager.appbarcolor,
                                              fontWeight:
                                                  FontWeightManager.bold,
//fontWeight: FontWeightManager.bold,
                                              fontSize: FontSize.s15),
                                        ),
                                        Text(
                                          orders[index].operation,
                                          style: TextStyle(
                                              fontFamily:
                                                  FontConstants.fontFamily2,
                                              color: ColorManager.appbarcolor,
                                              fontWeight:
                                                  FontWeightManager.bold,
//fontWeight: FontWeightManager.bold,
                                              fontSize: FontSize.s15),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              AppString.orderoo,
                                              style: TextStyle(
                                                  fontFamily:
                                                      FontConstants.fontFamily2,
                                                  color: ColorManager.black,
                                                  //fontWeight: FontWeightManager.bold,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          40),
                                            ),
                                            Text(
                                              widget.ordernum,
                                              style: TextStyle(
                                                  fontFamily:
                                                      FontConstants.fontFamily2,
                                                  color: ColorManager.black,
                                                  //fontWeight: FontWeightManager.bold,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          40),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              AppString.itemsoo,
                                              style: TextStyle(
                                                  fontFamily:
                                                      FontConstants.fontFamily2,
                                                  color: ColorManager.black,
                                                  //fontWeight: FontWeightManager.bold,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          40),
                                            ),
                                            Text(
                                              orders[index].items,
                                              style: TextStyle(
                                                  fontFamily:
                                                      FontConstants.fontFamily2,
                                                  color: ColorManager.black,
                                                  fontWeight:
                                                      FontWeightManager.bold,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          40),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              AppString.yield,
                                              style: TextStyle(
                                                  fontFamily:
                                                      FontConstants.fontFamily2,
                                                  color: ColorManager.black,
                                                  //fontWeight: FontWeightManager.bold,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          40),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  60,
                                            ),
                                            Text(
                                              '0',
                                              style: TextStyle(
                                                  fontFamily:
                                                      FontConstants.fontFamily2,
                                                  color: ColorManager.black,
                                                  fontWeight:
                                                      FontWeightManager.bold,
//fontWeight: FontWeightManager.bold,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          40),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              AppString.rework,
                                              style: TextStyle(
                                                  fontFamily:
                                                      FontConstants.fontFamily2,
                                                  color: ColorManager.black,
                                                  //fontWeight: FontWeightManager.bold,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          40),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  60,
                                            ),
                                            Text(
                                              '0',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily:
                                                      FontConstants.fontFamily2,
                                                  color: ColorManager.black,
                                                  fontWeight:
                                                      FontWeightManager.bold,
//fontWeight: FontWeightManager.bold,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          40),
                                            ),
                                          ],
                                        ),

                                        //Expanded(child: Text(' ')),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              AppString.rejection,
                                              style: TextStyle(
                                                  fontFamily:
                                                      FontConstants.fontFamily2,
                                                  color: ColorManager.black,
                                                  //fontWeight: FontWeightManager.bold,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          40),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  60,
                                            ),
                                            Text(
                                              '0',
                                              style: TextStyle(
                                                  fontFamily:
                                                      FontConstants.fontFamily2,
                                                  color: ColorManager.black,
                                                  fontWeight:
                                                      FontWeightManager.bold,
//fontWeight: FontWeightManager.bold,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          40),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
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
                                              showDialog(
                                                  context: context,
                                                  builder: (_) => PopUp(
                                                        quantity: orders[index]
                                                            .items
                                                            .toString(),
                                                      ));
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  ColorManager.buttongridecolor,
                                            ),
                                            child: Text(
                                              AppString.edit,
                                              style: TextStyle(
                                                  fontFamily:
                                                      FontConstants.fontFamily2,
                                                  color:
                                                      ColorManager.appbarcolor,
                                                  fontWeight:
                                                      FontWeightManager.bold,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          40),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
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
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  ColorManager.appbarcolor,
                                            ),
                                            child: Text(
                                              AppString.save,
                                              style: TextStyle(
                                                  fontFamily:
                                                      FontConstants.fontFamily2,
                                                  color: ColorManager.white,
                                                  fontWeight:
                                                      FontWeightManager.bold,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          40),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                }),
          ))
        ],
      )),
    );
  }
}
