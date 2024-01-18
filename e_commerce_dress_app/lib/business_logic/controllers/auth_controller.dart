
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_dress_app/ui/route/routes.dart';
import 'package:e_commerce_dress_app/ui/style/app_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController{
  final FirebaseAuth _auth =FirebaseAuth.instance;
  final box =GetStorage( );
  signUp(name,email,password,context)async{
    AppStyles().progressDialog(context);
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if(credential.user!.uid.isNotEmpty){
        CollectionReference collectionReference=FirebaseFirestore.instance.collection('users');
        collectionReference.doc(email).set({
          "uid":credential.user!.uid,
          "email":email,
          'name':name,
        },);
        Map user={
          "uid":credential.user!.uid,
          "email":email,
          'name':name,

        };
        box.write("user", user);
        print(box.read("user"));
        Get.back();
        Get.offAndToNamed(bottomNav);
        Get.showSnackbar(AppStyles().successSnackBar ("Sign Up Successfully complete."));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.back();
        Get.showSnackbar(  AppStyles().failedSnackBar('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        Get.back();
        Get.showSnackbar(AppStyles().failedSnackBar('The account already exists for that email.'));

      }
    } catch (e) {
      Get.back();
      Get.showSnackbar(AppStyles().failedSnackBar(e));
    }
  }
  login(email,password,context)async{
    AppStyles().progressDialog(context);
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
      );if(credential.user!.uid.isNotEmpty){
        FirebaseFirestore.instance.collection("users").doc(email).get().then((DocumentSnapshot<Map<String,dynamic>>doc) {
          if(doc.exists){
           var data =doc.data();
           print(data);
           Map user={
             'uid':data!['uid'],
             "email":data['email'],
             "name":data['name'],
           };
           box.write("user", user);
           print(user);
           Get.back();
           Get.offAndToNamed(bottomNav);
           Get.showSnackbar(AppStyles().successSnackBar("Login successfully completed"));
          }
          else{
            Get.showSnackbar(AppStyles().failedSnackBar("There is no data exists"));
          }
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.back();
        Get.showSnackbar(AppStyles().failedSnackBar('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        Get.back();
        Get.showSnackbar(AppStyles().failedSnackBar('Wrong password provided for that user.'));
      }
    }
  }
  forgetPassword(email,context)async{
    AppStyles().progressDialog(context);
    try{
      await _auth.sendPasswordResetEmail(email: email);
      Get.back();
      Get.showSnackbar(AppStyles().successSnackBar("email has been sent to $email"));
      
    }catch(e){
      Get.back();
      Get.showSnackbar(AppStyles().failedSnackBar("something is wrong"));
      
    }
  }
  logOut()async{
    _auth.signOut();
  }
}