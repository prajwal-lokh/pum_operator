import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pum_operator/presentation/screens/popup/forget_pass_popup.dart';
import 'package:pum_operator/resources/theme_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/string_manager.dart';
import '../../../resources/value_manager.dart';
import '../home_screen/home_screen.dart';

class LoginScreenAndroid extends StatefulWidget {
  const LoginScreenAndroid({Key? key}) : super(key: key);

  @override
  State<LoginScreenAndroid> createState() => _LoginScreenAndroidState();
}

class _LoginScreenAndroidState extends State<LoginScreenAndroid> {
  Future<String> checkUserRoleByEmail(String email) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        String role = querySnapshot.docs[0]['role'];
        return role;
      }
      return "guest"; // Default role for users not found in the 'users' collection
    } catch (e) {
      print("Error checking user role by email: $e");
      return "guest";
    }
  }

  bool showSpinner = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  late String email;
  late String Password;
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
                    child: Text(AppString.signinhead,
                        style: RandomConstant.customTextStyle(
                          FontSize.s36,
                          FontConstants.fontFamily1,
                          FontWeightManager.bold,
                          ColorManager.navyblue,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: AppPadding.p55),
                    child: Text(AppString.email,
                        style: LoginTextStyles.customTextStyle),
                  ),
                  const SizedBox(
                    height: AppSize.s10,
                  ),
                  TextFormField(
                    focusNode: fieldOne,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(fieldTow);
                    },
                    cursorColor: ColorManager.black,
                    textAlignVertical: TextAlignVertical.top,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    //textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.alternate_email_outlined,
                        color: ColorManager.lightblue,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorManager.black, width: 1.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorManager.black, width: 1.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
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
                    child: Text(AppString.password,
                        style: LoginTextStyles.customTextStyle),
                  ),
                  const SizedBox(
                    height: AppSize.s10,
                  ),
                  TextFormField(
                    focusNode: fieldTow,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(fieldThree);
                    },
                    cursorColor: ColorManager.black,
                    textAlignVertical: TextAlignVertical.top,
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
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
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorManager.black, width: 1.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorManager.black, width: 1.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
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
                            showDialog(
                                context: context,
                                builder: (_) => ForgetPopup());
                          },
                          child: Text(AppString.forgetpass,
                              style: ThemeManager.customTextStyle(
                                  color: ColorManager.appbarcolor)))
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
                            setState(() {
                              showSpinner = true;
                            });

                            if (_formKey.currentState!.validate()) {
                              try {
                                UserCredential authResult = await FirebaseAuth
                                    .instance
                                    .signInWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );

                                String userEmail = authResult.user!.email!;
                                String userRole =
                                    await checkUserRoleByEmail(userEmail);
                                final SharedPreferences sharedPreferences =
                                    await SharedPreferences.getInstance();
                                sharedPreferences.setString(
                                    'email', _emailController.text);
                                await Center(
                                  child: CircularProgressIndicator(),
                                );

                                if (userRole == "Operator") {
                                  // ignore: use_build_context_synchronously
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeScreen()));
                                  // print('Admin screen');
                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>D))
                                } else {
                                  // ignore: use_build_context_synchronously
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const AlertDialog(
                                          title: Text(AppString.error),
                                          content: Text(AppString.invaliduser),
                                        );
                                      });
                                }
                                setState(() {
                                  showSpinner = false;
                                });
                              } on FirebaseAuthException catch (e) {
                                // ignore: use_build_context_synchronously
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text(AppString.error),
                                        content: Text(e.message!),
                                      );
                                    });
                                print(e.toString());
                              }

                              _emailController.clear();
                              _passwordController.clear();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 2,
                              backgroundColor: ColorManager.appbarcolor),
                          child: Text(AppString.signin,
                              style: ThemeManager.customTextStyle(
                                  color: ColorManager.white)),
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
