import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/value_manager.dart';
import '../popup/operator_popups/popup.dart';

class OperatorOrderScreen extends StatefulWidget {
  const OperatorOrderScreen({Key? key}) : super(key: key);

  @override
  State<OperatorOrderScreen> createState() => _OperatorOrderScreenState();
}

class _OperatorOrderScreenState extends State<OperatorOrderScreen>{
  @override
  Widget build(BuildContext context){
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
            height: 15,
          ),
          Expanded(
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: ListView.builder(
                    itemCount: 7,
                    itemBuilder: (BuildContext, int) {
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
                                blurRadius: 2, // The blur radius of the shadow
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
                                      'Operation :',
                                      style: TextStyle(
                                          fontFamily: FontConstants.fontFamily2,
                                          color: ColorManager.appbarcolor,
                                          fontWeight: FontWeightManager.bold,
//fontWeight: FontWeightManager.bold,
                                          fontSize: FontSize.s15),
                                    ),
                                    Text(
                                      'Welding (10)',
                                      style: TextStyle(
                                          fontFamily: FontConstants.fontFamily2,
                                          color: ColorManager.appbarcolor,
                                          fontWeight: FontWeightManager.bold,
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
                                          'Order No :',
                                          style: TextStyle(
                                              fontFamily:
                                                  FontConstants.fontFamily2,
                                              color: ColorManager.black,
                                              //fontWeight: FontWeightManager.bold,
                                              fontSize: FontSize.s16),
                                        ),
                                        Text(
                                          '123456789',
                                          style: TextStyle(
                                              fontFamily:
                                                  FontConstants.fontFamily2,
                                              color: ColorManager.black,
                                              //fontWeight: FontWeightManager.bold,
                                              fontSize: FontSize.s16),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Item :  ',
                                          style: TextStyle(
                                              fontFamily:
                                                  FontConstants.fontFamily2,
                                              color: ColorManager.black,
                                              //fontWeight: FontWeightManager.bold,
                                              fontSize: FontSize.s16),
                                        ),
                                        Text(
                                          '100',
                                          style: TextStyle(
                                              fontFamily:
                                                  FontConstants.fontFamily2,
                                              color: ColorManager.black,
                                              fontWeight: FontWeightManager.bold,
//fontWeight: FontWeightManager.bold,
                                              fontSize: FontSize.s15),
                                        ),
                                      ],
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
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Yield',
                                          style: TextStyle(
                                              fontFamily:
                                                  FontConstants.fontFamily2,
                                              color: ColorManager.black,
                                              //fontWeight: FontWeightManager.bold,
                                              fontSize: FontSize.s16),
                                        ),
                                        SizedBox(
                                          height:
                                              MediaQuery.of(context).size.height /
                                                  60,
                                        ),
                                        Text(
                                          '100',
                                          style: TextStyle(
                                              fontFamily:
                                                  FontConstants.fontFamily2,
                                              color: ColorManager.black,
                                              fontWeight: FontWeightManager.bold,
//fontWeight: FontWeightManager.bold,
                                              fontSize: FontSize.s15),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Rework',
                                          style: TextStyle(
                                              fontFamily:
                                                  FontConstants.fontFamily2,
                                              color: ColorManager.black,
                                              //fontWeight: FontWeightManager.bold,
                                              fontSize: FontSize.s16),
                                        ),
                                        SizedBox(
                                          height:
                                              MediaQuery.of(context).size.height /
                                                  60,
                                        ),
                                        Text(
                                          '0',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily:
                                                  FontConstants.fontFamily2,
                                              color: ColorManager.black,
                                              fontWeight: FontWeightManager.bold,
//fontWeight: FontWeightManager.bold,
                                              fontSize: FontSize.s15),
                                        ),
                                      ],
                                    ),

                                    //Expanded(child: Text(' ')),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Rejection',
                                          style: TextStyle(
                                              fontFamily:
                                                  FontConstants.fontFamily2,
                                              color: ColorManager.black,
                                              //fontWeight: FontWeightManager.bold,
                                              fontSize: FontSize.s16),
                                        ),
                                        SizedBox(
                                          height:
                                              MediaQuery.of(context).size.height /
                                                  60,
                                        ),
                                        Text(
                                          '0',
                                          style: TextStyle(
                                              fontFamily:
                                                  FontConstants.fontFamily2,
                                              color: ColorManager.black,
                                              fontWeight: FontWeightManager.bold,
//fontWeight: FontWeightManager.bold,
                                              fontSize: FontSize.s15),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      height:
                                          MediaQuery.of(context).size.height / 25,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (_) => PopUp());
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              ColorManager.buttongridecolor,
                                        ),
                                        child: Text(
                                          'Edit',
                                          style: TextStyle(
                                              fontFamily:
                                                  FontConstants.fontFamily2,
                                              color: ColorManager.appbarcolor,
                                              fontWeight: FontWeightManager.bold,
                                              fontSize: FontSize.s15),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      height:
                                          MediaQuery.of(context).size.height / 25,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              ColorManager.appbarcolor,
                                        ),
                                        child: Text(
                                          'Save',
                                          style: TextStyle(
                                              fontFamily:
                                                  FontConstants.fontFamily2,
                                              color: ColorManager.white,
                                              fontWeight: FontWeightManager.bold,
                                              fontSize: FontSize.s15),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // SizedBox(
                                //   height: 15,
                                // ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ))
        ],
      )),
    );
  }
}
