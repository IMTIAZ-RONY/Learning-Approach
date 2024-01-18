
import 'package:e_commerce_dress_app/ui/route/routes.dart';
import 'package:e_commerce_dress_app/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'const/app_string.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:const Size(360, 690) ,
      minTextAdapt:true ,
      splitScreenMode:true ,
      builder:(_,child){
        return GetMaterialApp(
          title:AppString.appName ,
          debugShowCheckedModeBanner: false,
          defaultTransition:Transition.leftToRight ,
          theme:AppTheme().lightTheme(context) ,
          darkTheme:AppTheme().darkTheme (context) ,
          themeMode:ThemeMode.light ,
          getPages:getPages,
          initialRoute:splash ,
          unknownRoute:getPages.first ,

        );
      } ,
    );
  }
}
