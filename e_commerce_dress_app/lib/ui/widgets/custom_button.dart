

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/app_color.dart';

Widget customButton(
    String title,
    onPressed,
    ){
  return ElevatedButton(
    onPressed:onPressed ,
    child:Text(title),
    style:ElevatedButton.styleFrom(
      shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(20.r)),
      backgroundColor:AppColors.mandarinColor,
      foregroundColor:AppColors.whiteColor ,
      textStyle:TextStyle(fontSize:16.sp ) ,
      padding:const EdgeInsets.symmetric(horizontal:30 ) ,
    ) ,);
}