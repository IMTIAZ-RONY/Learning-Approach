import 'package:flutter/material.dart';
import 'package:food_delivery_app/ui/route/routes.dart';
import 'package:food_delivery_app/ui/views/auth/login.dart';
import 'package:food_delivery_app/ui/views/auth/sign_up.dart';
import 'package:food_delivery_app/ui/views/onboarding.dart';
import 'package:food_delivery_app/ui/views/splash_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Box box=await Hive.openBox ("todo");

  await GetStorage.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner:false ,
      theme: ThemeData(
        colorScheme:ColorScheme.fromSeed(seedColor:Colors.deepPurple),
                //primarySwatch: Colors.blue,
        //useMaterial3:true,
        scaffoldBackgroundColor:Colors.amber ,
        floatingActionButtonTheme:FloatingActionButtonThemeData(shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.only(topLeft:Radius.circular (30) ) ,

        ) ,) ,

      ),
     initialRoute:splash ,
     getPages:getPages,
    );
  }
}

