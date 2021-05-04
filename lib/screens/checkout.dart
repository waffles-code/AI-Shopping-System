import 'package:flutter/material.dart';

import '../components/google_round_button.dart';
import '../components/round_button.dart';
import '../components/round_button.dart';

class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}


class _CheckOutPageState extends State<CheckOutPage> {
  @override


  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,

      child: Row(
        children:<Widget> [
          Expanded(
            flex: 2,
            child: Scaffold(
              appBar: AppBar(
                title: Text("Checkout Page",textWidthBasis: TextWidthBasis.parent,),
                backgroundColor: Colors.black,
                bottom: TabBar(
                  indicatorColor: Colors.white,
                tabs: [Tab(text: "Address",),
                  Tab(text: "Delivery",),
                  Tab(text:"Payment",)]
                ),
              ),
              body: TabBarView(
                children: [
                Column(children:<Widget> [
                  SizedBox(height: 10,),
                  ListTile(title: Align(child: Text("Home",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),alignment: Alignment(-0.95,0),),subtitle: Align(child: Text("11 Maclaren st,MarshallTown,Johannesburg",style:TextStyle(fontSize:30 ),),alignment: Alignment(-0.7,0),),leading: Icon(Icons.house,size: 50),),
                  Divider(color: Colors.grey,),
                  ListTile(title: Align(child: Text("Work",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),alignment: Alignment(-0.95,0),),subtitle: Align(child: Text("104 Stiemens st,Braamfontein,Johannesburg",style:TextStyle(fontSize:30 ),),alignment: Alignment(-0.7,0),),leading: Icon(Icons.work,size: 50),),
                  Divider(color: Colors.grey,),
                  ListTile(title: Text("Add new Address",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),leading: Icon(Icons.add,size: 60),),
                ],),
                  Center(child: Text("Welcome to the Delivery page")),
                  Center(child: Text("Welcome to Payment"),)
                ],
              ),
            ),
          ),
         Expanded(child: Scaffold(
           backgroundColor: Colors.black,
            appBar: AppBar(title:Text('Order Review',style: TextStyle(fontSize: 25,color:Colors.black,fontWeight: FontWeight.bold),),
            toolbarHeight: 105,backgroundColor: Colors.white60,),
          ))
        ],
      ),
    );
  }
}
