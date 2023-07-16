import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/ui/route/routes.dart';
import 'package:food_delivery_app/ui/widgets/custom_Form_Field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /* appBar:AppBar(
        leading:IconButton (onPressed: (){
         //Navigator.pop(context);//pop use for go to back page
          Get.back();//this system also use for go to back page
        }, icon:Icon (Icons.arrow_back_ios)) ,
      ) ,*/
        body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(
          left: 25,
          top: 40,
          right: 25,
        ),
        child: SingleChildScrollView(
          child: Form (
            key:_formKey ,
            autovalidateMode:AutovalidateMode.always ,
            child : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                SizedBox(height:20 ,),

                customFromField("email", Icon(Icons.email_outlined),
                    _emailController, TextInputType.emailAddress, ( val) {
                      String pattern= r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';
                      RegExp regExp = RegExp(pattern);

                      if (val.isEmpty) {
                        return "This field can't be empty";
                      }
                      else if (!regExp.hasMatch (val)) {
                        return " Please enter an valid email address";
                      }
                      else{
                        return null;
                      }
                    } ),
                SizedBox(height:10 ,),
                customFromField("password", Icon(Icons.remove_red_eye_outlined),
                    _passwordController, TextInputType.text, (val) {
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
                  },obscureText:true,
                ),

                SizedBox(height:30 ,),
                Center(child: SizedBox (width:300, child: ElevatedButton( onPressed: (){
                  if(_formKey.currentState!.validate()){
                    print("Successfull");
                  }
                  else {
                    Get.snackbar("Error!", "Some thing is wrong",borderRadius:10,
                      backgroundColor:Colors.pink,snackStyle:SnackStyle.FLOATING,
                        snackPosition:SnackPosition.BOTTOM, duration:Duration(seconds:5, ) ,   );
                  }
                },
                    child:Text("Login",style:TextStyle(fontSize:18,fontWeight:FontWeight.w600  ) ,)))),
                Divider(),
                RichText(text:TextSpan(
                    children:[
                      TextSpan(
                        text:  "Don\'t have an account?",
                        style:TextStyle(fontSize:16,color:Colors.black),
                      ),

                      TextSpan(text:"Create",style:TextStyle(color:Colors.blue,fontSize: 16,),
                          recognizer:TapGestureRecognizer()..onTap=()=>Get.toNamed(signUp) ),

                    ]
                ) ),

              ],
            ),
          ),
        ),
      ),
    ));
  }
}
