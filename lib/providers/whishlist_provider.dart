import 'package:flutter/material.dart';
import 'package:smart_shop_v1/models/whishlist_model.dart';
import 'package:uuid/uuid.dart';


class WhishlistProvider with ChangeNotifier{
  final Map<String, WhishListModel> _whishlistItems={};
  Map<String,WhishListModel> get getWhishlists{
    return _whishlistItems;
  }

  void addOrRemoveFromWhishlist({required String productId}){
    if(_whishlistItems.containsKey(productId)){
      _whishlistItems.remove(productId);
    }
    else{
      _whishlistItems.putIfAbsent(productId, ()=> WhishListModel(whishListId: const Uuid().v4(), productId: productId));
    }
    notifyListeners();
  }

}