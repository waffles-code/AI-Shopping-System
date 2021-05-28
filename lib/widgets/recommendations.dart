import 'package:aishop/utils/authentication.dart';
import 'package:aishop/widgets/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Recommendations extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Recommendations();
  }
}

class _Recommendations extends State<Recommendations> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<DocumentSnapshot> recommendations = [];
    // ignore: non_constant_identifier_names
    List<DocumentSnapshot> Purchases = [];
    return Container(
        height: 400,
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("Users")
                .doc(uid)
                .collection("History")
                .snapshots(),
            builder: (context, snapshot1) {
              return StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("Products")
                      .snapshots(),
                  builder: (context, snapshot) {
                    return StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("Users")
                            .doc(uid)
                            .collection("Purchases")
                            .snapshots(),
                        builder: (context, snapshot2) {
                          if (snapshot1.hasData && snapshot2.hasData) {
                            recommendations = snapshot1.data!.docs;
                            Purchases = snapshot2.data!.docs;
                            //Ensuring that we don't recommend products that you bought
                            for (var i = 0; i < recommendations.length; i++) {
                              for (var j = 0; j < Purchases.length; j++) {
                                if (recommendations[i].id == Purchases[j].id) {
                                  recommendations.removeAt(i);
                                }
                              }
                            }
                            if (recommendations.length > 3) {
                              recommendations..shuffle();
                              for (var i = 0; i < recommendations.length; i++) {
                                return GridView.builder(
                                  scrollDirection: Axis.horizontal,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 1,
                                          childAspectRatio: 3 / 2,
                                          mainAxisSpacing: 0),
                                  itemBuilder: (context, index) {
                                    return ProductCard(
                                      recommendations[index].id,
                                      recommendations[index].get('url'),
                                      recommendations[index].get('name'),
                                      recommendations[index].get('description'),
                                      recommendations[index]
                                          .get('price')
                                          .toString(),
                                    );
                                  },
                                  itemCount: 3,
                                );
                              }
                            } else {
                              for (var i = 0; i < recommendations.length; i++) {
                                return GridView.builder(
                                  scrollDirection: Axis.horizontal,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 1,
                                          childAspectRatio: 3 / 2,
                                          mainAxisSpacing: 0),
                                  itemBuilder: (context, index) {
                                    return ProductCard(
                                      recommendations[index].id,
                                      recommendations[index].get('url'),
                                      recommendations[index].get('name'),
                                      recommendations[index].get('description'),
                                      recommendations[index]
                                          .get('price')
                                          .toString(),
                                    );
                                  },
                                  itemCount: recommendations.length,
                                );
                              }
                            }
                          } else {
                            return Text("No Recommendations yet");
                          }
                          throw '';
                        });
                  });
            }));
  }
}
