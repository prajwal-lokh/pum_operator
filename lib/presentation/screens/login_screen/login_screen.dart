import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../constants/button_constant.dart';
import '../../../resources/asset_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/string_manager.dart';
import '../../../resources/value_manager.dart';
import '../forgot_screen/forgot_pass_screen.dart';
import '../home_screen/home_screen.dart';

//
class LoginScreenAndroid extends StatefulWidget {
  const LoginScreenAndroid({Key? key}) : super(key: key);

  @override
  State<LoginScreenAndroid> createState() => _LoginScreenAndroidState();
}

class _LoginScreenAndroidState extends State<LoginScreenAndroid> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  late String email;
  late String Password;
  bool showSpinner = false;
  String password = '';
  bool isPasswordVisible = true;

  FocusNode fieldOne = FocusNode();
  FocusNode fieldTow = FocusNode();
  FocusNode fieldThree = FocusNode();

  @override
  Widget build(BuildContext context) {
    return _getLogin();
  }

  Widget _getLogin() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: AppPadding.p130),
                    child: Text(
                      AppString.signinhead,
                      style: TextStyle(
                          fontFamily: FontConstants.fontFamily1,
                          fontSize: FontSize.s36,
                          color: ColorManager.navyblue,
                          fontWeight: FontWeightManager.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: AppPadding.p55),
                    child: Text(
                      AppString.email,
                      style: TextStyle(
                          fontFamily: FontConstants.fontFamily1,
                          fontSize: FontSize.s15_25,
                          fontWeight: FontWeightManager.medium,
                          color: ColorManager.faintgrey),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s10,
                  ),
                  TextFormField(
                    focusNode: fieldOne,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(fieldTow);
                    },
                    textAlignVertical: TextAlignVertical.top,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    //textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      //filled: true,
                      //label: const Text(AppString.email),
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
                    // onChanged: (value){
                    //   email = value;
                    //
                    // },
                    validator: (value) {
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!);
                      if (value!.isEmpty) {
                        return AppString.Enteremail;
                      } else if (!emailValid) {
                        return AppString.Entervalidemail;
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: AppPadding.p28),
                    child: Text(
                      AppString.password,
                      style: TextStyle(
                          fontFamily: FontConstants.fontFamily1,
                          fontSize: FontSize.s15_25,
                          fontWeight: FontWeightManager.medium,
                          color: ColorManager.faintgrey),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s10,
                  ),
                  TextFormField(
                    focusNode: fieldTow,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(fieldThree);
                    },
                    textAlignVertical: TextAlignVertical.top,
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        //label: Text(AppString.password),
                        // hintText: AppString.password,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: ColorManager.lightblue,
                        ),
                        suffixIcon: IconButton(
                          icon: isPasswordVisible
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppString.Enterpassword;
                      } else if (_passwordController.text.length < 6) {
                        return AppString.passwordlength;
                      }
                    },
                    obscureText: isPasswordVisible,
                  ),
                  const SizedBox(
                    height: AppSize.s16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ForgotPasswordScreen()));
                          },
                          child: Text(
                            AppString.forgetpass,
                            style: TextStyle(
                                fontFamily: FontConstants.fontFamily1,
                                fontSize: FontSize.s16,
                                color: ColorManager.appbarcolor,
                                fontWeight: FontWeightManager.regular),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.s40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: AppSize.s36,
                        width: AppSize.s290,
                        child: ElevatedButton(
                          focusNode: fieldThree,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                final user =
                                    await _auth.signInWithEmailAndPassword(
                                        email: _emailController.text,
                                        password: _passwordController.text);
                                user != null
                                    ? Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen()))
                                    : print(AppString.error);
                              } on FirebaseAuthException catch (e) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(AppString.errormsg),
                                        content: Text(e.message!),
                                      );
                                    });
                                print(e.toString());
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 2,
                              backgroundColor: ColorManager.appbarcolor),
                          child: Text(
                            AppString.signin,
                            style: TextStyle(
                                fontFamily: FontConstants.fontFamily2,
                                fontWeight: FontWeightManager.bold,
                                color: ColorManager.white,
                                fontSize: FontSize.s16),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
