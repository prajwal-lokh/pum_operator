import 'package:flutter/material.dart';
import 'package:pum_operator/resources/font_manager.dart';
import 'package:pum_operator/resources/string_manager.dart';

class ForgetPopup extends StatelessWidget {
  const ForgetPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return  Dialog(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 5,
        width:  MediaQuery.of(context).size.height / 10,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(AppString.forgetpopuptext,
                textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: FontConstants.fontFamily2,
                fontWeight: FontWeightManager.regular,
                fontSize: MediaQuery.of(context).size.width / 40
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
