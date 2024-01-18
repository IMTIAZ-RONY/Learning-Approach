
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';

import '../../const/app_color.dart';
import '../../model/intro.dart';
import '../route/routes.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: IntroScreenOnboarding(
            backgroudColor:Colors.transparent ,
            introductionList: introData.map((e) =>
                Introduction(
                    imageHeight:215.h ,
                    titleTextStyle:TextStyle(fontSize:17.sp,fontWeight:FontWeight.w600  ) ,
                    subTitleTextStyle:TextStyle(fontSize:13.sp,fontWeight:FontWeight.w300  ) ,
                    imageUrl:e.image, title: e.title, subTitle:e.description)).toList(),
            foregroundColor:AppColors.mandarinColor ,
            onTapSkipButton:(){Get.toNamed(login);} ,
          )),
    );
  }
}
