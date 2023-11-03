import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pum_operator/presentation/modals/orders_modal.dart';
import 'package:pum_operator/resources/theme_manager.dart';

import '../../../constants/app_config.dart';
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
  var jsonList;

  void getData() async {
    try {
      String token =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjo0ODUyNDE3ODEyLCJpYXQiOjE2OTg4MTc4MTIsImp0aSI6IjAyMTA1MDEzYTg1ZDRlZjJiYWY0YWJiYjI5MzRiMTVmIiwidXNlcl9pZCI6MX0.ve3expi73Mkg1ZYJ7Fwc5SnBF-s3NBps-S8pgYlOLoo';
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var response =
          await Dio().post("${AppConfig.endpoint}/api/v1/oprconf/list/");
      if (response.statusCode == 200) {
        print(response.data.toString());
        print(response.statusCode);
        setState(() {
          List Orders = response.data['superheros'] as List;
        });
      } else {
        print("no data found");
      }
    } catch (e) {
      print(e);
    }
  }

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
              Text(AppString.vishalmore,
                  style: ThemeManager.customTextStyle(
                      color: ColorManager.navyblue)),
              Text(AppString.operatorshift,
                  style:
                      ThemeManager.customTextStyle(color: ColorManager.black)),
            ],
          ),
          const SizedBox(
            height: AppSize.s16,
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
                      yield: element["yield"],
                      rework: element["rework"],
                      items: element["items"],
                      rejection: element["rejection"],
                    ));
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
                                        Text(AppString.operatoroo,
                                            style: RandomColor.customTextStyle(
                                                color:
                                                    ColorManager.appbarcolor)),
                                        Text(orders[index].operation,
                                            style: RandomColor.customTextStyle(
                                                color:
                                                    ColorManager.appbarcolor)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: AppSize.s16,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(AppString.orderoo,
                                                style: OperatorConstant
                                                    .customTextStyle(context,
                                                        ColorManager.black)),
                                            Text(widget.ordernum,
                                                style: OperatorConstant
                                                    .customTextStyle(context,
                                                        ColorManager.black)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(AppString.itemsoo,
                                                style: OperatorConstant
                                                    .customTextStyle(context,
                                                        ColorManager.black)),
                                            Text(orders[index].items,
                                                style: HomeOperatorConstant
                                                    .customTextStyle(context,
                                                        ColorManager.black)),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: AppSize.s16,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(AppString.yield,
                                                style: OperatorConstant
                                                    .customTextStyle(context,
                                                        ColorManager.black)),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  60,
                                            ),
                                            Text(orders[index].yield,
                                                style: HomeOperatorConstant
                                                    .customTextStyle(
                                                        context,
                                                        ColorManager
                                                            .appbarcolor)),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(AppString.rework,
                                                style: OperatorConstant
                                                    .customTextStyle(context,
                                                        ColorManager.black)),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  60,
                                            ),
                                            Text(orders[index].rework,
                                                textAlign: TextAlign.center,
                                                style: HomeOperatorConstant
                                                    .customTextStyle(
                                                        context,
                                                        ColorManager
                                                            .appbarcolor)),
                                          ],
                                        ),

                                        //Expanded(child: Text(' ')),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(AppString.rejection,
                                                style: OperatorConstant
                                                    .customTextStyle(context,
                                                        ColorManager.black)),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  60,
                                            ),
                                            Text(orders[index].rejection,
                                                style: HomeOperatorConstant
                                                    .customTextStyle(
                                                        context,
                                                        ColorManager
                                                            .appbarcolor))
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: AppSize.s16,
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
                                            onPressed: () {
                                              // createOperatorData().Dio().post().toString();
                                              getData();
                                              //createOperatorData();
                                              //postDataEvent;
                                              //  var dio = Dio();
                                              // var  response = await dio.post(
                                              //  “your-url",
                                              //  data: objectData,
                                              //  onSendProgress: (int yiel, int rework,int rejected) {
                                              //    print(“$sent $total”);
                                              //  },
                                              //  );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  ColorManager.appbarcolor,
                                            ),
                                            child: Text(AppString.save,
                                                style: HomeOperatorConstant
                                                    .customTextStyle(context,
                                                        ColorManager.white)),
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

  // Future<void> createOperatorData() async {
  //   String token =
  //       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjo0ODUyNDE3ODEyLCJpYXQiOjE2OTg4MTc4MTIsImp0aSI6IjAyMTA1MDEzYTg1ZDRlZjJiYWY0YWJiYjI5MzRiMTVmIiwidXNlcl9pZCI6MX0.ve3expi73Mkg1ZYJ7Fwc5SnBF-s3NBps-S8pgYlOLoo';
  //
  //   var dio = Dio();
  //   var headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer $token'
  //   };
  //   var response = await dio.get("${AppConfig.endpoint}/api/v1/oprconf/list/");
  //   options:
  //   Options(
  //     method: 'GET',
  //     headers: headers,
  //   );
  //   print(response.statusCode);
  //   print(response.data.toString());
  // }
//   Future<void> postDataEvent() async {
//     String token =
//         'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjo0ODUyNDE3ODEyLCJpYXQiOjE2OTg4MTc4MTIsImp0aSI6IjAyMTA1MDEzYTg1ZDRlZjJiYWY0YWJiYjI5MzRiMTVmIiwidXNlcl9pZCI6MX0.ve3expi73Mkg1ZYJ7Fwc5SnBF-s3NBps-S8pgYlOLoo';

//     var dio = Dio();
//
//     var headers = {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $token'
//     };
//
//     var response = await dio.get("${AppConfig.endpoint}/api/v1/oprconf/list/");
//
//     if (response.statusCode == 200) {
//       // Status is the message receiving in responce saying product
//       //inserted successfully.
//       print(response.data['Status']);
//       print(response.statusCode);
//     } else {
//       print(response.statusMessage);
//     }
//   }
}
