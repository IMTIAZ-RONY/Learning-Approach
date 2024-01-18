/*import 'package:dressapp/const/app_color.dart';
import 'package:dressapp/ui/responsive/size_config.dart';
import 'package:dressapp/ui/route/routes.dart';
import 'package:dressapp/ui/widgets/custom_button.dart';
import 'package:dressapp/ui/widgets/custom_field.dart'; */
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../business_logic/controllers/auth_controller.dart';
import '../../responsive/size_config.dart';
import '../../route/routes.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_field.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        "Forget Password?",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 15.h,
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
                      //SizedBox(height:10.h ,),

                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                          width: 250.w,
                          height: 45.h,
                          child: customButton('Continue', () {
                            if (_formKey.currentState!.validate()) {
                              //final email = _emailController.text.trim();
                              Get.find<AuthController>().forgetPassword (_emailController.text.trim(), context);

                              //Get.toNamed(login);
                              //print("success");
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
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
