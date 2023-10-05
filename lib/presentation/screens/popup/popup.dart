import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
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
                                Text(
                                  'Operation Quantity',
                                  style: TextStyle(
                                      color: ColorManager.faintb,
                                      fontSize: FontSize.s15,
                                      fontFamily: FontConstants.fontFamily2,
                                      fontWeight: FontWeightManager.bold),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 55,
                                ),
                                Text(
                                  widget.quantity,
                                  style: const TextStyle(
                                      fontSize: FontSize.s15,
                                      fontFamily: FontConstants.fontFamily2,
                                      fontWeight: FontWeightManager.bold),
                                ),
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
                                    Text(
                                      'Yield',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              50,
                                          fontFamily: FontConstants.fontFamily2,
                                          fontWeight:
                                              FontWeightManager.regular),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          18,
                                    ),
                                    Text(
                                      'Rework',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              50,
                                          fontFamily: FontConstants.fontFamily2,
                                          fontWeight:
                                              FontWeightManager.regular),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          20,
                                    ),
                                    Text(
                                      'Rejection',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              50,
                                          fontFamily: FontConstants.fontFamily2,
                                          fontWeight:
                                              FontWeightManager.regular),
                                    ),
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
                                        focusNode : fieldOne,
                                        onFieldSubmitted : (value){
                                          FocusScope.of(context).requestFocus(fieldTwo);
                                        },
                                        // cursorHeight: 18,
                                        textAlign: TextAlign.start,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        // controller: _NumberController,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          // hintText: AppString.email,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                                        focusNode : fieldTwo,
                                        onFieldSubmitted : (value){
                                          FocusScope.of(context).requestFocus(fieldThree);
                                        },
                                        //cursorHeight: 18,
                                        textAlign: TextAlign.start,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        // controller: _NumberController,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          // hintText: AppString.email,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                                        focusNode : fieldThree,
                                        onFieldSubmitted : (value){
                                          FocusScope.of(context).requestFocus(fieldFour);
                                        },
                                        // cursorHeight: 18,
                                        textAlign: TextAlign.start,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        // controller: _NumberController,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          // hintText: AppString.email,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],

                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     Text(
                            //       'Rework',
                            //       style: TextStyle(
                            //           color: ColorManager.faintb,
                            //           fontSize: FontSize.s15,
                            //           fontFamily: FontConstants.fontFamily2,
                            //           fontWeight: FontWeightManager.bold),
                            //     ),
                            //     SizedBox(
                            //       height: MediaQuery.of(context).size.height / 55,
                            //     ),
                            //     Text(
                            //       '0',
                            //       style: TextStyle(
                            //           fontSize: FontSize.s15,
                            //           fontFamily: FontConstants.fontFamily2,
                            //           fontWeight: FontWeightManager.bold),
                            //     ),
                            //     SizedBox(
                            //       height: MediaQuery.of(context).size.height / 23,
                            //     ),
                            //     Text(
                            //       'Rework',
                            //       style: TextStyle(
                            //           fontSize: FontSize.s15,
                            //           fontFamily: FontConstants.fontFamily2,
                            //           fontWeight: FontWeightManager.regular),
                            //     ),
                            //     SizedBox(
                            //       height: AppSize.s45,
                            //       width: MediaQuery.of(context).size.width / 4.5,
                            //       child: TextFormField(
                            //         textAlign: TextAlign.start,
                            //         textAlignVertical: TextAlignVertical.top,
                            //         // controller: _NumberController,
                            //         keyboardType: TextInputType.number,
                            //         decoration: InputDecoration(
                            //           // hintText: AppString.email,
                            //           border: OutlineInputBorder(
                            //             borderRadius: BorderRadius.circular(10),
                            //           ),
                            //         ),
                            //       ),
                            //     )
                            //   ],
                            // ),
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     // Text(
                            //     //   'Rejection',
                            //     //   style: TextStyle(
                            //     //       color: ColorManager.faintb,
                            //     //       fontSize: FontSize.s15,
                            //     //       fontFamily: FontConstants.fontFamily2,
                            //     //       fontWeight: FontWeightManager.bold),
                            //     // ),
                            //     // SizedBox(
                            //     //   height: MediaQuery.of(context).size.height / 55,
                            //     // ),
                            //     // Text(
                            //     //   '0',
                            //     //   style: TextStyle(
                            //     //       fontSize: FontSize.s15,
                            //     //       fontFamily: FontConstants.fontFamily2,
                            //     //       fontWeight: FontWeightManager.bold),
                            //     // ),
                            //     SizedBox(
                            //       height: MediaQuery.of(context).size.height / 20,
                            //     ),
                            //     Text(
                            //       'Rejection',
                            //       style: TextStyle(
                            //           fontSize: FontSize.s15,
                            //           fontFamily: FontConstants.fontFamily2,
                            //           fontWeight: FontWeightManager.regular),
                            //     ),
                            //     SizedBox(
                            //       height: AppSize.s45,
                            //       width: MediaQuery.of(context).size.width / 4.5,
                            //       child: TextFormField(
                            //         textAlign: TextAlign.start,
                            //         textAlignVertical: TextAlignVertical.top,
                            //         // controller: _NumberController,
                            //         keyboardType: TextInputType.number,
                            //         decoration: InputDecoration(
                            //           // hintText: AppString.email,
                            //           border: OutlineInputBorder(
                            //             borderRadius: BorderRadius.circular(10),
                            //           ),
                            //         ),
                            //       ),
                            //     )
                            //   ],
                            // ),
                          ],
                        ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height / 15,
                        // ),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     const Text(
                        //       'Activity Type',
                        //       style: TextStyle(
                        //         fontFamily: FontConstants.fontFamily2,
                        //         fontWeight: FontWeightManager.bold,
                        //         fontSize: FontSize.s15,
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       height: MediaQuery.of(context).size.height / 90,
                        //     ),
                        //     Container(
                        //         decoration: BoxDecoration(
                        //             border:
                        //                 Border.all(color: Colors.grey, width: 1),
                        //             borderRadius: BorderRadius.circular(10)),
                        //         padding: EdgeInsets.all(AppPadding.p8),
                        //         height: AppSize.s45,
                        //         child: DropdownButton(
                        //           hint: Text("Select"),
                        //           value: valueChoose,
                        //           underline: SizedBox(),
                        //           isExpanded: true,
                        //           icon: Icon(Icons.keyboard_arrow_down_outlined),
                        //           iconSize: AppSize.s36,
                        //           dropdownColor: ColorManager.white,
                        //           style: TextStyle(
                        //             color: ColorManager.black,
                        //           ),
                        //           onChanged: (val) {
                        //             setState(() {
                        //               valueChoose = val as String?;
                        //             });
                        //           },
                        //           items: ListItems.map((ValueItem) {
                        //             return DropdownMenuItem(
                        //               child: Text(ValueItem),
                        //               value: ValueItem,
                        //             );
                        //           }).toList(),
                        //         ))
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height / 20,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Text(
                        //           'Down Time Code',
                        //           style: TextStyle(
                        //               fontSize: FontSize.s15,
                        //               fontFamily: FontConstants.fontFamily2,
                        //               fontWeight: FontWeightManager.bold),
                        //         ),
                        //         SizedBox(
                        //           height: MediaQuery.of(context).size.height / 80,
                        //         ),
                        //         Container(
                        //             decoration: BoxDecoration(
                        //                 border: Border.all(
                        //                     color: Colors.grey, width: 1),
                        //                 borderRadius: BorderRadius.circular(10)),
                        //             padding: EdgeInsets.all(AppPadding.p8),
                        //             height: AppSize.s45,
                        //             width:
                        //                 MediaQuery.of(context).size.width / 4.5,
                        //             child: DropdownButton(
                        //               hint: Text("Select"),
                        //               value: valueChoose,
                        //               underline: SizedBox(),
                        //               isExpanded: true,
                        //               icon: Icon(
                        //                   Icons.keyboard_arrow_down_outlined),
                        //               onChanged: (val) {
                        //                 setState(() {
                        //                   valueChoose = val as String?;
                        //                 });
                        //               },
                        //               items: ListItems.map((ValueItem) {
                        //                 return DropdownMenuItem(
                        //                   child: Text(ValueItem),
                        //                   value: ValueItem,
                        //                 );
                        //               }).toList(),
                        //             ))
                        //       ],
                        //     ),
                        //     Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Text(
                        //           'Down Time',
                        //           style: TextStyle(
                        //               fontSize: FontSize.s15,
                        //               fontFamily: FontConstants.fontFamily2,
                        //               fontWeight: FontWeightManager.bold),
                        //         ),
                        //         SizedBox(
                        //           height: MediaQuery.of(context).size.height / 80,
                        //         ),
                        //         Container(
                        //             decoration: BoxDecoration(
                        //                 border: Border.all(
                        //                     color: Colors.grey, width: 1),
                        //                 borderRadius: BorderRadius.circular(10)),
                        //             padding: EdgeInsets.all(AppPadding.p8),
                        //             height: AppSize.s45,
                        //             width:
                        //                 MediaQuery.of(context).size.width / 4.5,
                        //             child: DropdownButton(
                        //               hint: Text("Select"),
                        //               value: valueChoose,
                        //               underline: SizedBox(),
                        //               isExpanded: true,
                        //               icon: Icon(
                        //                   Icons.keyboard_arrow_down_outlined),
                        //               onChanged: (val) {
                        //                 setState(() {
                        //                   valueChoose = val as String?;
                        //                 });
                        //               },
                        //               items: ListItems.map((ValueItem) {
                        //                 return DropdownMenuItem(
                        //                   child: Text(ValueItem),
                        //                   value: ValueItem,
                        //                 );
                        //               }).toList(),
                        //             ))
                        //       ],
                        //     ),
                        //     Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Text(
                        //           'UOM Down Time',
                        //           style: TextStyle(
                        //               fontSize: FontSize.s15,
                        //               fontFamily: FontConstants.fontFamily2,
                        //               fontWeight: FontWeightManager.bold),
                        //         ),
                        //         SizedBox(
                        //           height: MediaQuery.of(context).size.height / 80,
                        //         ),
                        //         Container(
                        //             decoration: BoxDecoration(
                        //                 border: Border.all(
                        //                     color: Colors.grey, width: 1),
                        //                 borderRadius: BorderRadius.circular(10)),
                        //             padding: EdgeInsets.all(AppPadding.p8),
                        //             height: AppSize.s45,
                        //             width:
                        //                 MediaQuery.of(context).size.width / 4.5,
                        //             child: DropdownButton(
                        //               hint: Text("Select"),
                        //               value: valueChoose,
                        //               underline: SizedBox(),
                        //               isExpanded: true,
                        //               icon: Icon(
                        //                   Icons.keyboard_arrow_down_outlined),
                        //               onChanged: (val) {
                        //                 setState(() {
                        //                   valueChoose = val as String?;
                        //                 });
                        //               },
                        //               items: ListItems.map((ValueItem) {
                        //                 return DropdownMenuItem(
                        //                   child: Text(ValueItem),
                        //                   value: ValueItem,
                        //                 );
                        //               }).toList(),
                        //             ))
                        //       ],
                        //     )
                        //   ],
                        // ),
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
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                        fontFamily: FontConstants.fontFamily2,
                                        color: ColorManager.faintblue,
                                        fontWeight: FontWeightManager.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                50),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
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
                                  child: Text(
                                    'Save',
                                    style: TextStyle(
                                        fontFamily: FontConstants.fontFamily2,
                                        color: ColorManager.white,
                                        fontWeight: FontWeightManager.regular,
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                50),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.end,
                          //   children: [
                          //     SizedBox(
                          //       height: MediaQuery.of(context).size.height / 20,
                          //       width: MediaQuery.of(context).size.width / 14,
                          //       child: TextButton(
                          //         onPressed: () {
                          //           Navigator.pop(context);
                          //         },
                          //         child: Text(
                          //           'Cancel',
                          //           style: TextStyle(
                          //             fontSize:
                          //                 MediaQuery.of(context).size.width /
                          //                     100,
                          //             fontFamily: FontConstants.fontFamily2,
                          //             fontWeight: FontWeightManager.bold,
                          //             color: ColorManager.faintblue,
                          //           ),
                          //         ),
                          //         style: TextButton.styleFrom(
                          //             shape: StadiumBorder()),
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       height: MediaQuery.of(context).size.height / 20,
                          //       width: MediaQuery.of(context).size.width / 14,
                          //       child: TextButton(
                          //         onPressed: () {
                          //           Navigator.pop(context);
                          //         },
                          //         style: TextButton.styleFrom(
                          //             shape: StadiumBorder(),
                          //             backgroundColor: ColorManager.faintblue),
                          //         child: Text(
                          //           'Save',
                          //           style: TextStyle(
                          //             fontSize:
                          //                 MediaQuery.of(context).size.width /
                          //                     100,
                          //             fontFamily: FontConstants.fontFamily2,
                          //             fontWeight: FontWeightManager.bold,
                          //             color: Colors.white,
                          //           ),
                          //         ),
                          //       ),
                          //     )
                          //   ],
                          // ),
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
