import 'package:aishop/components/checkoutdelivary.dart';
import 'package:aishop/components/checkoutpayment.dart';
import 'package:flutter/material.dart';
import 'package:aishop/components/checkoutaddress.dart';
import 'package:aishop/components/checkoutorderreview.dart';

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
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.black,
                bottom: TabBar(
                    indicatorColor: Colors.white,
                    labelColor: Colors.white,
                    tabs: [
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
            body: OrderReview(),
          )),
        ],
      ),
    );
  }
}
