import 'package:aifertest/app/util/app_color.dart';
import 'package:aifertest/app/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'custom_button_widget.dart';

AppBar customAppbar() {
  return AppBar(
    leading: const Icon(
      Icons.arrow_back_ios,
      color: Appcolor.appwhite,
    ),
    backgroundColor: Appcolor.backgroundcolor,
    actions: [
      const CircleAvatar(
        backgroundImage: NetworkImage(AppConstants.newtworkImageProfile),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: CustomBtn(
          text: '',
          onPressed: () {},
        ),
      )
    ],
  );
}
