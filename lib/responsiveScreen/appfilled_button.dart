import 'package:flutter/material.dart';

typedef void OnFilledButtonClick();

class AppFilledButton extends StatelessWidget {
  const AppFilledButton({
    super.key,
    required this.onClick,
    required this.text,
    required this.padding,
    required this.color,
    required this.textStyle,
  });
  final String text;
  final EdgeInsets padding;
  final Color color;
  final OnFilledButtonClick? onClick;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: MaterialButton(
        color: color,
        onPressed: () {
          onClick!();
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: padding,
        child: Text(text, style: textStyle),
      ),
    );
  }
}
