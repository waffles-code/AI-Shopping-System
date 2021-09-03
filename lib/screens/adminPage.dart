import 'dart:ui';
import 'package:aishop/Services/historytracker.dart';
import 'package:aishop/components/order_review.dart';
import 'package:aishop/icons/icons.dart';
import 'package:aishop/theme.dart';
import 'package:aishop/utils/cart.dart';
import 'package:aishop/widgets/appbar.dart';
import 'package:aishop/widgets/modal_model.dart';
import 'package:aishop/widgets/wishlist_product_card.dart';
import 'package:flutter/material.dart';
import 'package:aishop/utils/wishlist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../theme.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPage createState() => _AdminPage();
}

class _AdminPage extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: MyAppBar(
        title: Text(
          'ACCURANCY PAGE',
        ),
        context: context,
      ),
    );
  }
}

// ignore: camel_case_types
