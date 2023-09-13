import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pum_operator/resources/string_manager.dart';

import '../presentation/screens/forgot_screen/forgot_pass_screen.dart';
import '../presentation/screens/login_screen/login_screen.dart';


class Routes{
  static const String LogIn = "/";
  static const String HomeScreen = "/HomeScreen";
  static const String forgetPassword = "/ForgotPasswordScreen";
  static const String userManagemntscreen = "/UserManagemntscreen";
  static const String dashbordScreenview = "/DashbordScreenview";

}

class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.LogIn:
        return MaterialPageRoute(builder: (_)=> LoginScreenAndroid());
      // case Routes.HomeScreen:
      //   return MaterialPageRoute(builder: (_)=> HomeScreen(email: '',));
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_)=> ForgotPasswordScreen());
      // case Routes.userManagemntscreen:
      //   return MaterialPageRoute(builder: (_)=> UserManagemntscreen());
      // case Routes.dashbordScreenview:
      //   return MaterialPageRoute(builder: (_)=>DashbordScreenview());


      default:
        return unDefineRoute();
    }
  }

  static Route<dynamic> unDefineRoute(){
    return MaterialPageRoute(builder: (_)=> Scaffold(
      appBar: AppBar(title: Text(AppString.notFoundRoute),),
      body: Center(child: Text(AppString.notFoundRoute),),
    ));
  }
}