import 'package:aifertest/app/util/app_color.dart';
import 'package:aifertest/app/util/app_constants.dart';
import 'package:aifertest/app/util/app_style.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final bool iscolorBlack;
  const CustomBtn(
      {super.key,
      required this.onPressed,
      required this.text,
      this.iscolorBlack = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Appcolor.btn1),
            padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 5, horizontal: 10))),
        onPressed: onPressed,
        child: Center(
          child: Text(
            text.isEmpty ? AppConstants.btn1txt : text,
            style: AppStyle.style1.copyWith(
                color: iscolorBlack
                    ? Appcolor.backgroundcolor
                    : Appcolor.appwhite),
          ),
        ));
  }
}
