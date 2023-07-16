import 'package:flutter/material.dart';
import 'package:food_delivery_app/const/app_string.dart';
import 'package:food_delivery_app/ui/route/routes.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import '../style/app_styles.dart';
import 'onboarding.dart';

class SplashScreen extends StatefulWidget {



  @override
  State<SplashScreen> createState() => _SplashScreenState();


}

class _SplashScreenState extends State<SplashScreen> {
  chooseScreen(){
    final box=GetStorage();
    final value=box.read("value");
    if(value==true){
      Get.toNamed(home);
    }else{
      Get.toNamed(onboarding);
    }
  }
@override
  void initState() {
    Future.delayed (Duration(seconds:3 ),
        ()=>chooseScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center
        (
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center ,
            children: [
              Text(AppStrings.appName,style:AppStyles().fontSize ,),
              SizedBox(height:10 ,),
              LinearProgressIndicator(backgroundColor:Colors.deepPurple ,
              color:Colors.yellowAccent ,
              ),

            ],
          )) ,
    );
  }
}
