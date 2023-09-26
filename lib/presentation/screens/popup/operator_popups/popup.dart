import 'package:flutter/material.dart';
import 'package:pum_operator/presentation/screens/operator_screens/operator_order_screen.dart';

import '../../../../resources/color_manager.dart';
import '../../../../resources/font_manager.dart';
import '../../../../resources/value_manager.dart';

class PopUp extends StatefulWidget {
  PopUp({super.key});

  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  TextEditingController _NumberController1 = TextEditingController();
  TextEditingController _NumberController2 = TextEditingController();
  TextEditingController _NumberController3 = TextEditingController();
  String? valueChoose;
  List ListItems = ["Item 1", "Item 2", "Item 3"];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 1.3,
            width: MediaQuery.of(context).size.width / 1.1,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(AppPadding.p16),
              child: Material(
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
                                height: MediaQuery.of(context).size.height / 55,
                              ),
                              Text(
                                '100',
                                style: TextStyle(
                                    fontSize: FontSize.s15,
                                    fontFamily: FontConstants.fontFamily2,
                                    fontWeight: FontWeightManager.bold),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 23,
                              ),
                              Text(
                                'Yield',
                                style: TextStyle(
                                    fontSize: FontSize.s15,
                                    fontFamily: FontConstants.fontFamily2,
                                    fontWeight: FontWeightManager.regular),
                              ),
                              SizedBox(
                                height: AppSize.s45,
                                width: MediaQuery.of(context).size.width / 4.5,
                                child: TextFormField(
                                  textAlign: TextAlign.start,
                                  textAlignVertical: TextAlignVertical.bottom,
                                  controller: _NumberController1,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: '100',
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeightManager.bold),
                                    // hintText: AppString.email,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rework',
                                style: TextStyle(
                                    color: ColorManager.faintb,
                                    fontSize: FontSize.s15,
                                    fontFamily: FontConstants.fontFamily2,
                                    fontWeight: FontWeightManager.bold),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 55,
                              ),
                              Text(
                                '0',
                                style: TextStyle(
                                    fontSize: FontSize.s15,
                                    fontFamily: FontConstants.fontFamily2,
                                    fontWeight: FontWeightManager.bold),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 23,
                              ),
                              Text(
                                'Rework',
                                style: TextStyle(
                                    fontSize: FontSize.s15,
                                    fontFamily: FontConstants.fontFamily2,
                                    fontWeight: FontWeightManager.regular),
                              ),
                              SizedBox(
                                height: AppSize.s45,
                                width: MediaQuery.of(context).size.width / 4.5,
                                child: TextFormField(
                                  textAlign: TextAlign.start,
                                  textAlignVertical: TextAlignVertical.bottom,
                                  controller: _NumberController2,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: " ",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rejection',
                                style: TextStyle(
                                    color: ColorManager.faintb,
                                    fontSize: FontSize.s15,
                                    fontFamily: FontConstants.fontFamily2,
                                    fontWeight: FontWeightManager.bold),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 55,
                              ),
                              Text(
                                '0',
                                style: TextStyle(
                                    fontSize: FontSize.s15,
                                    fontFamily: FontConstants.fontFamily2,
                                    fontWeight: FontWeightManager.bold),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 23,
                              ),
                              Text(
                                'Rejection',
                                style: TextStyle(
                                    fontSize: FontSize.s15,
                                    fontFamily: FontConstants.fontFamily2,
                                    fontWeight: FontWeightManager.regular),
                              ),
                              SizedBox(
                                height: AppSize.s45,
                                width: MediaQuery.of(context).size.width / 4.5,
                                child: TextFormField(
                                  textAlign: TextAlign.start,
                                  textAlignVertical: TextAlignVertical.bottom,
                                  controller: _NumberController3,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                     hintText: " ",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Activity Type',
                            style: TextStyle(
                              fontFamily: FontConstants.fontFamily2,
                              fontWeight: FontWeightManager.bold,
                              fontSize: FontSize.s15,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 90,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.all(AppPadding.p8),
                              height: AppSize.s45,
                              child: DropdownButton(
                                hint: Text("Select"),
                                value: valueChoose,
                                underline: SizedBox(),
                                isExpanded: true,
                                icon: Icon(Icons.keyboard_arrow_down_outlined),
                                iconSize: AppSize.s36,
                                dropdownColor: ColorManager.white,
                                style: TextStyle(
                                  color: ColorManager.black,
                                ),
                                onChanged: (val) {
                                  setState(() {
                                    valueChoose = val as String?;
                                  });
                                },
                                items: ListItems.map((ValueItem) {
                                  return DropdownMenuItem(
                                    child: Text(ValueItem),
                                    value: ValueItem,
                                  );
                                }).toList(),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Down Time Code',
                                style: TextStyle(
                                    fontSize: FontSize.s15,
                                    fontFamily: FontConstants.fontFamily2,
                                    fontWeight: FontWeightManager.bold),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 80,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey, width: 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.all(AppPadding.p8),
                                  height: AppSize.s45,
                                  width:
                                      MediaQuery.of(context).size.width / 4.5,
                                  child: DropdownButton(
                                    hint: Text("Select"),
                                    value: valueChoose,
                                    underline: SizedBox(),
                                    isExpanded: true,
                                    icon: Icon(
                                        Icons.keyboard_arrow_down_outlined),
                                    onChanged: (val) {
                                      setState(() {
                                        valueChoose = val as String?;
                                      });
                                    },
                                    items: ListItems.map((ValueItem) {
                                      return DropdownMenuItem(
                                        child: Text(ValueItem),
                                        value: ValueItem,
                                      );
                                    }).toList(),
                                  ))
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Down Time',
                                style: TextStyle(
                                    fontSize: FontSize.s15,
                                    fontFamily: FontConstants.fontFamily2,
                                    fontWeight: FontWeightManager.bold),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 80,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey, width: 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.all(AppPadding.p8),
                                  height: AppSize.s45,
                                  width:
                                      MediaQuery.of(context).size.width / 4.5,
                                  child: DropdownButton(
                                    hint: Text("Select"),
                                    value: valueChoose,
                                    underline: SizedBox(),
                                    isExpanded: true,
                                    icon: Icon(
                                        Icons.keyboard_arrow_down_outlined),
                                    onChanged: (val) {
                                      setState(() {
                                        valueChoose = val as String?;
                                      });
                                    },
                                    items: ListItems.map((ValueItem) {
                                      return DropdownMenuItem(
                                        child: Text(ValueItem),
                                        value: ValueItem,
                                      );
                                    }).toList(),
                                  ))
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'UOM Down Time',
                                style: TextStyle(
                                    fontSize: FontSize.s15,
                                    fontFamily: FontConstants.fontFamily2,
                                    fontWeight: FontWeightManager.bold),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 80,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey, width: 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.all(AppPadding.p8),
                                  height: AppSize.s45,
                                  width:
                                      MediaQuery.of(context).size.width / 4.5,
                                  child: DropdownButton(
                                    hint: Text("Select"),
                                    value: valueChoose,
                                    underline: SizedBox(),
                                    isExpanded: true,
                                    icon: Icon(
                                        Icons.keyboard_arrow_down_outlined),
                                    onChanged: (val) {
                                      setState(() {
                                        valueChoose = val as String?;
                                      });
                                    },
                                    items: ListItems.map((ValueItem) {
                                      return DropdownMenuItem(
                                        child: Text(ValueItem),
                                        value: ValueItem,
                                      );
                                    }).toList(),
                                  ))
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 4,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  fontSize: FontSize.s16,
                                  fontFamily: FontConstants.fontFamily2,
                                  fontWeight: FontWeightManager.bold,
                                  color: ColorManager.faintblue,
                                ),
                              ),
                              style:
                                  TextButton.styleFrom(shape: StadiumBorder()),
                            ),
                          ),
                          SizedBox(width: 5),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 4,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: TextButton.styleFrom(
                                  shape: StadiumBorder(),
                                  backgroundColor: ColorManager.faintblue),
                              child: Text(
                                'Save',
                                style: TextStyle(
                                  fontSize: FontSize.s16,
                                  fontFamily: FontConstants.fontFamily2,
                                  fontWeight: FontWeightManager.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
