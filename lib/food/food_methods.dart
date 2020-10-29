import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ohstel_logicstic_app/food/paid_food_model.dart';

class FoodMethods {
  final CollectionReference foodCollectionRef =
      FirebaseFirestore.instance.collection('food');

  final CollectionReference orderedFoodCollectionRef =
      FirebaseFirestore.instance.collection('orderedFood');

  Future updateItemDetails({
    @required List itemDetails,
    @required String fastFoodName,
  }) async {
    try {
      print('lolll');

      await foodCollectionRef.doc(fastFoodName).update({
        'itemDetails': itemDetails,
      });
      print('Updated!!');
      Fluttertoast.showToast(msg: 'Updated!!');
    } catch (err) {
      print(err);
      Fluttertoast.showToast(msg: '$err');
    }
  }

  Future updateFoodOrder(
      {@required PaidFood paidOrder, @required String id}) async {
    bool doneWith = false;
    try {
      print('saving');
      print(id);
      print('saving');

      paidOrder.orders.forEach((element) {
        Map data = element;
        String status = data['status'];
        if (status == 'Delivered To Buyer') {
          doneWith = true;
        } else {
          doneWith = false;
        }
        print(doneWith);
      });

      await orderedFoodCollectionRef.doc(id).update({
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

  Future deleteFastFood({@required String docId}) async {
    await foodCollectionRef.doc(docId).delete();
  }
}
