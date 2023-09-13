import 'package:flutter/material.dart';

import '../resources/value_manager.dart';

Widget ButtonWidget({
  required String buttonText,
  required Color buttonColor,
  required Color textColor,
  required FontWeight fontWeight,
  required double fontSize,
  required VoidCallback onPressed,
  required String fontFamily,
}) {
  return Padding(
    padding: const EdgeInsets.only(),
    child: SizedBox(
      width: double.infinity,
      height: AppSize.s50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: buttonColor,
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: textColor,
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),
        ),
      ),
    ),
  );
}
