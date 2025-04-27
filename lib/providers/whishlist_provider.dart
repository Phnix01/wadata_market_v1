import 'package:flutter/material.dart';
import 'package:smart_shop_v1/models/whishlist_model.dart';
import 'package:uuid/uuid.dart';


class WishlistProvider with ChangeNotifier{
  final Map<String, WhishListModel> _wishlistItems={};
  Map<String,WhishListModel> get getWishlists{
    return _wishlistItems;
  }

  void addOrRemoveFromWishlist({required String productId}){
    if(_wishlistItems.containsKey(productId)){
      _wishlistItems.remove(productId);
    }
    else{
      _wishlistItems.putIfAbsent(productId, ()=> WhishListModel(whishListId: const Uuid().v4(), productId: productId));
    }
    notifyListeners();
  }
  bool isProdinWishlist({required String productId}){
    return _wishlistItems.containsKey(productId);
  }

  void clearLocalWishlist(){
    if(_wishlistItems.isNotEmpty){
      _wishlistItems.clear();
    }
    notifyListeners();
  }
}