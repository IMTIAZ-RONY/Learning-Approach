

import 'package:flutter/material.dart';

class Home extends StatelessWidget {

List<String>_categories=["Food","Watch","Groceries","Sports","Cloth","Books","Movies"];
List<Color>_colors=[Colors.blue,Colors.red,Colors.green,Colors.yellow,Colors.teal,Colors.pink,Colors.purple];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

          child: NestedScrollView(
            headerSliverBuilder:(context,innerBoxIsScrolled)=>[
              SliverList(
                delegate:SliverChildListDelegate([
                  Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Text("Hello ! Imtiaz",style:TextStyle(fontSize:30,fontWeight:FontWeight.bold ,
                          color:Colors.green  ) ,) ,
                      Text("Let's gets something?",style:TextStyle(fontSize:20,fontWeight:FontWeight.bold ,
                          color:Colors.black87 ) ,) ,
                      SizedBox(height:10 ,),
                      Container(
                        height:130 ,

                        child: ListView(
                          scrollDirection:Axis.horizontal,
                          children: [
                            Container(
                              height:130 ,
                              width:230,
                              decoration:BoxDecoration(
                                color:Colors.amber ,
                                borderRadius:BorderRadius.circular(10) ,

                              ) ,
                              child:Padding(
                                padding: const EdgeInsets.only(left:10,top:10 ,),
                                child: Column(
                                  crossAxisAlignment:CrossAxisAlignment.start ,
                                  children: [
                                    Text("40% Off During\nCovid 19",style:TextStyle(fontSize:22,fontWeight:FontWeight.bold ,
                                        color:Colors.white  ) ,) ,
                                    Align(
                                        alignment:Alignment.centerRight ,
                                        child: Image.asset("assets/fruits-vegetables.png",width:120,height:68 ,)),
                                  ],
                                ),
                              ) ,
                            ),
                            SizedBox(width:10 ,),
                            Container(
                              height:130 ,
                              width:230,
                              decoration:BoxDecoration(
                                color:Colors.blueAccent ,
                                borderRadius:BorderRadius.circular(10) ,

                              ) ,
                              child:Padding(
                                padding: const EdgeInsets.only(left:10,top:10 ,),
                                child: Column(
                                  crossAxisAlignment:CrossAxisAlignment.start ,
                                  children: [
                                    Text("40% Off During\nCovid 19",style:TextStyle(fontSize:22,fontWeight:FontWeight.bold ,
                                        color:Colors.white  ) ,) ,
                                    Align(
                                        alignment:Alignment.centerRight ,
                                        child: Image.asset("assets/fruits-vegetables.png",width:120,height:68 ,)),
                                  ],
                                ),
                              ) ,
                            ),
                            SizedBox(width:10 ,),
                            Container(
                              height:130 ,
                              width:230,
                              decoration:BoxDecoration(
                                color:Colors.purpleAccent ,
                                borderRadius:BorderRadius.circular(10) ,

                              ) ,
                              child:Padding(
                                padding: const EdgeInsets.only(left:10,top:10 ,),
                                child: Column(
                                  crossAxisAlignment:CrossAxisAlignment.start ,
                                  children: [
                                    Text("40% Off During\nCovid 19",style:TextStyle(fontSize:22,fontWeight:FontWeight.bold ,
                                        color:Colors.white  ) ,) ,
                                    Align(
                                        alignment:Alignment.centerRight ,
                                        child: Image.asset("assets/fruits-vegetables.png",width:120,height:68 ,)),
                                  ],
                                ),
                              ) ,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height:10 ,),
                      Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                        children: [
                          Text("Top Categories",style:TextStyle(fontSize:18 ,fontWeight:FontWeight.w900 ,color:Colors.black ) ,),
                          Text("View All",style:TextStyle(fontSize:15 ,fontWeight:FontWeight.w900 ,color:Colors.red ) ,),

                        ],
                      ),
                      SizedBox(height:10 ,),
                      SizedBox(
                        height:50,
                        child:ListView.builder(
                          scrollDirection:Axis.horizontal ,
                          itemCount:_categories.length ,
                          itemBuilder:(context,index){
                            return Padding(
                              padding: const EdgeInsets.only(right:10),
                              child: Container(
                                  decoration:BoxDecoration(
                                    color:_colors[index],
                                    borderRadius:BorderRadius.circular(25),

                                  ) ,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:20 ),
                                    child: Center(child: Text(_categories[index],
                                      style:TextStyle(fontWeight:FontWeight.w600 ) ,)),
                                  )),
                            );

                          },) ,

                      ),
                      SizedBox(height:10 ,),

                    ],

                  ),
                ]) ,
              )
            ] ,
            body:SizedBox(height:250 ,
              child:GridView.builder(
                  scrollDirection:Axis.vertical ,

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing:10 ,
                    crossAxisSpacing: 10,
                    childAspectRatio:0.65,

                  ),
                  itemCount: _categories.length,
                  itemBuilder:(_,index){
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Stack(
                        alignment:Alignment.topCenter,
                        clipBehavior:Clip.none ,
                        children: [
                          Card(
                            elevation: 5,
                        shape:RoundedRectangleBorder(
                             borderRadius:BorderRadius.circular(10) ,
                                ) ,
                            child: Container(
                              height: 300,width: 300,color:Colors.transparent ,
                            ),
                          ),
                          Positioned(
                            top:-25  ,
                            child: Image.asset("assets/Apple Watch .png",
                              height:100 ,width: 80,),
                          ),
                          Positioned(
                            top: 80,
                              child:Text("Apple Watch",style:TextStyle(fontSize: 18,color: Colors.black) ,
                              ),


                          ),
                          Positioned(
                            top: 110,
                            child:Text("Series6.Red",style:TextStyle(fontSize: 18,color: Colors.blue) ,
                            ),


                          ),
                          Positioned(
                            top: 140,
                            child:Text("\$ 359",style:TextStyle(fontSize: 18,color: Colors.green) ,
                            ),


                          ),
                        ],
                      ),
                    );
                  }) ,) ,

          ),
        ),
    );

  }
}
