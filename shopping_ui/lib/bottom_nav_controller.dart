import 'package:flutter/material.dart';
import 'package:shopping_ui/pages/account.dart';
import 'package:shopping_ui/pages/add.dart';
import 'package:shopping_ui/pages/chat.dart';
import 'package:shopping_ui/pages/home.dart';
import 'package:shopping_ui/pages/my_ads.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key}) ;

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final _pages=[
    Home(),
    MyAds(),
    Add(),
    Chat(),
    Account(),
  ];
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:BottomNavigationBar(
        currentIndex:_currentIndex  ,
          onTap:(Index){
          setState((){
            _currentIndex=Index;
            print(Index);
          });

          } ,
          elevation: 1,
          selectedItemColor:Colors.green ,
          unselectedItemColor:Colors.white ,
          items:[
            BottomNavigationBarItem(icon:Icon(Icons.home_outlined,),label:"Home" ,
              backgroundColor:Colors.yellow  ,),
            BottomNavigationBarItem(icon:Icon(Icons.shopping_bag,),label:"My Ads", ),
            BottomNavigationBarItem(icon:Icon(Icons.add,),label:"Add", ),
            BottomNavigationBarItem(icon:Icon(Icons.chat,),label:"Chat", ),
            BottomNavigationBarItem(icon:Icon(Icons.person,),label:"Account", ),
          ]) ,
      body:_pages[_currentIndex] ,

    );
  }
}
