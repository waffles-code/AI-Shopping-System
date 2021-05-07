import 'package:aishop/components/textlink.dart';
import 'package:flutter/material.dart';

class CheckOutAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Expanded(
            child: ListView(children: <Widget>[
              ListTile(
                title: Align(
                  child: Text(
                    "Home",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  alignment: Alignment(-0.95, 0),
                ),
                subtitle: Align(
                  child: TextLink(
                    text: "11 Maclaren st,MarshallTown,Johannesburg",
                    align: Alignment.center,
                    press: () => {},
                  ),
                  alignment: Alignment(-0.7, 0),
                ),
                leading: Icon(Icons.house, size: 20, color: Colors.black),
              ),
              Divider(
                height: 10,
                thickness: 2,
                indent: 10,
                endIndent: 10,
                color: Colors.black,
              ),
              ListTile(
                title: Align(
                  child: Text(
                    "Work",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  alignment: Alignment(-0.95, 0),
                ),
                subtitle: Align(
                  child: TextLink(
                    text: "104 Stiemens st,Braamfontein,Johannesburg",
                    align: Alignment.center,
                    press: () => {},
                  ),
                  alignment: Alignment(-0.7, 0),
                ),
                leading: Icon(Icons.work, size: 20, color: Colors.black),
              ),
              Divider(
                height: 10,
                thickness: 2,
                indent: 10,
                endIndent: 10,
                color: Colors.black,
              ),
              ListTile(
                title: TextLink(
                  text: "Add new Address",
                  align: Alignment.center,
                  press: () => {},
                ),
                leading: Icon(Icons.add, size: 20, color: Colors.black),
              ),
            ]),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: 0.0, top: 0.0, bottom: 0.0, right: 400.0),
                  child: Text("Name",
                      style: new TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 15.0)),
                ),
                Container(
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //====================================================================================row

                        children: [
                      Container(
                          width: 450,
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
                Container(
                  margin: EdgeInsets.only(
                      left: 0.0, top: 0.0, bottom: 0.0, right: 350.0),
                  child: Text("Street Address",
                      style: new TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 15.0)),
                ),
                Container(
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //====================================================================================row
                        children: [
                      Container(
                          width: 450,
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
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //====================================================================================row
                        children: [
                      Container(
                          width: 450,
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
                Container(
                  margin: EdgeInsets.only(
                      left: 0.0, top: 0.0, bottom: 0.0, right: 400.0),
                  child: Text("City",
                      style: new TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 15.0)),
                ),
                Container(
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //====================================================================================row
                        children: [
                      Container(
                          width: 450,
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
                Container(
                  margin: EdgeInsets.only(
                      left: 0.0, top: 0.0, bottom: 0.0, right: 400.0),
                  child: Text("Province",
                      style: new TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 15.0)),
                ),
                Container(
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //====================================================================================row
                        children: [
                      Container(
                          width: 450,
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
                Container(
                  margin: EdgeInsets.only(
                      left: 0.0, top: 0.0, bottom: 0.0, right: 400.0),
                  child: Text("Zip Code",
                      style: new TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 15.0)),
                ),
                Container(
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //====================================================================================row
                        children: [
                      Container(
                          width: 450,
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
                    ]
                        //====================================================================================rowEnded
                        )),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  height: 20,
                  thickness: 2,
                  indent: 0,
                  endIndent: 20,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //====================================================================================row

                        children: [
                      Container(
                        width: 300,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              onPrimary: Colors.black, // background
                              primary: Colors.black,
                              textStyle: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w300,
                              ),
                              side: BorderSide(color: Colors.black, width: 2),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                            onPressed: () {},
                            child: Text("Save Address",
                                style: new TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20.0))),
                      ),
                    ])),
                SizedBox(
                  height: 20,
                ),
                Container(
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //====================================================================================row

                        children: [
                      Container(
                        width: 300,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              onPrimary: Colors.black, // background
                              primary: Colors.white,
                              textStyle: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w300,
                              ),
                              side: BorderSide(color: Colors.black, width: 2),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                            onPressed: () {},
                            child: Text("Discard",
                                style: new TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20.0))),
                      ),
                    ])),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
