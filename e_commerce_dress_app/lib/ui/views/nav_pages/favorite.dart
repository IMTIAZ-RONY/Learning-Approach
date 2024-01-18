
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_dress_app/services/firestore_db.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../business_logic/controllers/favorite_controller.dart';
import '../../../const/app_color.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  final controller = Get.find<FavouriteController>();

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          ElevatedButton.icon(onPressed: (){controller.fetch();}, icon:Icon(Icons.adb), label:Text("Icon")),

        Container(
       child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
       child:StreamBuilder(
         stream: FirebaseFirestore.instance
        .collection("favourite")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("items")
        .snapshots(),
    builder: (context, snapshot) {
    if (snapshot.data == null) {
         return Center(
           child: CircularProgressIndicator(),
             );
         } else if (snapshot.hasError) {
           return Center(
         child: Text("something is wrong"),
           );
         }
        return GridView.builder(
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
       ),
        itemCount: snapshot.data!.docs.length,
        itemBuilder: (_, index) {
            var documentSnapshot = snapshot.data!.docs[index].data();
         return InkWell(
         onTap: (){} ,
             child: Card(
             elevation: 10,
          child:
           Image.network(documentSnapshot["images"][0]),
         ),
            );
             });
          })
       ),
       )

    ],
      );
  }
}

/* Container(
            height: 300.h,

            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Obx(
                    () => ListView.builder(
                  itemCount: controller.items.length,
                  itemBuilder: (_, index) {
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Ink(
                            height: 200,
                            width: double.maxFinite,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.grayColor.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: Offset(0, 3))
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: controller.items[index].thumbnail,
                                  height: 100,
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder:
                                      (context, url, progress) => Center(
                                    child: CircularProgressIndicator(
                                      value: progress.progress,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                                Text(
                                  controller.items[index].title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  '\$ ${controller.items[index].price}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            right: 0,
                            child: IconButton(
                                onPressed: () {
                                  FireStoreDB().deleteFromFavourite(
                                      controller.items[index].documentId);
                                  controller.fetch();
                                },
                                icon: Icon(Icons.remove_circle_outline)))
                      ],
                    );
                  },
                ),
              ),
            ),
          ),*/


