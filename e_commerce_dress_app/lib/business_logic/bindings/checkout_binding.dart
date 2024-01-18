
import 'package:e_commerce_dress_app/business_logic/controllers/checkout_controller.dart';
import 'package:get/get.dart';

class CheckoutBinding implements Bindings{
  @override
  void dependencies(){
    Get.put(CheckoutController());
  }
}