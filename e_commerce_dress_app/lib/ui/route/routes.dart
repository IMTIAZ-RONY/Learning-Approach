import 'package:e_commerce_dress_app/business_logic/bindings/auth_binding.dart';
import 'package:e_commerce_dress_app/business_logic/bindings/checkout_binding.dart';
import 'package:e_commerce_dress_app/business_logic/bindings/splash_binding.dart';

import 'package:e_commerce_dress_app/ui/views/nav_pages/home.dart';

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get.dart';

import '../../business_logic/bindings/cart_binding.dart';
import '../../business_logic/bindings/favorite_binding.dart';
import '../views/auth/forget_password.dart';
import '../views/auth/login.dart';
import '../views/auth/registration.dart';
import '../views/bottom_navigation_controller.dart';
import '../views/not_found.dart';
import '../views/onboarding.dart';
import '../views/splash_screen.dart';
import '../views/terms_condition.dart';

const String splash = "/splash_screen";
const String unknown = "/not-found";
const String intro = "/intro";
const String login = "/login";
const String registration = "/registration";
const String forgetPass = "/forgetPassword";
const String terms = "/terms";
const String bottomNav = "/bottomNav";
//const String cart = "/cart";
//const String favorite = "/favorite";
const String details = "/details";

List<GetPage> getPages = [
  GetPage(
    name: unknown,
    page: () => const Unknown(),
  ),
  GetPage(
    name: splash,
    page: () => Splash(),
    binding:SplashBinding(),
  ),
  GetPage(
    name: intro,
    page: () => const Onboarding(),
  ),
  GetPage(
    name: login,
    page: () => Login(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: registration,
    page: () => Registration(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: forgetPass,
    page: () => ForgetPassword(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: terms,
    page: () => const TermCondition(),
  ),
  GetPage(
    name: bottomNav,
    page: () => BottomNavController(),
    bindings:[
      FavouriteBinding(),
      CartBinding(),
      CheckoutBinding(),

    ]

  ),
  GetPage(
    name: details,
    page: () => DetailsScreen(data:Get.arguments),
  ),
];
