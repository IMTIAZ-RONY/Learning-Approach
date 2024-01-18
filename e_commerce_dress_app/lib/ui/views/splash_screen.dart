import 'dart:async';



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../business_logic/controllers/splash_controller.dart';
import '../responsive/size_config.dart';
import '../route/routes.dart';

class Splash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   // SplashController().chooseScreen();

    SizeConfig().init (context);/// if we do not use SizeConfig(),No problem because we already use screenutil package;

    return Scaffold(

      body: Center(
        child: Image.asset("assets/icons/logo.png",width: 100.w,),),

    );
  }
}
