//import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get.dart';
//import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../model/cart.dart';
import '../../services/firestore_db.dart';

class CartController extends GetxController {
  RxList<UserCart> items = RxList<UserCart>([]);

  fetch() async {
    var cartItems = await FireStoreDB().getCartItems();
    items.value = cartItems;
  }

  @override
  void onInit() {
    fetch();
    super.onInit();
  }

  int get getTotal =>
      items.fold(0, (previousValue, element) => previousValue + element.price);
}