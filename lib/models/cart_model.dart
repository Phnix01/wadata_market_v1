import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final String CartId;
  final String productId;
  final int quantity;

  CartModel(
      {required this.CartId, required this.productId, required this.quantity});
}
