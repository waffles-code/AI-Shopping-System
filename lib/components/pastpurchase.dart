import 'package:aishop/utils/authentication.dart';
import 'package:flutter/material.dart';
import 'package:aishop/widgets/modal_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../theme.dart';

class PastPurchase extends StatefulWidget {

  @override
  PastPurchaseState createState() => PastPurchaseState();
}

class PastPurchaseState extends State<PastPurchase> {

  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: null,
        appBar: AppBar(
          title: Text(
            "Past Transactions",
          ),
          elevation: 0,
          backgroundColor: Colors.black,
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('Users').doc(uid
            ).collection("Purchases").snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index)
              {
                  return InkWell (
                    onTap: () {
                      Modal(context,
                          snapshot.data!.docs[index].id,
                          snapshot.data!.docs[index].get('url'),
                          snapshot.data!.docs[index].get('name'),
                          snapshot.data!.docs[index].get('description'),
                          snapshot.data!.docs[index].get('price').toString()
                      );
                    },
                    // Card Which Holds Layout Of ListView Item
                    child: Card(
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Image.network(snapshot.data!.docs[index].get('url')),
                            width: 100,
                            height: 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  snapshot.data!.docs[index].get('name'),
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 500,
                                  child: Text(
                                    snapshot.data!.docs[index].get('description'),
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey[500]),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(
                                        left: 800.0,
                                        top: 0.0,
                                        bottom: 12.0,
                                        right: 0.0),
                                    child: Text("Purchased on : " + snapshot.data!.docs[index].get('date').toDate().toString() ,
                                        style: new TextStyle(
                                            color: lightblack,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 20.0))),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                );
            }
        )
    );
  }
}