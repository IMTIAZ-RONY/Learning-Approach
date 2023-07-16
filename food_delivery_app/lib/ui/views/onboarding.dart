import 'package:flutter/material.dart';
import 'package:food_delivery_app/ui/route/routes.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:onboarding_intro_screen/onboarding_screen.dart';

import 'auth/login.dart';
class OnBoarding extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:
       OnBoardingScreen(
        onSkip: () {
          Get.toNamed(home);//use route

        final box=GetStorage();
        box.write("value", "true");

        },
        showPrevNextButton: true,
        showIndicator: true,
        backgourndColor: Colors.white,
        activeDotColor: Colors.blue,
        deactiveDotColor: Colors.grey,
        iconColor: Colors.black,
        leftIcon: Icons.arrow_circle_left_rounded,
        rightIcon: Icons.arrow_circle_right_rounded,
        iconSize: 30,
        pages: [
          item("https://cdn.pixabay.com/photo/2016/03/05/19/02/abstract-1238247_1280.jpg", 'Hot Burger',"Where are Pizza lover?come first and take first" ),
          item("https://cdn.pixabay.com/photo/2017/08/01/13/31/coffee-2565441_1280.jpg","Coffee With Friends" ,"It is a romantic moment when we time pass coffee with friends"),
          item("https://cdn.pixabay.com/photo/2016/03/05/21/46/american-1239081_1280.jpg"," Pizza","Burger test is incridiable "),
          item("https://cdn.pixabay.com/photo/2017/01/06/17/18/caramel-1958358_1280.jpg", "Delicious Pudding", "Pudding lover are many  "),
         ]
      ),
    );
  }
}
OnBoardingModel item(imageUrl,title,description){
  return OnBoardingModel(
    image: Image.network(imageUrl,fit:BoxFit.fill ,),
    title: title,
    body: description,
  );
}
