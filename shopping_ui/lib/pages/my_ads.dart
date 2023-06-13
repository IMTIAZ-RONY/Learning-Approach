
import 'package:flutter/material.dart';

class MyAds extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'My Ads',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          bottom: TabBar(
            indicatorColor: Colors.purple,
            labelColor: Colors.black,
            indicatorWeight: 3,
            tabs: [
              Tab(
                //text: 'My Cart',
                child: Column(
                  children: [
                    Icon(Icons.shopping_bag_outlined,color:Colors.greenAccent ,),
                    SizedBox(
                      height: 2,
                    ),
                    Text('My Ads')
                  ],
                ),
              ),
              Tab(
                //text: 'My Favourite',
                child: Column(
                  children: [
                    Icon(Icons.favorite_outline,color: Colors.pink,),
                    SizedBox(
                      height: 2,
                    ),
                    Text('My Favourite')
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SizedBox(height:250 ,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.65,
                ),
                itemCount: 2,
                itemBuilder: (_, index) {
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

                },
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 25,
                  left: 25,
                  top: 20,
                ),
                child: ListView.builder(
                  itemCount:2,
                  itemBuilder: (_, index) {
                    return Card(
                      elevation: 5,
                      shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(10) ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(
                              "assets/Apple Watch .png",

                          ),
                        ),
                        title: Text(
                          "Apple Watch",
                          style: TextStyle(
                            fontSize:16 ,
                            fontWeight: FontWeight.w600,color:Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          "Series6.Red",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,color:Colors.blue,
                          ),
                        ),
                        trailing: Text(
                          "\$ 359",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF5956E9),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
