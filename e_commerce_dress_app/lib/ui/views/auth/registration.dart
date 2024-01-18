import 'package:e_commerce_dress_app/business_logic/controllers/auth_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../const/app_color.dart';
import '../../responsive/size_config.dart';
import '../../route/routes.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_field.dart';

class Registration extends StatelessWidget {
  Registration({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  RxBool _value = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Image.asset(
                "assets/icons/logo.png",
                width: 40.w,
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Sign Up",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              customFormField(
                TextInputType.name,
                _nameController,
                context,
                "Write your name",
                    (val) {
                  if (val.isEmpty) {
                    return "Don\'t leave this field empty";
                  }
                },
                "Name",
                prefixIcon: Icons.person_2_outlined,
              ),
              SizedBox(
                height: 15.h,
              ),
              customFormField(
                TextInputType.emailAddress,
                _emailController,
                context,
                "Give your email",
                    (val) {
                  String pattern =
                      r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';
                  RegExp regExp = RegExp(pattern);
                  if (val.isEmpty) {
                    return "This field can\'t be empty ";
                  } else if (!regExp.hasMatch(val)) {
                    return "Please enter a valid email address";
                  }
                },
                " email ",
                prefixIcon: Icons.email_outlined,
              ),
              SizedBox(
                height: 15.h,
              ),
              customFormField(
                TextInputType.text,
                _passwordController,
                context,
                "Give your password",
                    (val) {
                  int minLength = 8;
                  int maxLength = 20;
                  bool hasUppercase = false;
                  bool hasLowercase = false;
                  bool hasNumber = false;
                  bool hasSpecialCharacter = false;
                  if (val.isEmpty) {
                    return "This field can\'t be empty";
                  }

                  if (val.length < minLength || val.length > maxLength) {
                    return "Password must be 8-20 characters";
                  } else {
                    if (RegExp(r'[A-Z]').hasMatch(val)) {
                      hasUppercase = true;
                    }

                    if (RegExp(r'[a-z]').hasMatch(val)) {
                      hasLowercase = true;
                    }

                    if (RegExp(r'[0-9]').hasMatch(val)) {
                      hasNumber = true;
                    }

                    if (RegExp(r'[~!@#$%^&*(),:"?.{}<>|]').hasMatch(val)) {
                      hasSpecialCharacter = true;
                    }

                    if (!hasUppercase ||
                        !hasLowercase ||
                        !hasNumber ||
                        !hasSpecialCharacter) {
                      return "Password must contain at least one Uppercase letter, one Lowercase letter, one number, and one special character";
                    }
                  }
                  return null;
                },
                " password ",
                obscureText: true,
                prefixIcon: Icons.remove_red_eye_outlined,
              ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                width: 250.w,
                height: 45.h,
                child: customButton('Sign Up ', () {
                  if (_formKey.currentState!.validate()) {
                    final email = _emailController.text.trim();
                    final pass = _passwordController.text.trim();
                    final name = _nameController.text.trim();
                    Get.toNamed(home);
                  } else {
                    Get.snackbar(
                      "Error",
                      "Something is wrong! Please check your input.",
                      colorText: Colors.white,
                      snackStyle: SnackStyle.FLOATING,
                      backgroundColor: Colors.red,
                      snackPosition: SnackPosition.BOTTOM,
                      borderRadius: 15,
                      borderColor: Colors.yellow,
                      borderWidth: 2,
                      isDismissible: true,
                      duration: const Duration(seconds: 5),
                    );
                  }
                }),
              ),
              SizedBox(
                height: 15.h,
              ),
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                  Text("  OR  "),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(70),
                    onTap: () {},
                    child: Ink(
                      width: 70.w,
                      height: 70.h,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.grayColor.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset("assets/icons/facebook.png"),
                      ),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(70),
                    onTap: () {},
                    child: Ink(
                      width: 70.w,
                      height: 70.h,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.grayColor.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset("assets/icons/search.png"),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Already have an account?",
                      style: TextStyle(
                        color: AppColors.grayColor,
                      ),
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.toNamed(login),
                      text: "Log In",
                      style: const TextStyle(
                        color: AppColors.vampireBlackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),*/
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: SizeConfig.screenHeight,
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Image.asset(
                    "assets/icons/logo.png",
                    width: 40.w,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  customFormField(
                    TextInputType.name,
                    _nameController,
                    context,
                    "Write your name",
                    (val) {
                      if (val.isEmpty) {
                        return "This field can\'t be empty ";
                      }
                    },
                    " Name ",
                    prefixIcon: Icons.person_2_outlined,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  customFormField(
                    TextInputType.emailAddress,
                    _emailController,
                    context,
                    "Give your email",
                    (val) {
                      String pattern =
                          r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';
                      RegExp regExp = RegExp(pattern);
                      if (val.isEmpty) {
                        return "This field can\'t be empty ";
                      } else if (!regExp.hasMatch(val)) {
                        return "Please enter an valid email address";
                      }
                    },
                    " email ",
                    prefixIcon: Icons.email_outlined,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  customFormField(TextInputType.text, _passwordController,
                      context, "Give your password", (val) {
                    int minLength = 8;
                    int maxLength = 20;
                    bool hasUppercase = false;
                    bool hasLowercase = false;
                    bool hasNumber = false;
                    bool hasSpecialCharacter = false;
                    if (val.isEmpty) {
                      return "this field can\'t be empty";
                    }

                    ///Check empty
                    else if (val.length < minLength || val.length > maxLength) {
                      return "password must be 8-20 digits";
                    } else {
                      ///Check for uppercase letter
                      if (RegExp(r'[A-Z]').hasMatch(val)) {
                        hasUppercase = true;
                      }

                      ///Check for lowercase letter
                      if (RegExp(r'[a-z]').hasMatch(val)) {
                        hasLowercase = true;
                      }

                      ///Check for Numbers
                      if (RegExp(r'[0-9]').hasMatch(val)) {
                        hasNumber = true;
                      }

                      ///Check for special characters
                      if (RegExp(r'[~!@#$%^&*(),:"?.{}<>|]').hasMatch(val)) {
                        hasSpecialCharacter = true;
                      }

                      ///Check if all criteria are met
                      if (!hasUppercase ||
                          !hasLowercase ||
                          !hasNumber ||
                          !hasSpecialCharacter) {
                        return "Password must contain at least one Uppercase letter,one Lowercase letter,one number and one special characters";
                      }
                    }
                    return null;
                  }, " password ",
                      obscureText: true,
                      prefixIcon: Icons.remove_red_eye_outlined),
                  //SizedBox(height:10.h ,),
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                            value: _value.value,
                            onChanged: (val) {
                              _value.value = val!;
                            }),
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "I accept all the ",
                            style: TextStyle(
                                color: AppColors.grayColor,
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.toNamed(terms),
                            text: "terms & condition",
                            style: TextStyle(
                                color: AppColors.vampireBlackColor,
                                fontWeight: FontWeight.w600)),
                      ]))
                    ],
                  ),

                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                      width: 250.w,
                      height: 45.h,
                      child: customButton('Sign Up', () {
                        if (_formKey.currentState!.validate() &&
                            _value.value == true) {
                         // final email = _emailController.text.trim();
                         // final pass = _passwordController.text.trim();
                        //  Get.toNamed(bottomNav);
                          Get.find<AuthController>().signUp(
                              _nameController.text,
                              _emailController.text.trim(),
                              _passwordController.text.trim(),
                              context);
                        } else {
                          Get.snackbar(
                            "Error",
                            "Something is wrong!Please check your input.",
                            colorText: Colors.white,
                            snackStyle: SnackStyle.FLOATING,
                            backgroundColor: Colors.red,
                            snackPosition: SnackPosition.BOTTOM,
                            borderRadius: 15,
                            borderColor: Colors.yellow,
                            borderWidth: 2,
                            isDismissible: true,
                            duration: Duration(seconds: 5),
                          );
                        }
                      })),
                  SizedBox(
                    height: 20.h,
                  ),
                  const Row(
                    children: [
                      Expanded(
                          child: Divider(
                        thickness: 1,
                        color: Colors.black,
                      )),
                      Text("  OR  "),
                      Expanded(
                          child: Divider(
                        thickness: 1,
                        color: Colors.black,
                      )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // mainAxisAlignment:MainAxisAlignment.center ,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(70),
                        onTap: () {},
                        child: Ink(
                          width: 70.w,
                          height: 70.h,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.grayColor.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset("assets/icons/facebook.png"),
                          ),
                        ),
                      ),
                      //SizedBox(width:60 ,),
                      // VerticalDivider(width:60 ,),
                      InkWell(
                        borderRadius: BorderRadius.circular(70),
                        onTap: () {},
                        child: Ink(
                          width: 70.w,
                          height: 70.h,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.grayColor.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset("assets/icons/search.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text.rich(TextSpan(
                    children: [
                      const TextSpan(
                        text: "Already have an account?",
                        style: TextStyle(
                          color: AppColors.grayColor,
                        ),
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.toNamed(login),
                        text: "Log In",
                        style: const TextStyle(
                            color: AppColors.vampireBlackColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
