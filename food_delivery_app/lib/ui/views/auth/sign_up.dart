import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../../route/routes.dart';
import '../../widgets/custom_Form_Field.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final ImagePicker _imagePicker = ImagePicker();

  XFile? image;

  chooseImage() async {
    image = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.tealAccent ,

        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 25,
          top: 40,
          right: 25,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "SignUp",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                image == null
                    ? IconButton(
                        onPressed: () => chooseImage(),
                        icon: Icon(Icons.camera))
                    : SizedBox (height: 100,child: ClipRRect (borderRadius:BorderRadius.circular (20) ,
                    child: Image.file(File(image!.path)))),
                SizedBox(
                  height: 20,
                ),
                customFromField("your name", Icon(Icons.person),
                    _nameController, TextInputType.text, (val) {
                  if (val.isEmpty) {
                    return "this field cann\'t be empty";
                  }
                }),
                SizedBox(
                  height: 20,
                ),
                customFromField("email", Icon(Icons.email_outlined),
                    _emailController, TextInputType.emailAddress, ( val) {
                  String pattern= r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';
                  RegExp regExp = RegExp(pattern);

                  if (val.isEmpty) {
                    return "please enter an email address";
                  }
                 else if (!regExp.hasMatch (val)) {
                    return "enter a valid email address";
                  }
                 else{
                   return null;
                  }
                }
                ),
                SizedBox(
                  height: 10,
                ),
                customFromField(
                  "password",
                  Icon(Icons.remove_red_eye_outlined,),
                  _passwordController,
                  TextInputType.text,

                      (val) {
                    int minLength=8;
                    int maxLength=20;
                    bool hasUppercase=false;
                    bool hasLowercase=false;
                    bool hasNumber=false;
                    bool hasSpecialCharacter=false;
                    if(val.isEmpty ){
                      return "please enter your password ";
                    }
                    else  if(val.length<minLength || val.length>maxLength){
                      return "password must be 8-20 digit";
                    }else{
                      ///Check for uppercase Letters
                      if(RegExp(r'[A-Z]').hasMatch(val)){
                        hasUppercase=true;
                      }
                      ///Check for lowercase Letters
                      if(RegExp(r"[a-z]").hasMatch(val)){
                        hasLowercase=true;
                      }
                      ///Check for Numbers
                      if(RegExp(r'[0-9]').hasMatch(val)){
                        hasNumber=true;
                      }
                      ///Check for Special Characters
                      if(RegExp(r'[!@#$%^*(){}<>,.?:|~]').hasMatch(val)){
                        hasSpecialCharacter=true;
                      }
                      ///Check if all criteria are met
                      if(!hasUppercase||!hasLowercase||!hasNumber||!hasSpecialCharacter){
                        return
                          "Password must contain at least oneUppercase letter,oneLower case letter,one number,and one Special Characters.";
                      }
                    }
                    return null;
                  },
                  obscureText: true,
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                    child: SizedBox(
                        width: 300,
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print("Successfull");
                              } else {
                                Get.snackbar(
                                  "Error!",
                                  "Some thing is wrong",
                                  borderRadius: 10,
                                  backgroundColor: Colors.pink,
                                  snackStyle: SnackStyle.FLOATING,
                                  snackPosition: SnackPosition.BOTTOM,
                                  duration: Duration(
                                    seconds: 5,
                                  ),
                                );
                              }
                            },
                            child: Text(
                              "SignUp",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            )))),
                Divider(),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "Already have an account?",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  TextSpan(
                      text: "Login",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.toNamed(login)),
                ])),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
