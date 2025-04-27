import 'package:flutter/material.dart';

class WhishListModel with ChangeNotifier{
  final String whishListId;
  final String productId;

  WhishListModel({ required this.whishListId, required this.productId});
}