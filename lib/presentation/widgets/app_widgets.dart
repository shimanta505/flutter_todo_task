import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

InputDecoration textFormInputDecoration(String hintText) => InputDecoration(
  hintText: hintText,
  hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
  contentPadding: EdgeInsets.only(top: 5, bottom: 5, left: 5),
  filled: true,
  fillColor: Colors.white,

  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.green, width: 2),
    gapPadding: 0,
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: AppColors.greyYellow, width: 2),
    gapPadding: 0,
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: AppColors.greyYellow, width: 2),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: AppColors.greyYellow, width: 2),
  ),
);
