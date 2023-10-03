//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pum_operator/presentation/screens/forgot_screen/thank_you.dart';

import '../../../constants/button_constant.dart';
import '../../../resources/asset_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/string_manager.dart';
import '../../../resources/value_manager.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController _verifiedemailController = TextEditingController();
  final auth = FirebaseAuth.instance;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var email = "";

  FocusNode fieldOne = FocusNode();
  FocusNode fieldTow = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorManager.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///forgot heading

            ///email txt
            Padding(
              padding: const EdgeInsets.only(
                  left: AppPadding.p50,
                  right: AppPadding.p50,
                  top: AppPadding.p30),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        AppString.forgotpasshead,
                        style: TextStyle(
                            fontFamily: FontConstants.fontFamily1,
                            fontSize: FontSize.s36,
                            fontWeight: FontWeightManager.bold,
                            color: ColorManager.navyblue),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.s25,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Text(
                          AppString.email,
                          style: TextStyle(
                              fontFamily: FontConstants.fontFamily2,
                              fontSize: FontSize.s15_25,
                              fontWeight: FontWeight.normal,
                              color: ColorManager.grey),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: AppSize.s10,
                  ),

                  ///emailfield
                  Padding(
                    padding: EdgeInsets.only(),
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        focusNode: fieldOne,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(fieldTow);
                        },
                        controller: _verifiedemailController,
                        keyboardType: TextInputType.emailAddress,
                        //textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,

                          //label: Text(AppString.email),
                          // hintText: AppString.email,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(
                            Icons.alternate_email_outlined,
                            color: ColorManager.lightblue,
                          ),
                          // SvgPicture.asset(
                          //   ImageAssets.emailLogo,
                          //   width: AppSize.s12,
                          //   height: AppSize.s12,
                          //   fit: BoxFit.scaleDown,
                          // ),
                        ),
                        validator: (value) {
                          final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value!);

                          if (value!.isEmpty) {
                            return "Enter email";
                          } else if (!emailValid) {
                            return "Enter valid email";
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: AppPadding.p20),
                          child: Text.rich(TextSpan(
                              text: AppString.forgotsubtitle11,
                              style: TextStyle(
                                  fontSize: FontSize.s15,
                                  fontFamily: FontConstants.fontFamily2,
                                  fontWeight: FontWeightManager.regular,
                                  color: ColorManager.faintgrey),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: AppString.request,
                                  style: TextStyle(
                                      fontSize: FontSize.s15,
                                      fontFamily: FontConstants.fontFamily2,
                                      fontWeight: FontWeightManager.bold,
                                      color: ColorManager.grey),
                                )
                              ])),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.s80,
                  ),
                  SizedBox(
                    height: AppSize.s36,
                    width: AppSize.s290,
                    child: ElevatedButton(
                      focusNode: fieldTow,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            await auth
                                .sendPasswordResetEmail(
                                    email: _verifiedemailController.text
                                        .toString())
                                .then((value) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      ThankYouScreen());
                            });
                          } on FirebaseAuthException catch (e) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text(AppString.error),
                                    content: Text(
                                      e.message!,
                                      maxLines: 1,
                                    ),
                                  );
                                });
                            print(e);
                          }
                          _verifiedemailController.clear();
                        }
                      },
                      child: Text(
                        'Request',
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

                  ///button
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
