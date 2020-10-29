import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ohstel_logicstic_app/market/paid_market_orders_model.dart';

class MarketMethods {
  CollectionReference productRef = FirebaseFirestore.instance
      .collection('market')
      .doc('products')
      .collection('allProducts');

  CollectionReference productOrdersRef =
  FirebaseFirestore.instance.collection('marketOrders');

  final CollectionReference shopCollection =
  FirebaseFirestore.instance.collection('shopOwnersData');

  CollectionReference productCategoriesRef = FirebaseFirestore.instance
      .collection('market')
      .doc('categories')
      .collection('productsList');


  Future updateOrder({
    @required PaidOrderModel paidOrder,
    @required String id,
  }) async {
    bool doneWith = false;
    try {
      print('saving');
      print(id);
      print('saving');

      paidOrder.orders.forEach((element) {
        Map data = element;
        String status = data['deliveryStatus'];
        if (status == 'Delivered To Buyer') {
          doneWith = true;
        } else {
          doneWith = false;
        }
        print(doneWith);
      });

      await productOrdersRef.doc(id).update({
        'orders': paidOrder.orders,
        'doneWith': doneWith,
      });
      print('Updated!!');
      Fluttertoast.showToast(msg: 'Updated!!');
    } catch (err) {
      print(err);
      Fluttertoast.showToast(msg: '$err');
    }
  }


}
