import 'package:flutter/material.dart';

Widget customField (controller,{hintText,labelText}){
  return TextField(
    controller:controller,

    decoration:InputDecoration(
      hintText:hintText ,
      labelText:labelText,
      border:OutlineInputBorder(
        borderRadius:BorderRadius.circular (20) ,
      ),
      enabledBorder:OutlineInputBorder(
        borderRadius:BorderRadius.circular(10) ,
        borderSide:BorderSide(width:2,color:Colors.red  ),
      ),
      focusedBorder:OutlineInputBorder(
        borderRadius:BorderRadius.circular (15) ,
        gapPadding:5,
        borderSide:BorderSide(width:4,color:Colors.green  ) ,
      ) ,

    ) ,);
}