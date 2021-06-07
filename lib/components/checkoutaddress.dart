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
                            border: Border.all(color: lightblack, width: 7)),
                        child: ListView(children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontSize: 17,
                              ),
                              children: [
                                WidgetSpan(
                                    child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(19, 10, 15, 0),
                                  child: Icon(Icons.home),
                                )),
                                TextSpan(
                                    text: 'Home',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    )),
                                WidgetSpan(
                                  child: TextLink(
                                    text:
                                        "11 Maclaren st,MarshallTown,Johannesburg ",
                                    align: Alignment.center,
                                    press: () => {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  CheckOutDelivery()))
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 20,
                            thickness: 2.5,
                            indent: 30,
                            endIndent: 30,
                            color: lightblack,
                          ),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontSize: 17,
                              ),
                              children: [
                                WidgetSpan(
                                    child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(19, 10, 15, 0),
                                  child: Icon(Icons.work),
                                )),
                                TextSpan(
                                    text: 'Work',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    )),
                                WidgetSpan(
                                  child: TextLink(
                                    text:
                                        "104 Stiemens st , Braamfontein , Johannesburg ",
                                    align: Alignment.center,
                                    press: () => {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  CheckOutDelivery()))
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 20,
                            thickness: 2.5,
                            indent: 30,
                            endIndent: 30,
                            color: lightblack,
                          ),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontSize: 17,
                              ),
                              children: [
                                WidgetSpan(
                                    child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(19, 10, 15, 0),
                                  child: Icon(Icons.home),
                                )),
                                TextSpan(
                                    text: 'Other Address',
                                    style: TextStyle(
                                      fontSize: 15.5,
                                      fontWeight: FontWeight.bold,
                                    )),
                                WidgetSpan(
                                  child: TextLink(
                                    text: " Add Address ",
                                    align: Alignment.center,
                                    press: () => {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  FirstDelivaryPage()))
                                    },
                                  ),
                                ),
                              ],
                            ),
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
