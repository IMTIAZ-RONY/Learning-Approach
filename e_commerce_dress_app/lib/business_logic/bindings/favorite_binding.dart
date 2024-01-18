

import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controllers/favorite_controller.dart';

class FavouriteBinding implements Bindings{

  @override
  void dependencies() {
    Get.put(FavouriteController());
  }}

