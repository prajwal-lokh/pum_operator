// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../resources/color_manager.dart';
// import '../resources/font_manager.dart';
// import '../resources/string_manager.dart';
// import 'enum.dart';
//
// typedef OnBackButtonTapped();
//
// class AppSideBar extends StatefulWidget {
//   const AppSideBar({
//     super.key,
//     required this.heading,
//     required this.screen,
//     required this.onBackButtonTapped,
//   });
//   final String heading;
//   final OnBackButtonTapped onBackButtonTapped;
//   //final AppScreen screen;
//   @override
//   State<AppSideBar> createState() => _AppSideBarState();
// }
//
// class _AppSideBarState extends State<AppSideBar> {
//   final _auth = FirebaseAuth.instance;
//   late AppScreen grpValue;
//   bool expanded = false;
//   late SharedPreferences loginData;
//   String email = '';
//   void initial() async{
//     loginData = await SharedPreferences.getInstance();
//     setState(() {
//       email = loginData.getString('email')!;
//     });
//   }
//   @override
//   void initState() {
//     grpValue = widget.screen;
//     initial();
//     // TODO: implement initState
//     super.initState();
//   }
//   bool click = true;
//   bool pressed = false;
//   @override
//   Widget build(BuildContext context) {
//     print(MediaQuery.of(context).size.height - 180);
//     return ListView(
//       physics: const NeverScrollableScrollPhysics(),
//       children: [
//         ///sidebar head
//         Container(
//           //color: Colors.red,
//           height: MediaQuery.of(context).size.width / 13,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Expanded(
//                 flex: 2,
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                     top: MediaQuery.of(context).size.width / 40,
//                     left: MediaQuery.of(context).size.width / 80,
//                   ),
//                   child: Text(
//                     widget.heading,
//                     style: GoogleFonts.montserrat(
//                         color: ColorManager.faintblue,
//                         fontWeight: FontWeightManager.bold,
//                        // fontSize: AppSize.s36)
//                         fontSize: MediaQuery.of(context).size.width / 64.1),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           decoration: BoxDecoration(
//             color: ColorManager.sidebar,
//             // border: Border.all(width: 5, color: Colors.red),
//             borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
//           ),
//           height: MediaQuery.of(context).size.height / 0.2,
//           padding: EdgeInsets.only(left: 10, top: 20, bottom: 20, right: 20),
//           // color: ColorManager.primary,
//           child: ListView(
//             //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                  ///dashboard
//                   SideBarElement(
//                     icon: Icons.home_filled, ///dashboard right side logo
//                     value: AppScreen.addItem,
//                     groupValue: grpValue,
//                     label: AppString.Dashbordhead,
//                     onClick: (AppScreen appScreen) {
//                       //setState(() {
//                         if (grpValue != appScreen) {
//                           grpValue = appScreen;
//                           Navigator.pushReplacement(
//                             context,
//                             PageRouteBuilder(
//                                 transitionsBuilder: (_,
//                                     Animation<double> animation,
//                                     __,
//                                     Widget child) {
//                                   return FadeTransition(
//                                       opacity: animation, child: child);
//                                 },
//                                 pageBuilder: (BuildContext context, _, __) =>
//                                     const DashbordScreenview()),
//                           );
//                         }
//                       //});
//                     },
//                   ),
//
//                   ///user management
//                   SideBarElement(
//                     //assetPath: "images/inventory_logo.png",
//                     // Icon(
//                     //   Icons.settings,
//                     //   color: Colors.black,
//                     // ),
//
//                     icon: click == false
//                         ? Icons.supervised_user_circle_outlined
//                         : Icons.supervised_user_circle_rounded,
//                     // color: Colors.white,
//                     value: AppScreen.userMangment,
//                     groupValue: grpValue,
//                     label: AppString.userMangment,
//                     onClick: (AppScreen appScreen) {
//                       //click = !click;
//
//                       // setState(() {
//                         if (grpValue != appScreen) {
//                           grpValue = appScreen;
//                           Navigator.pushReplacement(
//                             context,
//                             PageRouteBuilder(
//                                 transitionsBuilder: (_,
//                                     Animation<double> animation,
//                                     __,
//                                     Widget child) {
//                                   return FadeTransition(
//                                       opacity: animation, child: child);
//                                 },
//                                 pageBuilder: (BuildContext context, _, __) =>
//                                     UserManagemntscreen()),
//                           );
//                         }
//                       // });
//                     },
//                   ),
//                   SizedBox(height: MediaQuery.of(context).size.height / 2.8),
//
//                   SideBarElement(
//                     icon: Icons.logout_outlined,
//                     value: AppScreen.logout,
//                     groupValue: grpValue,
//                     label: 'Logout',
//                     onClick: (AppScreen appScreen) async {
//                       final SharedPreferences
//                       sharedPreferences =
//                           await SharedPreferences.getInstance();
//                       sharedPreferences.setString(
//                           'adminEmail', '');
//                       sharedPreferences.remove(
//                           'adminEmail');
//                       _auth.signOut();
//                       // setState(() {
//                         if (grpValue != appScreen) {
//                           loginData.setBool('login', true);
//                           grpValue = appScreen;
//
//                           Navigator.pushReplacement(
//                             context,
//                             PageRouteBuilder(
//                                 transitionsBuilder: (_,
//                                     Animation<double> animation,
//                                     __,
//                                     Widget child) {
//                                   return FadeTransition(
//                                       opacity: animation, child: child);
//                                 },
//                                 pageBuilder: (BuildContext context, _, __) =>
//                                     LoginScreenWeb()),
//                           );
//                         }
//                       // });
//                     },
//                   ),
//                 ],
//               ),
//               Container(
//                 // color: Colors.purpleAccent,
//                 height: MediaQuery.of(context).size.height - 180 > 460
//                     ? MediaQuery.of(context).size.height - 180 - 200
//                     : MediaQuery.of(context).size.height - 180 - 100,
//
//                 ///sidebar container add text
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(
//                           left: 10, top: 20, bottom: 20, right: 20),
//                       child: Container(
//                         padding: EdgeInsets.only(
//                             left: 5, top: 5, bottom: 5, right: 5),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Expanded(flex: 1, child: Container()),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             Expanded(flex: 2, child: Container()
//                                 // Text("",
//                                 //     style: Theme.of(context)
//                                 //         .textTheme
//                                 //         .subtitle1
//                                 //         ?.copyWith(
//                                 //             color: Colors.red,
//                                 //             fontSize: MediaQuery.of(context)
//                                 //                     .size
//                                 //                     .width /
//                                 //                 80,
//                                 //             fontWeight: FontWeight.w700)
//                                 // ),
//                                 ),
//                           ],
//                         ),
//                       ),
//                     ),
//
//                     ///dashboard
//                     expanded
//                         ? SideBarElement(
//                             // assetPath: "images/material_logo.png",
//                             // Icon(
//                             //   Icons.settings,
//                             //   color: Colors.black,
//                             // ),
//                             icon: Icons.home_filled,
//                             value: AppScreen.material,
//                             groupValue: grpValue,
//                             label: "Text",
//                             onClick: (AppScreen appScreen) {
//                               // setState(() {
//                               //   if (grpValue != appScreen) {
//                               //     grpValue = appScreen;
//                               //     Navigator.pushReplacement(
//                               //       context,
//                               //       PageRouteBuilder(
//                               //           transitionsBuilder: (_,
//                               //               Animation<double> animation,
//                               //               __,
//                               //               Widget child) {
//                               //             return FadeTransition(
//                               //                 opacity: animation, child: child);
//                               //           },
//                               //           pageBuilder:
//                               //               (BuildContext context, _, __) =>
//                               //                   const MaterialScreen()),
//                               //     );
//                               //   }
//                               // });
//                             },
//                           )
//                         : const SizedBox(
//                             height: 1,
//                           ),
//
//                     ///user management
//                     expanded
//                         ? SideBarElement(
//                             // assetPath: "images/storage_logo.png",
//                             // Icon(
//                             //   Icons.settings,
//                             //   color: Colors.black,
//                             // ),
//                             icon: Icons.home_filled,
//                             value: AppScreen.storage,
//                             groupValue: grpValue,
//                             label: "Storage",
//                             onClick: (AppScreen appScreen) {
//                               // setState(() {
//                               //   if (grpValue != appScreen) {
//                               //     grpValue = appScreen;
//                               //     Navigator.pushReplacement(
//                               //       context,
//                               //       PageRouteBuilder(
//                               //           transitionsBuilder: (_,
//                               //               Animation<double> animation,
//                               //               __,
//                               //               Widget child) {
//                               //             return FadeTransition(
//                               //                 opacity: animation, child: child);
//                               //           },
//                               //           pageBuilder:
//                               //               (BuildContext context, _, __) =>
//                               //                   StorageMasterScreen()),
//                               //     );
//                               //   }
//                               // });
//                             },
//                           )
//                         : const SizedBox(
//                             height: 1,
//                           ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class LoginScreenWeb {
// }
//
// class DashbordScreenview {
//   const DashbordScreenview();
// }
//
// typedef OnTapSideBarElement(AppScreen appScreen);
//
// class SideBarElement extends StatelessWidget {
//   const SideBarElement({
//     super.key,
//     required this.value,
//     required this.groupValue,
//     // required this.assetPath,
//     required this.label,
//     required this.onClick,
//     required this.icon,
//   });
//   final AppScreen value;
//   final AppScreen groupValue;
//   final String label;
//   final OnTapSideBarElement onClick;
//   final IconData icon;
//   // final String assetPath;
//   ///sidebar all data
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: 5, top: 20, bottom: 10, right: 10),
//       child: GestureDetector(
//         onTap: () {
//           onClick(value);
//         },
//         child: Container(
//           ///sidebar data border
//           padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
//           decoration: BoxDecoration(
//             border: groupValue == value
//                 ? Border.all(color: ColorManager.navyblue, width: 2)
//                 : const Border.symmetric(),
//             borderRadius: const BorderRadius.all(Radius.circular(15)),
//           ),
//           ///sidebar data
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               ///sidebar icon
//               Expanded(
//                   flex: 1,
//                   child: SizedBox(
//                       // height: 35, width: 35,
//                       child: Icon(
//                     icon,
//                     color: ColorManager.grey,
//                     size: MediaQuery.of(context).size.width / 60,
//                   ))),
//               const SizedBox(
//                 width: 1,
//               ),
//               ///sidebar text
//               Expanded(
//                 flex: 2,
//                 child: Text(label,
//                     style: GoogleFonts.inter(
//                         color: ColorManager.grey,
//                         fontSize: MediaQuery.of(context).size.width / 100,
//                         fontWeight: FontWeight.w700)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
