import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pum_operator/resources/string_manager.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/theme_manager.dart';
import '../../../resources/value_manager.dart';

class PopUp extends StatefulWidget {
  final String quantity;
  PopUp({super.key, required this.quantity});

  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  TextEditingController _NumberController = TextEditingController();
  String? valueChoose;

  FocusNode fieldOne = FocusNode();
  FocusNode fieldTwo = FocusNode();
  FocusNode fieldThree = FocusNode();
  FocusNode fieldFour = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 2.7,
            width: MediaQuery.of(context).size.width / 1.5,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 30,
                bottom: MediaQuery.of(context).size.height / 50,
                left: MediaQuery.of(context).size.width / 60,
                //right: MediaQuery.of(context).size.width / 30,
              ),
              child: Material(
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false),
                  child: ListView(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(AppString.operationquantity,
                                    style: RandomColor.customTextStyle(
                                        color: ColorManager.faintb)),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 55,
                                ),
                                Text(widget.quantity,
                                    style: RandomColor.customTextStyle(
                                        color: ColorManager.appbarcolor)),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 19,
                                ),

                                ///txt
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          120,
                                    ),
                                    Text(AppString.yield,
                                        style: PopupConstant.customTextStyle(
                                            context, ColorManager.black)),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          15,
                                    ),
                                    Text(AppString.rework,
                                        style: PopupConstant.customTextStyle(
                                            context, ColorManager.black)),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          20,
                                    ),
                                    Text(AppString.rejection,
                                        style: PopupConstant.customTextStyle(
                                            context, ColorManager.black)),
                                  ],
                                ),

                                ///txtfield
                                Row(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      width: MediaQuery.of(context).size.width /
                                          10,
                                      alignment: Alignment.center,
                                      child: TextFormField(
                                        focusNode: fieldOne,
                                        onFieldSubmitted: (value) {
                                          FocusScope.of(context)
                                              .requestFocus(fieldTwo);
                                        },
                                        // cursorHeight: 18,
                                        textAlign: TextAlign.start,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        // controller: _NumberController,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10),
                                          // hintText: AppString.email,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color:
                                                    ColorManager.navybluenew),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          80,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      width: MediaQuery.of(context).size.width /
                                          10,
                                      child: TextFormField(
                                        focusNode: fieldTwo,
                                        onFieldSubmitted: (value) {
                                          FocusScope.of(context)
                                              .requestFocus(fieldThree);
                                        },
                                        //cursorHeight: 18,
                                        textAlign: TextAlign.start,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        // controller: _NumberController,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10),
                                          // hintText: AppString.email,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color:
                                                    ColorManager.navybluenew),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          70,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      //height: AppSize.s36,
                                      width: MediaQuery.of(context).size.width /
                                          10,
                                      child: TextFormField(
                                        focusNode: fieldThree,
                                        onFieldSubmitted: (value) {
                                          FocusScope.of(context)
                                              .requestFocus(fieldFour);
                                        },
                                        // cursorHeight: 18,
                                        textAlign: TextAlign.start,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        // controller: _NumberController,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10),
                                          // hintText: AppString.email,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color:
                                                    ColorManager.navybluenew),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 18,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width / 50,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 7,
                                height: MediaQuery.of(context).size.height / 20,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(AppString.cancle,
                                      style: PopupConstant.customTextStyle(
                                          context, ColorManager.faintblue)),
                                ),
                              ),
                              const SizedBox(
                                width: AppSize.s16,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 7,
                                height: MediaQuery.of(context).size.height / 20,
                                child: TextButton(
                                  autofocus: true,
                                  focusNode: fieldFour,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: ColorManager.appbarcolor,
                                  ),
                                  child: Text(AppString.save,
                                      style: PopupConstant.customTextStyle(
                                          context, ColorManager.white)),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
