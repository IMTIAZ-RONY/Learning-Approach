import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_dress_app/services/firestore_db.dart';
import 'package:e_commerce_dress_app/ui/route/routes.dart';
import 'package:e_commerce_dress_app/ui/style/app_styles.dart';
import 'package:e_commerce_dress_app/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../business_logic/controllers/cart_controller.dart';
import '../../../business_logic/controllers/favorite_controller.dart';
import '../../../const/app_color.dart';
import '../../../model/cart.dart';
import '../../../model/products.dart';
import '../../../model/user_favourite.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: RefreshIndicator(
            onRefresh:()=> FireStoreDB().getProducts(),
            child: FutureBuilder(
                future: FireStoreDB().getProducts(),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                          itemCount: snapshot.data!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.60,
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (_, index) {
                            return InkWell(
                              onTap: () => Get.toNamed(details,
                                  arguments: snapshot.data![index]),
                              child: Ink(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(10.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.grayColor.withOpacity(0.5),
                                      blurRadius: 4.r,
                                      spreadRadius: 2.r,
                                      offset: const Offset(0, 3),
                                    )
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: snapshot.data![index].thumbnail,
                                      height: 100.h,
                                      fit: BoxFit.cover,
                                      progressIndicatorBuilder:
                                          (_, url, progress) => Center(
                                        child: CircularProgressIndicator(
                                          value: progress.progress,
                                        ),
                                      ),
                                      errorWidget: (_, url, error) =>
                                          const Icon(Icons.error_outline),
                                    ),
                                    Text(
                                      snapshot.data![index].title.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 13.sp),
                                    ),
                                    Text(
                                      '\$ ${snapshot.data![index].price.toString()}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });

// Your existing code to display data
                    } else if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}"));
                    } else {
                      return const Center(child: Text("No data available"));
                    }
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          )),
    );
  }
}

class DetailsScreen extends StatefulWidget {
  Product data;
  DetailsScreen({super.key, required this.data});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.data.images);
    return Scaffold(
      appBar:AppBar(
        backgroundColor:AppColors.mandarinColor ,
        actions: [
          StreamBuilder <QuerySnapshot<Map<String,dynamic>>>(
            stream:FireStoreDB().checkFavourite (widget.data.id),
            builder: (context, snapshot) {
              if(snapshot.data==null){return  const Center(
                  child: CircularProgressIndicator());}
              return IconButton(onPressed: ()async{
                final favoriteData=UserFavourite(
                    brand: widget.data.brand,
                    category:widget.data.category,
                    description: widget.data.description,
                    discountPercentage:widget.data.discountPercentage,
                    id:widget.data.id ,
                    images:widget.data.images,
                    price:widget.data.price,
                    rating:widget.data.rating,
                    stock:widget.data.stock,
                    thumbnail:widget.data.thumbnail,
                    title:widget.data.title);
                if(snapshot.data!.docs.isEmpty){
                  await FireStoreDB().addToFavourite(favoriteData);
                  Get.find<FavouriteController>().fetch();
                }else{ Get.showSnackbar(
               AppStyles().failedSnackBar("Already Added.")
          );
          }
       },
       icon:snapshot.data!.docs.isEmpty?const Icon (Icons.favorite_outline,):const Icon(Icons.favorite,color:Colors.red ,));
            }
          )
        ],
      ) ,
      body:Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 200.h,
              child: ListView(
                scrollDirection:Axis.horizontal ,
                children:
                  widget.data.images.map((e) =>Container(
                    margin:const EdgeInsets.only(left:10 ,right:10 ,) ,
                    decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(10),
                      border:Border.all(
                        color:AppColors.mandarinColor,
                        width: 5,
                      ) ,
                      shape:BoxShape.rectangle ,
                    ) ,
                    child:CachedNetworkImage(
                      imageUrl: e,
                      height: 100.h,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (_, url, progress) => Center(
                        child: CircularProgressIndicator(
                          value: progress.progress,
                        ),
                      ),
                      errorWidget: (_, url, error) =>
                      const Icon(Icons.error_outline),
                    ), ) ).toList(),

              ),
            ),
            Column(
              children: [
                Text(widget.data.title,style:TextStyle(fontSize:22 ,fontWeight:FontWeight.bold ,color:Colors.cyan ,) ,),
                Text("Brand- ${widget.data.brand}",
                  style:TextStyle(fontSize:16 ,fontWeight:FontWeight.w400 ,color:Colors.yellow),),
                Text("category-${widget.data.category}",style:TextStyle(fontSize:14 ,fontWeight:FontWeight.w300 ,color:AppColors.grayColor ,) ,),
                Text(widget.data.description,style:TextStyle(fontSize:14 ,fontWeight:FontWeight.w300 ,color:AppColors.grayColor,) ,),
                Text("\$ ${widget.data.price.toString()}",style:TextStyle(fontSize:18 ,fontWeight:FontWeight.bold ,color:Colors.red ,) ,),
                Text("Discount-${widget.data.discountPercentage.toString()}%",style:TextStyle(fontSize:14 ,fontWeight:FontWeight.w300 ,color:Colors.lime ,) ,),
                Text("rating-${widget.data.rating.toString()}",style:TextStyle(fontSize:16 ,fontWeight:FontWeight.w500 ,color:Colors.cyan ,) ,),
                Text("stock-${widget.data.stock.toString()}",style:TextStyle(fontSize:14 ,fontWeight:FontWeight.w500 ,color:Colors.cyan ,) ,),


                customButton("Add To Cart", ()async{
                  final cartData = UserCart(
                      brand: widget.data.brand,
                      category: widget.data.category,
                      description: widget.data.description,
                      discountPercentage: widget.data.discountPercentage,
                      id: widget.data.id,
                      images: widget.data.images,
                      price: widget.data.price,
                      rating: widget.data.rating,
                      stock: widget.data.stock,
                      thumbnail: widget.data.thumbnail,
                      title: widget.data.title);
                  await FireStoreDB().addToCart(cartData);
                  Get.find<CartController>().fetch();
                }),
              ],
            ),
          ],
        ),
      ) ,
    );
  }
}
