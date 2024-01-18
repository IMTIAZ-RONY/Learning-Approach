
import 'dart:async';

import 'package:e_commerce_dress_app/ui/route/routes.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController{
  final box=GetStorage();
  chooseScreen(){
    var value=box.read('user');
    if(value==null){
      Get.offAndToNamed(intro);
    }else{
      Get.offAndToNamed(bottomNav);
    }
        }
  @override
  void onInit() {
    Timer(Duration(seconds: 3), () => chooseScreen());
    super.onInit();
  }
  }
