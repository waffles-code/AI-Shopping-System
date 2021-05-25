import 'package:aishop/utils/authentication.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PastPurchase extends StatefulWidget {
  PastPurchase();

  @override
  PastPurchaseState createState() => PastPurchaseState();
}

class PastPurchaseState extends State<PastPurchase> {
  PastPurchaseState();

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
                  return GestureDetector(
                    onTap: () {
                      // This Will Call When User Click On ListView Item
                      // showDialogFunc(context, imgList[index], titleList[index], descList[index]);
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