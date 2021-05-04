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
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  "Checkout Page",
                  textWidthBasis: TextWidthBasis.parent,
                ),
                backgroundColor: Colors.black,
                bottom: TabBar(indicatorColor: Colors.white, tabs: [
                  Tab(
                    text: "Address",
                  ),
                  Tab(
                    text: "Delivery",
                  ),
                  Tab(
                    text: "Payment",
                  )
                ]),
              ),
              body: TabBarView(
                children: [
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        title: Align(
                          child: Text(
                            "Home",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          alignment: Alignment(-0.95, 0),
                        ),
                        subtitle: Align(
                          child: Text(
                            "11 Maclaren st,MarshallTown,Johannesburg",
                            style: TextStyle(fontSize: 15),
                          ),
                          alignment: Alignment(-0.7, 0),
                        ),
                        leading:
                            Icon(Icons.house, size: 20, color: Colors.black),
                      ),
                      Divider(
                        height: 20,
                        thickness: 2,
                        indent: 20,
                        endIndent: 100,
                        color: Colors.black,
                      ),
                      ListTile(
                        title: Align(
                          child: Text(
                            "Work",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          alignment: Alignment(-0.95, 0),
                        ),
                        subtitle: Align(
                          child: Text(
                            "104 Stiemens st,Braamfontein,Johannesburg",
                            style: TextStyle(fontSize: 15),
                          ),
                          alignment: Alignment(-0.7, 0),
                        ),
                        leading:
                            Icon(Icons.work, size: 20, color: Colors.black),
                      ),
                      Divider(
                        height: 20,
                        thickness: 2,
                        indent: 20,
                        endIndent: 100,
                        color: Colors.black,
                      ),
                      ListTile(
                        title: Text(
                          "Add new Address",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: Icon(Icons.add, size: 20, color: Colors.black),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        height: 20,
                        thickness: 2,
                        indent: 20,
                        endIndent: 100,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Name",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //====================================================================================row

                              children: [
                            Container(
                                width: 500,
                                height: 50,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    fillColor: Colors.black87,
                                    hintText: 'new Address',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 2.0),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 2.0),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  style: TextStyle(
                                      fontFamily: 'Nunito Sans',
                                      fontWeight: FontWeight.w300),
                                )),
                            //====================================================================================row
                          ]
                              //====================================================================================rowEnded
                              )),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Street Address",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //====================================================================================row
                              children: [
                            Container(
                                width: 500,
                                height: 50,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    fillColor: Colors.black87,
                                    hintText: 'Street and number / P.O. box',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 2.0),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 2.0),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  style: TextStyle(
                                      fontFamily: 'Nunito Sans',
                                      fontWeight: FontWeight.w300),
                                )),
                            //====================================================================================row
                          ]
                              //====================================================================================rowEnded
                              )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //====================================================================================row
                              children: [
                            Container(
                                width: 500,
                                height: 50,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    fillColor: Colors.black87,
                                    hintText:
                                        'Apartment, suit, unit, building, floor etc',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 2.0),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 2.0),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  style: TextStyle(
                                      fontFamily: 'Nunito Sans',
                                      fontWeight: FontWeight.w300),
                                )),
                            //====================================================================================row
                          ]
                              //====================================================================================rowEnded
                              )),
                      SizedBox(
                        height: 15,
                      ),
                      Text("City",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //====================================================================================row
                              children: [
                            Container(
                                width: 500,
                                height: 50,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    fillColor: Colors.black87,
                                    hintText: ' ',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 2.0),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 2.0),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  style: TextStyle(
                                      fontFamily: 'Nunito Sans',
                                      fontWeight: FontWeight.w300),
                                )),
                            //====================================================================================row
                          ]
                              //====================================================================================rowEnded
                              )),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Province",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //====================================================================================row
                              children: [
                            Container(
                                width: 500,
                                height: 50,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    fillColor: Colors.black87,
                                    hintText: ' ',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 2.0),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 2.0),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  style: TextStyle(
                                      fontFamily: 'Nunito Sans',
                                      fontWeight: FontWeight.w300),
                                )),
                            //====================================================================================row
                          ]
                              //====================================================================================rowEnded
                              )),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Zip Code",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //====================================================================================row
                              children: [
                            Container(
                                width: 500,
                                height: 50,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    hintText: '',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 2.0),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 2.0),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  style: TextStyle(
                                      fontFamily: 'Nunito Sans',
                                      fontWeight: FontWeight.w300),
                                )),
                            //====================================================================================row

                            SizedBox(
                              height: 10,
                            ),

                            Divider(
                              height: 20,
                              thickness: 2,
                              indent: 20,
                              endIndent: 150,
                              color: Colors.black,
                            ),

                            SizedBox(
                              height: 10,
                            ),
                          ]
                              //====================================================================================rowEnded
                              )),
                    ],
                  ),
                  Center(child: Text("Welcome to the Delivery page")),
                  Center(
                    child: Text("Welcome to Payment"),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              title: Text(
                'Order Review',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              toolbarHeight: 105,
              backgroundColor: Colors.white60,
            ),
          ))
        ],
      ),
    );
  }
}
