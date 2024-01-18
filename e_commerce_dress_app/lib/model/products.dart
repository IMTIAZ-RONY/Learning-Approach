/*
class Product {
  // int? id;
  String? title;
  double? price;
  String? description;
  // String? category;
  String? image;
  Rating? rating;

  Product(
      {
        // this.id,
        this.title,
        this.price,
        this.description,
        // this.category,
        this.image,
        this.rating});

  Product.fromJson(Map<String, dynamic> json) {
    //id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    //  category = json['category'];
    image = json['image'];
    rating =
    json['rating'] != null ?  Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['id'] = this.id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    // data['category'] = category;
    data['image'] = image;
    if (this.rating != null) {
      data['rating'] = rating!.toJson();
    }
    return data;
  }
}

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rate'] = rate;
    data['count'] = count;
    return data;
  }
}
List<Product>products=[
  Product(
    title:	"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
    price	:109.95,
    description	:"Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday"
    ,
    image:	"https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    rating:Rating(rate:	3.9,
      count:	120,),
  ),
  Product(
    title	:"Mens Casual Premium Slim Fit T-Shirts ",
    price:	22.3,
    description:	"Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket."
    ,

    image:	"https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
    rating:Rating(rate:	4.1,
      count:	259,
    ),
  ),
  Product(
    title:	"Mens Cotton Jacket",
    price:	55.99,
    description:	"great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day."
    ,
    image	:"https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
    rating:Rating(rate:	4.7,
        count:	500),
  ),
  Product(

    title:	"Mens Casual Slim Fit",
    price:	15.99,
    description:	"The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description."
    ,
    image:	"https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg",
    rating:Rating(rate:	2.1,
      count	:430,
    ),
  ),
  Product(
    title	:"John Hardy Women's Legends Naga Gold & Silver Dragon Station Chain Bracelet",
    price:	695,
    description:	"From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean's pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection."
    ,
    image:	"https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
    rating:Rating(
      rate	:4.6,
      count:	400,),),
  Product(
    title: "Petite Micropave ",
    price:	168,
    description:	"Satisfaction Guaranteed. Return or exchange any order within 30 days.Designed and sold by Hafeez Center in the United States. Satisfaction Guaranteed. Return or exchange any order within 30 days."
    ,
    image	:"https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg",
    rating:Rating(rate:	3.9,
      count:70,),
  ),
  Product(
    title:	"White Gold Plated Princess",
    price	:9.99,
    description:	"Classic Created Wedding Engagement Solitaire Diamond Promise Ring for Her. Gifts to spoil your love more for Engagement, Wedding, Anniversary, Valentine's Day..."
    ,
    image	:"https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg",
    rating:Rating(
      rate	:3,
      count:	400,),

  ),
  Product(
    title:"Gold Plated Stainless Steel Double",
    price:	10.99,
    description	:"Rose Gold Plated Double Flared Tunnel Plug Earrings. Made of 316L Stainless Steel",
    image:	"https://fakestoreapi.com/img/51UDEzMJVpL._AC_UL640_QL65_ML3_.jpg",
    rating:Rating(
      rate:	1.9,
      count:	100,),
  ),
  Product(
    title:	"BIYLACLESEN Women's 3-in…ard Jacket Winter Coats",
    price	:56.99,
    description:	"Note:The Jackets is US standard size, Please choose size as your usual wear Material: 100% Polyester; Detachable Liner Fabric: Warm Fleece. Detachable Functional Liner: Skin Friendly, Lightweigt and Warm.Stand Collar Liner jacket, keep you warm in cold weather. Zippered Pockets: 2 Zippered Hand Pockets, 2 Zippered Pockets on Chest (enough to keep cards or keys)and 1 Hidden Pocket Inside.Zippered Hand Pockets and Hidden Pocket keep your things secure. Humanized Design: Adjustable and Detachable Hood and Adjustable cuff to prevent the wind and water,for a comfortable fit. 3 in 1 Detachable Design provide more convenience, you can separate the coat and inner as needed, or wear it together. It is suitable for different season and help you adapt to different climates"
    ,
    image	:"https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg",
    rating:Rating(rate:	2.6,
      count:	235,),


  ),
  Product(
      title:"Lock and Love Women's Re…ather Moto Biker Jacket",
      price:	29.95,
      description	:"100% POLYURETHANE(shell) 100% POLYESTER(lining) 75% POLYESTER 25% COTTON (SWEATER), Faux leather material for style and comfort / 2 pockets of front, 2-For-One Hooded denim style faux leather jacket, Button detail on waist / Detail stitching at sides, HAND WASH ONLY / DO NOT BLEACH / LINE DRY / DO NOT IRON"
      ,
      image:	"https://fakestoreapi.com/img/81XH0e8fefL._AC_UY879_.jpg",
      rating:Rating(rate:2.9,
          count:	340)
  ),
  Product(
    title:	"Rain Jacket Women Windbr…iped Climbing Raincoats",
    price	:39.99,
    description	:"Lightweight perfet for trip or casual wear---Long sleeve with hooded, adjustable drawstring waist design. Button and zipper front closure raincoat, fully stripes Lined and The Raincoat has 2 side pockets are a good size to hold all kinds of things, it covers the hips, and the hood is generous but doesn't overdo it.Attached Cotton Lined Hood with Adjustable Drawstrings give it a real styled look."
    ,
    image:	"https://fakestoreapi.com/img/71HblAHs5xL._AC_UY879_-2.jpg",
    rating:Rating(  rate:	3.8,
      count:	679,),
  ),
  Product(
    title:	"MBJ Women's Solid Short Sleeve Boat Neck V ",
    price	:9.85,
    description:	"95% RAYON 5% SPANDEX, Made in USA or Imported, Do Not Bleach, Lightweight fabric with great stretch for comfort, Ribbed on sleeves and neckline / Double stitching on bottom hem"
    ,
    image	:"https://fakestoreapi.com/img/71z3kpMAYsL._AC_UY879_.jpg",
    rating:Rating(
      rate:	4.7,
      count:	130,),


  ),
  Product(
    title:	"Opna Women's Short Sleeve Moisture",
    price:	7.95,
    description:	"100% Polyester, Machine wash, 100% cationic polyester interlock, Machine Wash & Pre Shrunk for a Great Fit, Lightweight, roomy and highly breathable with moisture wicking fabric which helps to keep moisture away, Soft Lightweight Fabric with comfortable V-neck collar and a slimmer fit, delivers a sleek, more feminine silhouette and Added Comfort"
    ,
    image	:"https://fakestoreapi.com/img/51eg55uWmdL._AC_UX679_.jpg",
    rating:Rating(
      rate:	4.5,
      count:	146,),

  ),
  Product(
    title	:"DANVOUY Womens T Shirt Casual Cotton Short",
    price:	12.99,
    description:	"95%Cotton,5%Spandex, Features: Casual, Short Sleeve, Letter Print,V-Neck,Fashion Tees, The fabric is soft and has some stretch., Occasion: Casual/Office/Beach/School/Home/Street. Season: Spring,Summer,Autumn,Winter."
    ,
    image:	"https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg",
    rating:Rating( rate:	3.6,
      count:345,),
  ),
];
*/

import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String brand;
  final String category;
  final String description;
  final double discountPercentage;
  final int id;
  final List images ;
  final int price;
  final double rating;
  final int stock;
  final String thumbnail;
  final String title;

  const Product(
      {required this.brand,
        required this.category,
        required this.description,
        required this.discountPercentage,
        required this.id,
        required this.images,
        required this.price,
        required this.rating,
        required this.stock,
        required this.thumbnail,
        required this.title});

  factory Product.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return Product(
        brand: data['brand'],
        category: data['category'],
        description: data['description'],
        discountPercentage: data['discountPercentage'],
        id: data['id'],
        images: data['images'],
        price: data['price'],
        rating: data['rating'].toDouble(),
        stock: data['stock'],
        thumbnail: data['thumbnail'],
        title: data['title']);
  }
}
