import 'package:aishop/components/checkoutdelivary.dart';
import 'package:aishop/components/first_delivary_page.dart';
import 'package:aishop/components/textlink.dart';
import 'package:flutter/material.dart';

class CheckOutAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Expanded(
              flex: 2,
              child: ListView(children: <Widget>[
                Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                      Expanded(
                          child: Container(
                        width: 450,
                        height: 500,
                        margin: const EdgeInsets.all(50.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: ListView(children: <Widget>[
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
                              child: TextLink(
                                text:
                                    "11 Maclaren st,MarshallTown,Johannesburg",
                                align: Alignment.center,
                                press: () => {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          CheckOutDelivary()))
                                },
                              ),
                              alignment: Alignment(-0.7, 0),
                            ),
                            leading: Icon(Icons.house,
                                size: 20, color: Colors.black),
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
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              alignment: Alignment(-0.95, 0),
                            ),
                            subtitle: Align(
                              child: TextLink(
                                text:
                                    "104 Stiemens st,Braamfontein,Johannesburg",
                                align: Alignment.center,
                                press: () => {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          CheckOutDelivary()))
                                },
                              ),
                              alignment: Alignment(-0.7, 0),
                            ),
                            leading:
                                Icon(Icons.work, size: 20, color: Colors.black),
                          ),
                          Divider(
                            height: 10,
                            thickness: 2,
                            indent: 10,
                            endIndent: 10,
                            color: Colors.black,
                          ),
                        ]),
                      ))
                    ]))
              ])),
          Expanded(
            flex: 2,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 35,
                ),
                Divider(
                  height: 30.0,
                  thickness: 2,
                  indent: 50,
                  endIndent: 50,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: 0.0, top: 0.0, bottom: 0.0, right: 10.0),
                  child: TextLink(
                    text: "Is this your address you want to deliver to",
                    align: Alignment.center,
                    press: () => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              CheckOutDelivary()))
                    },
                  ),
                ),
                Divider(
                  height: 35,
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                  color: Colors.black,
                ),
                Container(
                    width: 430,
                    child: Row(children: <Widget>[
                      Expanded(
                        child: Divider(color: Colors.black, thickness: 5),
                      ),
                      Container(
                          child: Text("OR"),
                          margin:
                              const EdgeInsets.only(left: 20.0, right: 20.0)),
                      Expanded(
                          child: Divider(color: Colors.black, thickness: 5)),
                    ])),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  height: 20,
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                  color: Colors.black,
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: 0.0, top: 0.0, bottom: 0.0, right: 10.0),
                  child: TextLink(
                    text: "Add the address you want to delivart to",
                    align: Alignment.center,
                    press: () => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              FirstDelivaryPage()))
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  height: 30,
                  thickness: 2,
                  indent: 50,
                  endIndent: 50,
                  color: Colors.black,
                ),
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
