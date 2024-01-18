
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  final String name;
  final String email;
  final String uid;
 const UserProfile({required this.name,required this.email,required this.uid});
 factory UserProfile.fromSnapshot(DocumentSnapshot<Map<String,dynamic>>snapshot){
  final data=snapshot.data()!;
  return UserProfile(
      name: data['name'],
      email:data["email"], 
      uid:data['uid'] );
 }
toJson(){
   return
  { "name":name,
    'email':email,
    "uid":uid,
  };

}
}