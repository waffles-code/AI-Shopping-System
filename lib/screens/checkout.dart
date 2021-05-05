import 'package:aishop/components/checkoutdelivary.dart';
import 'package:aishop/components/checkoutpayment.dart';
import 'package:flutter/material.dart';
import 'package:aishop/screens/checkoutaddress.dart';

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
                children: <Widget>[
                  CheckOutAddress(),
                  CheckOutDelivary(),
                  CheckOutPayment(),
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
              toolbarHeight: 100,
              backgroundColor: Colors.white60,
            ),
          )),
        ],
      ),
    );
  }
}
