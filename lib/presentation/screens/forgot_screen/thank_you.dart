import 'package:flutter/material.dart';

import '../../../constants/button_constant.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/routs_manager.dart';
import '../../../resources/string_manager.dart';
import '../../../resources/value_manager.dart';

class ThankYouScreen extends StatelessWidget {
  ThankYouScreen({super.key});

  FocusNode fieldOne = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: AppSize.s430,
            width: AppSize.s350,
            decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: AppPadding.p75,
                      right: AppPadding.p75,
                      left: AppPadding.p16),
                  child: Padding(
                    padding: EdgeInsets.only(left: AppPadding.p8),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              AppString.thanku,
                              style: TextStyle(
                                fontFamily: FontConstants.fontFamily1,
                                fontSize: FontSize.s36,
                                fontWeight: FontWeightManager.bold,
                                color: ColorManager.navyblue,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              AppString.thankusubtitle1,
                              style: TextStyle(
                                  fontFamily: FontConstants.fontFamily2,
                                  fontSize: FontSize.s14,
                                  color: ColorManager.faintgrey,
                                  fontWeight: FontWeightManager.regular),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              AppString.thankusubtitle2,
                              style: TextStyle(
                                  fontFamily: FontConstants.fontFamily2,
                                  fontSize: FontSize.s14,
                                  color: ColorManager.black,
                                  fontWeight: FontWeightManager.semoBold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppSize.s65,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p20, right: AppPadding.p20),
                  child: SizedBox(
                    height: AppSize.s36,
                    width: AppSize.s210,
                    child: ElevatedButton(
                      autofocus: true,
                      focusNode: fieldOne,
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, Routes.LogIn);
                      },
                      child: Text(
                        'Okay',
                        style: TextStyle(
                            fontFamily: FontConstants.fontFamily2,
                            fontWeight: FontWeightManager.bold,
                            color: ColorManager.white,
                            fontSize: FontSize.s16),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 2,
                          backgroundColor: ColorManager.appbarcolor),
                    ),
                  ),
                ),
              ],
            ),

            ///column
          ),

          ///container
        ],
      ),
    );
  }
}

//Navigator.pushReplacementNamed(context, Routes.LogIn);

// SizedBox(
// height: AppSize.s25,
// ),
// Padding(
// padding: const EdgeInsets.only(
// right: AppPadding.p50,),
// child: Text(
// AppString.thankusubtitle1,
// style: TextStyle(
// fontFamily: FontConstants.fontFamily2,
// fontSize: FontSize.s14,
// color: ColorManager.faintgrey,
// fontWeight: FontWeightManager.regular),
// ),
// ),
// SizedBox(
// height: AppSize.s10,
// ),
// Padding(
// padding: const EdgeInsets.only(
// right: AppPadding.p70, left: AppPadding.p25),
// child: Text(
// AppString.thankusubtitle2,
// style: TextStyle(
// fontFamily: FontConstants.fontFamily2,
// fontSize: FontSize.s14,
// color: ColorManager.black,
// fontWeight: FontWeightManager.semoBold),
// ),
// ),
// SizedBox(
// height: AppSize.s50,
// ),
// Padding(
// padding: const EdgeInsets.all(AppPadding.p20),
// child: ButtonWidget(
// fontFamily: FontConstants.fontFamily2,
// buttonText: AppString.okay,
// buttonColor: ColorManager.primary,
// textColor: ColorManager.white,
// fontWeight: FontWeight.bold,
// fontSize: FontSize.s16,
// onPressed: () {
// Navigator.pushReplacementNamed(context, Routes.LogIn);
// }),
// )
