
import 'package:e_commerce_dress_app/ui/style/app_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../business_logic/controllers/auth_controller.dart';
import '../../../const/app_color.dart';
import '../../responsive/size_config.dart';
import '../../route/routes.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_field.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final   _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: SingleChildScrollView(
              scrollDirection:Axis.vertical ,
              child: Container(
                height:SizeConfig.screenHeight ,
                child: Form(
                  key:_formKey ,
                  autovalidateMode:AutovalidateMode.always ,
                  child: Column(

                    children: [
                      SizedBox(height: 30.h,),
                      Image.asset(
                        "assets/icons/logo.png",
                        width: 40.w,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                          "Log In",
                          style:
                          AppStyles().textStyle(size:18.sp,color:AppColors.vampireBlackColor,fontWeight: FontWeight.w600)
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
                          String pattern=r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';
                          RegExp regExp= RegExp(pattern);
                          if(val.isEmpty){return"This field can\'t be empty ";}
                          else if(!regExp.hasMatch (val)){
                            return "Please enter an valid email address";
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
                              (val) {int minLength=8;
                          int maxLength=20;
                          bool hasUppercase=false;
                          bool hasLowercase=false;
                          bool hasNumber=false;
                          bool hasSpecialCharacter=false;
                          if(val.isEmpty){
                            return"this field can\'t be empty";
                          }///Check empty
                          else if(val.length<minLength||val.length>maxLength){
                            return"password must be 8-20 digits";
                          }
                          else{
                            ///Check for uppercase letter
                            if(RegExp (r'[A-Z]').hasMatch(val)){
                              hasUppercase=true;
                            }
                            ///Check for lowercase letter
                            if(RegExp(r'[a-z]').hasMatch (val)){
                              hasLowercase=true;
                            }
                            ///Check for Numbers
                            if(RegExp(r'[0-9]').hasMatch (val)){
                              hasNumber=true;
                            }
                            ///Check for special characters
                            if(RegExp (r'[~!@#$%^&*(),:"?.{}<>|]').hasMatch (val)){
                              hasSpecialCharacter=true;
                            }
                            ///Check if all criteria are met
                            if(!hasUppercase||!hasLowercase||!hasNumber||!hasSpecialCharacter){
                              return "Password must contain at least one Uppercase letter,one Lowercase letter,one number and one special characters";
                            }
                          }
                          return null;
                          },
                          " password ",
                          obscureText:true ,
                          prefixIcon: Icons.remove_red_eye_outlined),
                      Align(
                        alignment:Alignment.centerRight ,
                        child: InkWell(
                          onTap: ()=>Get.toNamed (forgetPass),
                          child: Text(
                            "Forget Password",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height:20.h ,),
                      SizedBox(
                          width: 250.w,
                          height: 45.h,
                          child: customButton('Log In', (){
                            if(_formKey.currentState!.validate()){
                             // final email=_emailController.text.trim();
                             // final pass=_passwordController.text.trim();
                              //Get.toNamed(bottomNav);
                              Get.find<AuthController>().login(
                                  _emailController.text.trim(),
                                  _passwordController.text.trim(),
                                  context);

                            }else{
                              Get.snackbar(
                                "Error",
                                "Something is wrong!Please check your input.",
                                colorText:Colors.white ,
                                snackStyle:SnackStyle.FLOATING,
                                backgroundColor:Colors.red ,
                                snackPosition:SnackPosition.BOTTOM,
                                borderRadius:15 ,
                                borderColor:Colors.yellow ,
                                borderWidth:2 ,
                                isDismissible:true ,
                                duration:Duration(seconds:5 ),

                              );
                            }
                          })),
                      SizedBox(height:20.h ,) ,
                      const Row(
                        children: [
                          Expanded(child: Divider(thickness: 1,color:Colors.black ,)),
                          Text("  OR  "),
                          Expanded(child: Divider(thickness: 1,color:Colors.black ,)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                        // mainAxisAlignment:MainAxisAlignment.center ,
                        children: [
                          InkWell(
                            borderRadius:BorderRadius.circular(70) ,
                            onTap:(){} ,
                            child: Ink(

                              width:70.w,
                              height:70.h ,
                              decoration:BoxDecoration(
                                color:AppColors.whiteColor ,
                                shape:BoxShape.circle,
                                boxShadow:[
                                  BoxShadow(
                                    color:AppColors.grayColor.withOpacity (0.5),
                                    spreadRadius:5,
                                    blurRadius:7 ,
                                    offset:Offset(0,3),
                                  ),
                                ] ,
                              ) ,
                              child:Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.asset("assets/icons/facebook.png"),
                              ) ,


                            ),
                          ),
                          //SizedBox(width:60 ,),
                          // VerticalDivider(width:60 ,),
                          InkWell(
                            borderRadius:BorderRadius.circular(70) ,
                            onTap:(){} ,
                            child: Ink(

                              width:70.w,
                              height:70.h ,
                              decoration:BoxDecoration(
                                color:AppColors.whiteColor ,
                                shape:BoxShape.circle,
                                boxShadow:[
                                  BoxShadow(
                                    color:AppColors.grayColor.withOpacity (0.5),
                                    spreadRadius:5,
                                    blurRadius:7 ,
                                    offset:Offset(0,3),
                                  ),
                                ] ,
                              ) ,
                              child:Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.asset("assets/icons/search.png"),
                              ) ,


                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      Text.rich(TextSpan(
                        children:[
                          const TextSpan(
                            text:"Don\'t have an account?",
                            style:TextStyle(color:AppColors.grayColor, ) ,
                          ),
                          TextSpan(
                            recognizer:TapGestureRecognizer()..onTap=()=>Get.toNamed(registration) ,
                            text: "Sign Up",
                            style:AppStyles().textStyle(size:14.sp,color:AppColors.vampireBlackColor,fontWeight:FontWeight.w600  )
                            /*const TextStyle(color:AppColors.vampireBlackColor,fontWeight:FontWeight.w600 )*/,
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
