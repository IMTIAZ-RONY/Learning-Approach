import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Center(
        child:Text("Chat",style:TextStyle(fontSize:18,fontWeight:FontWeight.bold ,color:Colors.green  ) ,) ,
      ) ,
    );
  }
}
