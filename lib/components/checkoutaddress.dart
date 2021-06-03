import 'package:aishop/components/checkoutdelivary.dart';
import 'package:aishop/components/first_delivary_page.dart';
import 'package:aishop/components/textlink.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

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
                        height: 300,
                        margin: const EdgeInsets.all(50.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: lightblack)),
                        child: ListView(children: <Widget>[
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
                              child: TextLink(
                                text:
                                    "11 Maclaren st , MarshallTown , Johannesburg ",
                                align: Alignment.center,
                                press: () => {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          CheckOutDelivery()))
                                },
                              ),
                              alignment: Alignment(-0.7, 0),
                            ),
                            leading:
                                Icon(Icons.house, size: 20, color: lightblack),
                          ),
                          Divider(
                            height: 20,
                            thickness: 2.5,
                            indent: 30,
                            endIndent: 30,
                            color: lightblack,
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
                                    "104 Stiemens st , Braamfontein , Johannesburg ",
                                align: Alignment.center,
                                press: () => {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          CheckOutDelivery()))
                                },
                              ),
                              alignment: Alignment(-0.7, 0),
                            ),
                            leading:
                                Icon(Icons.work, size: 20, color: lightblack),
                          ),
                          Divider(
                            height: 20,
                            thickness: 2.5,
                            indent: 30,
                            endIndent: 30,
                            color: lightblack,
                          ),
                          ListTile(
                            title: Align(
                              child: Text(
                                "Other Address",
                                style: TextStyle(
                                    fontSize: 16.5,
                                    fontWeight: FontWeight.bold),
                              ),
                              alignment: Alignment(-1, 0),
                            ),
                            subtitle: Align(
                              child: TextLink(
                                text: "Add Address",
                                align: Alignment.center,
                                press: () => {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          CheckOutDelivery()))
                                },
                              ),
                              alignment: Alignment(-1, 0),
                            ),
                            leading:
                                Icon(Icons.add, size: 22, color: lightblack),
                          ),
                          Divider(
                            height: 15,
                            thickness: 2.5,
                            indent: 30,
                            endIndent: 30,
                            color: lightblack,
                          ),
                        ]),
                      ))
                    ]))
              ])),
        ],
      ),
    );
  }
}
