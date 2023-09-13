// import 'package:flutter/material.dart';
// import 'package:pum_operator/responsiveScreen/side_bar.dart';
//
// import '../resources/color_manager.dart';
// import 'enum.dart';
//
// typedef void OnClickBack();
//
// class ResponsiveScreen extends StatelessWidget {
//   ResponsiveScreen({
//     Key? key,
//     required this.appBarChildren,
//     required this.appScreen,
//     required this.heading,
//     required this.appBarSpaceChildren,
//     required this.table,
//     required this.tableHeading,
//     required this.tableHeadingIsThere,
//     required this.onBack,
//   }) : super(key: key);
//   final List<Widget> appBarChildren;
//   final List<Widget> appBarSpaceChildren;
//   final AppScreen appScreen;
//   final bool tableHeadingIsThere;
//   final String heading;
//   final OnClickBack onBack;
//   final Widget table;
//   final Widget tableHeading;
//   @override
//   Widget build(BuildContext context) {
//     if (MediaQuery.of(context).size.width > 870) {
//       return Scaffold(
//         backgroundColor: Colors.white,
//         body: Container(
//           // decoration: BoxDecoration(
//           //   color: ColorManager.sidebarcolor,
//           //   // border: Border.all(width: 5, color: Colors.red),
//           //   borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
//           // ),
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           child: Row(
//             children: [
//               Expanded(
//                   flex: 1,
//                   child: Container(
//                     //color: Colors.green,
//                     color: Color(0xffF6F6F6),
//                     height: MediaQuery.of(context).size.height,
//                     child: ScrollConfiguration(
//                       behavior: ScrollConfiguration.of(context)
//                           .copyWith(scrollbars: false),
//                       child: ListView(
//                         physics: NeverScrollableScrollPhysics(),
//                         children: [
//                           MediaQuery.of(context).size.width > 780
//                               ? Container(
//                                   color: ColorManager.white,
//                                   child: Padding(
//                                     padding: EdgeInsets.all(
//                                         MediaQuery.of(context).size.height /
//                                             80),
//                                     child: Image.asset(
//                                       "images/pheonixmecano.png",
//                                       // width: double.minPositive,
//                                       // width: MediaQuery.of(context).size.width / 2,
//                                     ),
//                                   ),
//                                 )
//                               : const SizedBox(
//                                   height: 40,
//                                 ),
//                           Container(
//                             height: MediaQuery.of(context).size.height - 60,
//                             decoration: BoxDecoration(
//                               color: ColorManager.white,
//                               //borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(20))
//                             ),
//                             // height: MediaQuery.of(context).size.height - 100,
//                             child: AppSideBar(
//                                 heading: heading,
//                                 screen: appScreen,
//                                 onBackButtonTapped: () {
//                                   onBack();
//                                 }),
//                           )
//                         ],
//                       ),
//                     ),
//                   )),
//               Expanded(
//                   flex: 5,
//                   child: Container(
//                     height: MediaQuery.of(context).size.height,
//                     child: Stack(
//                       children: [
//                         Container(
//                           //color: Colors.blue,
//                           height: 220,
//                           child: ScrollConfiguration(
//                             behavior: ScrollConfiguration.of(context)
//                                 .copyWith(scrollbars: false),
//                             child: ListView(
//                               physics: NeverScrollableScrollPhysics(),
//                               children: [
//                                 Container(
//                                   //color: Colors.redAccent,
//                                   height: 120,
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: appBarChildren,
//                                   ),
//                                 ),
//                                 Container(
//                                   // color: Colors.blue,
//                                   height: 60,
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: appBarSpaceChildren,
//                                   ),
//                                 ),
//                                 Container(
//                                   // color: Colors.greenAccent,
//                                   child: tableHeading,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Container(
//                           // color: Colors.pink,
//                           margin: EdgeInsets.only(top: 225),
//                           child: table,
//                         ),
//                       ],
//                     ),
//                   )),
//             ],
//           ),
//         ),
//       );
//     } else if (MediaQuery.of(context).size.width > 600) {
//       return Scaffold(
//         body: Container(
//           height: MediaQuery.of(context).size.height,
//           // color: Colors.orangeAccent,
//           child: Stack(
//             children: [
//               Container(
//                 // color: Colors.brown,
//
//                 height: 220,
//                 child: ScrollConfiguration(
//                   behavior: ScrollConfiguration.of(context)
//                       .copyWith(scrollbars: false),
//                   child: ListView(
//                     physics: NeverScrollableScrollPhysics(),
//                     children: [
//                       Container(
//                         // color: Colors.cyan,
//                         height: 120,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: appBarChildren,
//                         ),
//                       ),
//                       Container(
//                         // color: Colors.green,
//                         height: 60,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: appBarSpaceChildren,
//                         ),
//                       ),
//                       Container(
//                         // color: Colors.pinkAccent,
//                         child: tableHeading,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 // color: Colors.redAccent,
//                 margin: EdgeInsets.only(top: 225),
//                 child: table,
//               ),
//             ],
//           ),
//         ),
//       );
//     } else if (MediaQuery.of(context).size.width > 450) {
//       return Scaffold(
//         body: Container(
//           //color: Colors.lightGreen,
//           height: MediaQuery.of(context).size.height,
//           child: Stack(
//             children: [
//               Container(
//                 // color: Colors.red,
//                 child: ScrollConfiguration(
//                   behavior: ScrollConfiguration.of(context)
//                       .copyWith(scrollbars: false),
//                   child: ListView(
//                     physics: NeverScrollableScrollPhysics(),
//                     children: [
//                       Container(
//                         // color: Colors.greenAccent,
//                         child: tableHeading,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 60),
//                 // color: Colors.greenAccent,
//                 child: table,
//               ),
//             ],
//           ),
//         ),
//       );
//     } else {
//       return Scaffold(
//         body: Center(),
//       );
//     }
//   }
// }
