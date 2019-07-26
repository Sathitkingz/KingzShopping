import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kingz_shopping/models/product_model.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
// Explicit
  Firestore fireStore = Firestore.instance;
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> snapShots;
  List<ProductModel> lstProductModel = [];

// Method
  @override
  void initState() {
    super.initState();
    readFirebase();
  }

  Future<void> readFirebase() async {
    CollectionReference collectionReference = fireStore.collection('Product');
    subscription = await collectionReference.snapshots().listen((response) {
      snapShots = response.documents;
      for (var snapShot in snapShots) {
        String nameProduct = snapShot.data['Name'];
        print('Name =>> $nameProduct');
        ProductModel productModel = ProductModel.fromFireStore(snapShot.data);
        print('Product >> $productModel');
        setState(() {
          lstProductModel.add(productModel);
        });
      }
    });
  }

  Widget showListProduct() {
    return ListView.builder(
      itemCount: lstProductModel.length,
      itemBuilder: (BuildContext context, int index) {
        //return Text(lstProductModel[index].name);
        return Row(
          children: <Widget>[
            showImage(index),
            showText(index),
          ],
        );
      },
    );
  }

  Widget showText(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(lstProductModel[index].name),
        Text(lstProductModel[index].price),
      ],
    );
  }

  Widget showImage(int index) {
    return Container(
      padding: EdgeInsets.all(8.0),
      height: 100.0,
      child: Image.network(
        lstProductModel[index].imagePath,
        fit: BoxFit.contain,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // return Text('This is page 1');
    return showListProduct();
  }
}
