import 'package:flutter/material.dart';
import 'package:smart_shop_v1/models/whishlist_model.dart';
import 'package:uuid/uuid.dart';


class WhishlistProvider with ChangeNotifier{
  final Map<String, WhishListModel> _whishlistItems={};
  Map<String,WhishListModel> get getWhishlists{
    return _whishlistItems;
  }


}