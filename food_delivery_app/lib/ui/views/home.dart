
import 'package:flutter/material.dart';
import 'package:food_delivery_app/ui/widgets/custom_Field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class homeScreen extends StatefulWidget {
   homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
   final TextEditingController _nameController=TextEditingController();
  final TextEditingController _companyController=TextEditingController();
  final TextEditingController _todoUpdateController =TextEditingController();
  final TextEditingController _todoUpdatesController =TextEditingController();
   Box? todo;

   @override
  void initState() {
    todo=Hive.box("todo");

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.cyan,
      appBar:AppBar(
        title:Text("CRUD Operation by Local DB hive") ,
      ),
      body:SafeArea (
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25,vertical:15 ),
          child: Column(
            children: [
              customField (_nameController,hintText:"Insulin",labelText:"Write Insulin Name "  ),
              SizedBox(height:20 ,),
              customField (_companyController,hintText:"Company Name",labelText:"Write Company Name"  ),
              SizedBox(height:20 ,),
              Divider(color:Colors.blueGrey),
              SizedBox(width:350,height:35,
              child: ElevatedButton(onPressed:  ()async {
             // Action to perform when the button is pressed
            try {
                  final name = _nameController.text;
                  final company = _companyController.text;

                   Map<dynamic, dynamic> data = <dynamic, dynamic>{
                   'Name': name,
                   'Company': company,
                   };
                 await todo!.add(data);
               _nameController.clear();
               _companyController.clear();
               print("Successfully added");
               } catch (e) {
               print(e);
              }
            },
                  child:Text ("Add")
    ),
    ),
              SizedBox(height: 15,),
              Expanded(child: Container ( color:Colors.amber,
                child:ValueListenableBuilder(
                  valueListenable:Hive.box ("todo").listenable() ,
                  builder:(context,value,child){
                    return ListView.builder(
                        itemCount:todo!.keys.toList().length ,
                        itemBuilder:(_,index){
                          final List<Map<dynamic, dynamic>> documents =
                          todo!.values.cast<Map<dynamic, dynamic>>().toList();

                          final data = documents[index];
                          return
                             Card (
                               color:Colors.cyanAccent ,
                               elevation:5 ,
                               child: ListTile(
                                 title: Text(data['Name'].toString()),
                                 subtitle: Text(data['Company'].toString()),
                                 trailing:SizedBox(
                                   width:100 ,
                                   child: Row(
                                     children: [
                                       IconButton(onPressed: (){
                                         _todoUpdateController.text=data['Name'].toString();
                                         _todoUpdatesController.text=data['Company'].toString();
                                         showDialog(
                                         barrierDismissible:false ,
                                             context:  context, builder:(_){
                                           return Dialog(

                                             child:Container(
                                               height:300 ,
                                             child:Padding(
                                               padding:const EdgeInsets.symmetric(vertical:20 ,horizontal: 20),
                                               child: Column(
                                                 children: [
                                                   customField(_todoUpdateController,hintText:"Update",labelText:"Write for update" ),
                                                   SizedBox(height:10,),
                                                   customField(_todoUpdatesController,hintText:"Update",labelText:"Write for update" ),
                                                   SizedBox(height: 15,),
                                                   ElevatedButton(onPressed:  (){
                                                    final updateInput={
                                                    "Name":_todoUpdateController.text,
                                                      "Company":_todoUpdatesController.text,
                                                    };
                                                    todo!.putAt (index, updateInput).then((value) => Get.back()).then((value) =>Get.snackbar (
                                                        "Success", "You have successfully updated"));
                                                    }, child:SizedBox(height:300,child: Text("Update")) ),
                                                 ],
                                               ),
                                             ) ,) ,

                                           );

                                         }
                                         );

                                       }, icon:Icon(Icons.update),color:Colors.green ,),
                                       IconButton(onPressed: ()async{
                                         await todo!.deleteAt(index);
                                       }, icon:Icon(Icons.delete),color:Colors.red,),
                                     ],
                                   ),
                                 ) ,
                               ),
                             );
                        }
                        );
                  } ,

                ) , )),
            ],
          ),
        ),
      ),
    );
  }
}
