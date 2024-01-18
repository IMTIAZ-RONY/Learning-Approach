
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/app_color.dart';


Widget customFormField(
    keyboardtype,
    controller,
    context,
    hinttext,
    validator,
    labeltext,
    {
      bool obscureText = false,
      prefixIcon,
      readOnly = false}) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: TextFormField(
      keyboardType: keyboardtype,
      obscureText: obscureText,
      controller: controller,
      readOnly: readOnly,
      validator: validator,
      textInputAction:TextInputAction.next ,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          bottom: 10,
        ),
        hintText: hinttext,
        hintStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
        labelText: labeltext,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 10),
          child: Container(
            width: 40,
            decoration: BoxDecoration(
              color: Color(0xFFFDF2EE),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              prefixIcon,
              color: AppColors.mandarinColor,
              size: 20,
            ),
          ),
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.r)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mandarinColor),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10.r),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}
