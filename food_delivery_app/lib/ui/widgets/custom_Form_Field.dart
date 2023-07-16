import 'package:flutter/material.dart';
Widget customFromField(hintText,prefixIcon,controller,keyboardType ,validator,{obscureText=false,suffixIcon}){
  return
    TextFormField(
      controller:controller ,
      obscureText:obscureText,
      keyboardType:keyboardType ,
      decoration:InputDecoration(
        hintText:hintText,
        prefixIcon:prefixIcon,
        suffixIcon:suffixIcon ,
      ) ,
      validator:validator ,
    );

}