
import 'package:e_commerce_dress_app/services/firestore_db.dart';
import 'package:get/get.dart';
import '../../model/user_favourite.dart';

class FavouriteController extends GetxController {
  RxList<UserFavourite> items = RxList<UserFavourite>([]);

  fetch() async {
    var favItems = await FireStoreDB().getFavouriteItems();
    items.value = favItems;
    print('kamruzzaman :${favItems}');
  }

  @override
  void onInit() {
    fetch();
    super.onInit();
  }
}