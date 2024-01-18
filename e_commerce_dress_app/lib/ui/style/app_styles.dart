import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

SalomonBottomBarItem bottomBarItem(icon, title) =>
    SalomonBottomBarItem(icon: Icon(icon), title: Text(title));

class AppStyles {
  TextStyle textStyle({size, color, fontWeight}) => TextStyle(
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
      );
  ///loading
  progressDialog(context) {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Image.asset("assets/files/loading.gif", height: 150),
          );
        });
  }
  /// success snackbar
GetSnackBar successSnackBar(message)=> GetSnackBar(
  message:message ,
  backgroundColor:Colors.green ,
  icon: Icon(Icons.assignment_turned_in) ,
  duration:Duration(seconds:2 ) ,
);
  ///failed snackbar
  GetSnackBar failedSnackBar(message)=> GetSnackBar(
    message:message ,
    backgroundColor:Colors.redAccent ,
    icon: Icon(Icons.warning) ,
    duration:Duration(seconds:2 ) ,
  );
}
