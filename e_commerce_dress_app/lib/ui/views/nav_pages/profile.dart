
import 'package:e_commerce_dress_app/model/user_profile.dart';
import 'package:e_commerce_dress_app/services/firestore_db.dart';
import 'package:e_commerce_dress_app/ui/widgets/custom_button.dart';
import 'package:e_commerce_dress_app/ui/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/app_color.dart';
class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  final TextEditingController _namecontroller= TextEditingController();
  final TextEditingController _emailcontroller= TextEditingController();
  final TextEditingController _uidcontroller= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder(
          future:FireStoreDB().getUserProfile(),
          builder:(_,snapshot){
        if(snapshot.connectionState==ConnectionState.done){
         if(snapshot.hasData){
           UserProfile userProfile=snapshot.data as UserProfile;
           _namecontroller.text=userProfile.name;
           _emailcontroller.text=userProfile.email;
           _uidcontroller.text=userProfile.uid;
           return SingleChildScrollView(
             scrollDirection:Axis.vertical ,
             child: Padding(
               padding:  EdgeInsets.only(left:25 ,top:100 ,right:25 ,),
               child: Column(

                 children: [
                   customFormField(TextInputType.text, _namecontroller, context,"user name" ,(val){},"Write your name",
                       prefixIcon:Icons.person_outline, ),
                   customFormField(TextInputType.text, _emailcontroller, context,"email" ,(val){},"No option to write",
                       prefixIcon:Icons.email_outlined,readOnly: true, ),
                   customFormField(TextInputType.text, _uidcontroller, context,"uid" ,(val){},"No option to write",
                       prefixIcon:Icons.verified_outlined,readOnly: true, ),
                   customButton("Update Profile", ()async{
                     final updateData=UserProfile(name: _namecontroller.text.trim(),
                         email:_emailcontroller.text.trim(),
                       uid: _uidcontroller.text.trim(),);
                     await FireStoreDB().userProfileData(updateData);
                   }),
                 ],
               ),
             ),
           );

         }else{
           return const Center(
             child:Text ("Something went wrong") ,
           );

         }
        }else{
          return const Center(
            child:CircularProgressIndicator() ,
          );

        }
      }),
    );
  }
}
