import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex('#79AEF5');
  static Color faintblue = Color(0xff163172);
  static Color faintb = Color(0xff1E56A0);
  static Color grey = Color(0xff8B8781);
  static Color white = HexColor.fromHex('#FFFFFF');
  static Color black = Color(0xfc000000);
  static Color lightblue = Color(0xfc3A74B4);
  static Color buttoncolor = Color(0xfc79AEF5);
  static Color sidebar = Color(0xffF6F6F6);

  static Color navyblue = HexColor.fromHex('#163172');
  static Color faintgrey = HexColor.fromHex('#8B8781');
  static Color faintblueweb = HexColor.fromHex('#3A74B4');
  static Color faintgreybg = HexColor.fromHex('#f5f5f5');
  static Color sidebarcolor = HexColor.fromHex('d3dde8');
  static Color appbarcolor = HexColor.fromHex('#1E56A0');
  static Color buttongridecolor = HexColor.fromHex('#D6E4F0');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF' + hexColorString; //8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
